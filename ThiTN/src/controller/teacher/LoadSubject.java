package controller.teacher;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class LoadSubject
 */
@WebServlet("/LoadSubject")
public class LoadSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadSubject() {
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
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession();
		if(ses != null) {
			LoginBean user = (LoginBean)ses.getAttribute("loginBean");
			if(user != null) {
				request.setCharacterEncoding("utf-8");
				String semesterID = request.getParameter("semesterID");
				if(!semesterID.equals("")) {
					SemesterBean semester = new SemesterBean();
					TeacherUtil util = new TeacherUtil();
					List<SubjectBean> subjects;
					semester.setId(semesterID);
					subjects = util.getSubjectsOfSemester(user, semester);
					if(subjects != null) {
						request.setAttribute("items", subjects);
						request.getRequestDispatcher("WEB-INF/common/List.jsp").forward(request, response);
					}
				}
			}
		}
	}

}
