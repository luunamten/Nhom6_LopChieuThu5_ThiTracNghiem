package controller.student;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;
import model.ClassBean;
import model.LoginBean;
import model.SubjectBean;
import model.TestBean;
import model.TestingBean;
import model.TestingInfoBean;

/**
 * Servlet implementation class STLoadTestDetails
 */
@WebServlet("/STLoadTestDetails")
public class STLoadTestDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public STLoadTestDetails() {
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
		request.setCharacterEncoding("utf-8");
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean user = (LoginBean)ses.getAttribute("loginBean");
			if(user != null) {
				String userType = user.getUserType();
				if(userType.equals("sv")) {
					String testID = request.getParameter("tid");
					String classID = request.getParameter("cid");
					if(testID != null && !testID.trim().isEmpty() 
							&& classID != null && !classID.trim().isEmpty()) {
						TestBean test = new TestBean();
						ClassBean _class = new ClassBean();
						TestingInfoBean testInfo;
						test.setId(testID);
						_class.setId(classID);
						testInfo = this.getTestingInfo(_class, test, user);
						if(testInfo != null) {
							request.setAttribute("_class", _class);
							request.setAttribute("testInfo", testInfo);
							request.getRequestDispatcher("WEB-INF/student/stViewTestDetails.jsp").forward(request, response);
							return;
						}
					}
					response.sendRedirect("STViewTest");
					return;
				}
			}
		}
		response.sendRedirect("Home");
	}

	private TestingInfoBean getTestingInfo(ClassBean _class, TestBean test, LoginBean user) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement testCmd = con.prepareCall("{call sp_stLoadTestDetails(?,?,?)}");) {
			testCmd.setString(1, _class.getId());
			testCmd.setString(2, test.getId());
			testCmd.setString(3, user.getUsername());
			try(ResultSet testRes = testCmd.executeQuery()) {
				if(testRes.next()) {
					TestingInfoBean testingInfo = new TestingInfoBean();
					SubjectBean subject = new SubjectBean();
					TestingBean testing = new TestingBean();
					TestBean _test = new TestBean();
					subject.setId(testRes.getString("mamh"));
					subject.setName(testRes.getString("tenmh"));
					_test.setId(testRes.getString("madt"));
					_test.setName(testRes.getString("tendt"));
					_test.setStart(testRes.getString("batdauthi"));
					_test.setEnd(testRes.getString("thoihan"));
					_test.setDuration(testRes.getInt("thoigian"));
					testing.setStart(testRes.getString("ngaythi"));
					testing.setCommit(testRes.getBoolean("xacnhan"));
					testing.setTest(_test);
					testingInfo.setTesting(testing);
					testingInfo.setSubject(subject);
					testingInfo.setNumQuestion(testRes.getInt("socauhoi"));
					return testingInfo;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
