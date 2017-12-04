package controller.teacher;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.IfStatement;

import dao.DBConnection;
import dao.TeacherUtil;
import model.LoginBean;
import model.PartBean;
import model.QuestionBean;
import model.SemesterBean;
import model.SubjectBean;
import model.TestBean;
import model.ViewQuestionBean;
import model.ViewTestBean;

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
		HttpSession ses = request.getSession();
		if(ses != null) {
			LoginBean user = (LoginBean)ses.getAttribute("loginBean");
			if(user != null) {
				String semesterID = request.getParameter("select_semester");
				String subjectID = request.getParameter("select_subject");
				String subjectName = request.getParameter("subjectName");
				String searchString = request.getParameter("searchTxt");
				boolean isError = false;
				if(semesterID == null || semesterID.trim().length() == 0) {
					isError = true;
				}
				if(subjectID == null || subjectID.trim().length() == 0) {
					isError = true;
				}
				if(subjectName == null || subjectName.trim().length() == 0) {
					isError = true;
				}
				if(searchString == null) {
					isError = true;
				}
				if(!isError) {
					List<TestBean> tests;
					ViewTestBean viewTest = new ViewTestBean();
					viewTest.setSemesterID(semesterID);
					viewTest.setTeacherID(user.getUsername());
					viewTest.setSubjectID(subjectID);
					viewTest.setSubjectName(subjectName);
					viewTest.setSearchString(searchString);
					tests = this.getTests(viewTest);
					request.setAttribute("tests", tests);
					request.setAttribute("viewTest", viewTest);
					request.getRequestDispatcher("WEB-INF/teacher/tcTestTableRows.jsp").forward(request, response);
				}
			}
		}	
	}
	private List<TestBean> getTests(ViewTestBean viewTest)  {
		try(Connection con = DBConnection.getConnection();
				CallableStatement testsCmd = con.prepareCall("{call sp_tcLoadTests(?,?,?,?)}");) {
			testsCmd.setString(1, viewTest.getSemesterID());
			testsCmd.setString(2, viewTest.getTeacherID());
			testsCmd.setString(3, viewTest.getSubjectID());
			testsCmd.setString(4, viewTest.getSearchString());
			try(ResultSet testsRes = testsCmd.executeQuery()) {
				List<TestBean> tests = new ArrayList<TestBean>();
				while(testsRes.next()) {
					TestBean test = new TestBean();
					test.setId(testsRes.getString("madt"));
					test.setName(testsRes.getString("tendt"));
					test.setBirth(testsRes.getString("ngaytao"));
					test.setDuration(testsRes.getInt("thoigian"));
					test.setStart(testsRes.getString("batdauthi"));
					test.setEnd(testsRes.getString("thoihan"));
					test.setTeacherID(testsRes.getString("magv"));
					tests.add(test);
				}
				return tests;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
