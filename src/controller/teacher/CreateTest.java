package controller.teacher;

import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CreateTestDAO;
import model.LoginBean;

/**
 * Servlet implementation class CreateTestServlet
 */
@WebServlet("/CreateTest")
public class CreateTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateTest() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
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
					request.getRequestDispatcher("WEB-INF/teacher/tcCreateTest.jsp").forward(request, response);
				} else if(userType.equals("sv")) {
					request.getRequestDispatcher("Student").forward(request, response);
				}
				return;
			}
		}
		request.getRequestDispatcher("/Home").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean bean = (LoginBean)ses.getAttribute("loginBean");
			if(bean != null) {			
				DateFormat format = DateFormat.getDateInstance();
				String strStart = request.getParameter("start_time").trim();
				String strEnd = request.getParameter("end_time").trim();
				Date start = null;
				Date end = null;
				int duration;
				try {
					start = format.parse(strStart);
					end = format.parse(strEnd);
					duration = Integer.parseInt(request.getParameter("duration").trim());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return;
				} catch(NumberFormatException exp) {
					exp.printStackTrace();
					return;
				}
				String partID = request.getParameter("select_part").trim();
				String testName = request.getParameter("test_name").trim();
				int timeCmp = start.compareTo(end);
				boolean isError = false;
				if(partID.isEmpty()) {
					isError = true;
					request.setAttribute("partError", "Không được để trống.");
				}
				if(testName.length() < 6) {
					isError = true;
					request.setAttribute("nameError", "Phải tối thiểu 6 kí tự.");
				}
				if(duration < 10) {
					isError = true;
					request.setAttribute("durationError", "Phải tối thiểu 6 kí tự.");
				}
				if(timeCmp == 1 || timeCmp == 0) {
					isError = true;
					request.setAttribute("timeError", "Thời hạn phải lớn hơn ngày bắt đầu thi.");
				}
				if(!isError) {
					CreateTestDAO dao = new CreateTestDAO();
				} 
				request.getRequestDispatcher("WEB-INF/teacher/tcCreateTest.jsp").forward(request, response);
				return;
			}
		}
		response.sendRedirect("Home");
	}

}
