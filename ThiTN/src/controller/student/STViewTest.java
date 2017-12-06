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
import model.StudentBean;
import model.TestingBean;

/**
 * Servlet implementation class STViewTest
 */
@WebServlet("/STViewTest")
public class STViewTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public STViewTest() {
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
			LoginBean user = (LoginBean)ses.getAttribute("loginBean");
			if(user != null) {
				String userType = user.getUserType();
				if(userType.equals("sv")) {
					Util util = new Util();
					List<SemesterBean> semesters = util.getAllSemesters();
					if(semesters != null && semesters.size() > 0) {
						List<ClassBean> classes = util.getStudentClasses(semesters.get(0), user);
						if(classes != null && classes.size() > 0) {
							List<TestingBean> testings = 
									util.getStudentTests(semesters.get(0), classes.get(0), user);
							if(testings != null && testings.size() > 0) {
								request.setAttribute("testings", testings);
							}
							request.setAttribute("classes", classes);
							request.setAttribute("_class", classes.get(0));
						}
						request.setAttribute("semesters", semesters);
					}
					request.getRequestDispatcher("WEB-INF/student/stViewTests.jsp").forward(request, response);
				} else if(userType.equals("gv")) {
					response.sendRedirect("Teacher");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
