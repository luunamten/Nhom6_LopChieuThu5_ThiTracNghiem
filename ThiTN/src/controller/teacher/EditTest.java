package controller.teacher;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;
import model.LoginBean;
import model.TestBean;

/**
 * Servlet implementation class EditTest
 */
@WebServlet("/EditTest")
public class EditTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditTest() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName(DRIVER);
		} catch(ClassNotFoundException exp) {
			exp.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean bean = (LoginBean)ses.getAttribute("loginBean");
			if(bean != null) {
				String userType = bean.getUserType();
				if(userType.equals("gv")) {
					String testID = request.getParameter("test_id");
					String testName = request.getParameter("test_name");
					String testStart = request.getParameter("test_start");
					String testEnd = request.getParameter("test_end");
					String testDuration = request.getParameter("test_duration");
					if(testID != null && testName != null && testStart != null && testEnd != null
							&& testDuration != null && Pattern.matches("^[0-9]+$", testDuration)) {
						TestBean test = new TestBean();
						test.setId(testID);
						test.setName(testName);
						test.setStart(testStart);
						test.setEnd(testEnd);
						test.setDuration(Integer.parseInt(testDuration));
						request.setAttribute("test", test);
						request.getRequestDispatcher("WEB-INF/teacher/tcEditTest.jsp").forward(request, response);
					}
				} else if(userType.equals("sv")) {
					response.sendRedirect("Student");
				}
				return;
			}
		}
		response.sendRedirect("Home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean user = (LoginBean)ses.getAttribute("loginBean");
			if(user != null) {		
				request.setCharacterEncoding("utf-8");
				String testID = request.getParameter("test_id");
				String strStartDate = request.getParameter("test_start_date");
				String strEndDate = request.getParameter("test_end_date");
				String strStartTime = request.getParameter("test_start_time");
				String strEndTime = request.getParameter("test_end_time");
				String testName = request.getParameter("test_name");
				String strDuration = request.getParameter("test_duration");
				String startDateTime = "";
				String endDateTime = "";
				int duration = 0;
				StringBuilder errors = new StringBuilder();
				TestBean test = new TestBean();
				boolean isError = false;
				//Kiem tra loi
				if(testID == null || testID.trim().isEmpty()) {
					isError = true;
					errors.append("> Không thể xác định bài thi cần chỉnh sửa.<br />");
				} else {
					test.setId(testID);
				}
				if(strStartDate == null || strStartDate.isEmpty() || strStartTime == null || strStartTime.isEmpty()) {
					isError = true;
					errors.append("> Không được để trống điểm bắt đầu thi.<br />");
				}
				if(strEndDate == null || strEndDate.isEmpty() || strEndTime == null || strEndTime.isEmpty()) {
					isError = true;
					errors.append("> không được để trống điểm kết thúc.<br />");
				} 
				if(strStartDate != null && strEndDate != null && !strStartDate.isEmpty() && !strEndDate.isEmpty()
						&& strStartTime != null && strEndTime != null && !strStartTime.isEmpty() && !strEndTime.isEmpty()) {
					try {
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						startDateTime = String.format("%s %s", strStartDate, strStartTime);
						endDateTime = String.format("%s %s", strEndDate, strEndTime);
						Date start = formatter.parse(startDateTime);
						Date end = formatter.parse(endDateTime);						
						int timeCmp = start.compareTo(end);
						if(timeCmp == 1 || timeCmp == 0) {
							isError = true;
							errors.append("> Thời điểm bắt đầu thi phải nhỏ hơn thời điểm kết thúc.<br />");
						} else {
							test.setStart(startDateTime);
							test.setEnd(endDateTime);
						}
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						isError = true;
						errors.append("> Không thể xác định thời gian bắt đầu thi hoặc thời hạn.<br />");
						e.printStackTrace();
					}		
				}															
				if(testName == null || testName.trim().length() < 6) {
					isError = true;
					errors.append("> Tên bài thi tối thiểu 6 kí tự.<br />");
				} else {
					test.setName(testName);
				}
				if(strDuration == null || Pattern.matches("^[0-9]+$", strDuration)) {
					duration = Integer.parseInt(strDuration);
					if(duration < 10) {
						isError = true;
						errors.append("> Thời gian thi tối thiểu là 10 phút.<br />");
					} else {
						test.setDuration(duration);
					}
				} else {
					isError = true;
					errors.append("> Không thể xác định thời gian thi.<br />");
				}
				if(!isError) {
					if(this.editTest(test)) {
						request.setAttribute("success", "\u2713\u2713Sửa thông tin bài thi thành công.");
						request.getRequestDispatcher("WEB-INF/common/ReportSuccess.jsp").forward(request, response);
						return;
					} else {
						errors.append("> Sửa thông tin bài thi thất bại.");
						request.setAttribute("errors", errors);
					}
				} else {
					request.setAttribute("errors", errors);
				}
				request.getRequestDispatcher("WEB-INF/common/ReportErrors.jsp").forward(request, response);
			}			
		}
	}

	private boolean editTest(TestBean test) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement editCmd = con.prepareCall("{call sp_tcEditTest(?,?,?,?,?)}")) {
			editCmd.setString(1, test.getId());
			editCmd.setString(2, test.getName());
			editCmd.setString(3, test.getStart());
			editCmd.setString(4, test.getEnd());
			editCmd.setInt(5,  test.getDuration());
			if(editCmd.executeUpdate() > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
