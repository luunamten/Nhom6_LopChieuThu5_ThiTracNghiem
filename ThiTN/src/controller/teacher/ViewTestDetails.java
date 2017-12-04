package controller.teacher;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;
import dao.TeacherUtil;
import model.LoginBean;
import model.PartBean;
import model.SubjectBean;
import model.TestBean;
import model.ViewTestDetailsBean;

/**
 * Servlet implementation class ViewTestDetails
 */
@WebServlet("/ViewTestDetails")
public class ViewTestDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewTestDetails() {
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
					String semesterID = request.getParameter("smid");
					String subjectID = request.getParameter("suid");
					String testID = request.getParameter("tid");
					String testName = request.getParameter("tname");
					ViewTestDetailsBean test = new ViewTestDetailsBean();
					SubjectBean subject = new SubjectBean();
					test.setId(testID);
					subject.setId(subjectID);
					subject.setName(testName);
					if(this.getOneTest(test)) {
						request.setAttribute("test", test);
						request.setAttribute("subject", subject);
						request.getRequestDispatcher("WEB-INF/teacher/tcViewTestDetails.jsp").forward(request, response);
					} else {
						response.sendRedirect("ViewTests");
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
	}

	private boolean getOneTest(ViewTestDetailsBean test) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement testCmd = con.prepareCall("{call sp_tcLoadOneTestDetails(?)}")) {
			testCmd.setString(1, test.getId());
			try(ResultSet testRes = testCmd.executeQuery()) {
				if(testRes.next()) {
					test.setName(testRes.getString("tendt"));
					test.setBirth(testRes.getString("ngaytao"));
					test.setTeacherID(testRes.getString("magv"));
					test.setStart(testRes.getString("batdauthi"));
					test.setEnd(testRes.getString("thoihan"));
					test.setDuration(testRes.getInt("thoigian"));
					test.setNumQuestion(testRes.getInt("socauhoi"));
					test.setNumStudent(testRes.getInt("sosinhvien"));
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
