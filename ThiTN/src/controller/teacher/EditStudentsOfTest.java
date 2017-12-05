package controller.teacher;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TeacherUtil;
import model.ClassBean;
import model.LoginBean;
import model.SemesterBean;
import model.SubjectBean;
import model.TestBean;

/**
 * Servlet implementation class EditStudentsOfTest
 */
@WebServlet("/EditStudentsOfTest")
public class EditStudentsOfTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditStudentsOfTest() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName(DRIVER);
		} catch(ClassNotFoundException exp) {
			exp.printStackTrace();
		};
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
				if(userType.equals("gv")) {
					String testID = request.getParameter("mix_test_id");
					String subjectID = request.getParameter("mix_subject_id");
					String semesterID = request.getParameter("mix_semester_id");

					if(testID != null && subjectID != null && semesterID != null) {
						TestBean test = new TestBean();
						SemesterBean semester = new SemesterBean();
						SubjectBean subject = new SubjectBean();
						TeacherUtil util = new TeacherUtil();
						List<ClassBean> classes;
						test.setId(testID);
						semester.setId(semesterID);
						subject.setId(subjectID);
						classes = util.getClasses(semester, user, subject);
						if(classes.size() > 0) {
							request.setAttribute("test", test);
							request.setAttribute("subject", subject);
							request.setAttribute("semester", semester);
							request.setAttribute("classes", classes);
							request.getRequestDispatcher("WEB-INF/teacher/tcEditStudentsOfTest.jsp").forward(request, response);
						}
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
		// TODO Auto-generated method stub
	}

}
