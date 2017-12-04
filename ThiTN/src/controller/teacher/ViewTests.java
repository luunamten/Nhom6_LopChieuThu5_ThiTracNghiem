package controller.teacher;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TeacherUtil;
import model.LoginBean;
import model.PartBean;
import model.SemesterBean;
import model.SubjectBean;

/**
 * Servlet implementation class ViewTests
 */
@WebServlet("/ViewTests")
public class ViewTests extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewTests() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
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
					request.setCharacterEncoding("utf-8");
					TeacherUtil util = new TeacherUtil();
					List<SemesterBean> semesters = util.getAllSemesters();
					if(semesters != null && semesters.size() > 0) {
						List<SubjectBean> subjects = util.getSubjectsOfSemester(user, semesters.get(0));
						if(subjects != null && subjects.size() > 0) {
							request.setAttribute("subjects", subjects);
						}
						request.setAttribute("semesters", semesters);
					}
					request.getRequestDispatcher("WEB-INF/teacher/tcViewTests.jsp").forward(request, response);
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
		doGet(request, response);
	}

}
