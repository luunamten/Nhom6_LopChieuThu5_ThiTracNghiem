package controller.student;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Util;
import model.ClassBean;
import model.LoginBean;
import model.SemesterBean;
import model.TestBean;
import model.TestingBean;

/**
 * Servlet implementation class LoadTesting
 */
@WebServlet("/LoadTesting")
public class LoadTesting extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadTesting() {
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
		} catch (ClassNotFoundException exp) {
			exp.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession ses = request.getSession(false);
		if (ses != null) {
			LoginBean user = (LoginBean) ses.getAttribute("loginBean");
			if (user != null) {
				String userType = user.getUserType();
				if (userType.equals("sv")) {
					String classID = request.getParameter("classID");
					String semesterID = request.getParameter("semesterID");
					if(classID != null && !classID.trim().isEmpty() 
							&& semesterID != null && !semesterID.trim().isEmpty()) {
						Util util = new Util();
						SemesterBean semester = new SemesterBean();
						ClassBean _class = new ClassBean();
						semester.setId(semesterID);
						_class.setId(classID);
						List<TestingBean> testings = 
								util.getStudentTests(semester, _class, user);
						if(testings != null && testings.size() > 0) {
							request.setAttribute("_class", _class);
							request.setAttribute("testings", testings);
							request.getRequestDispatcher("WEB-INF/student/stTestingTableRows.jsp").forward(request, response);
						}
					}
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
