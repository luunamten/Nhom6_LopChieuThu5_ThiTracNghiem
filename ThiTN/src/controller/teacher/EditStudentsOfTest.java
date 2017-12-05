package controller.teacher;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;
import dao.TeacherUtil;
import model.ClassBean;
import model.LoginBean;
import model.SemesterBean;
import model.StudentBean;
import model.StudentCheckBean;
import model.SubjectBean;
import model.TestBean;
import model.TestingBean;

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
		} catch (ClassNotFoundException exp) {
			exp.printStackTrace();
		}
		;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		if (ses != null) {
			LoginBean user = (LoginBean) ses.getAttribute("loginBean");
			if (user != null) {
				String userType = user.getUserType();
				if (userType.equals("gv")) {
					String testID = request.getParameter("mix_test_id");
					String subjectID = request.getParameter("mix_subject_id");
					String semesterID = request.getParameter("mix_semester_id");

					if (testID != null && subjectID != null && semesterID != null) {
						TestBean test = new TestBean();
						SemesterBean semester = new SemesterBean();
						SubjectBean subject = new SubjectBean();
						TeacherUtil util = new TeacherUtil();
						List<ClassBean> classes;
						test.setId(testID);
						semester.setId(semesterID);
						subject.setId(subjectID);
						classes = util.getClasses(semester, user, subject);
						if (classes.size() > 0) {
							List<TestingBean> testings = util.getStudentsAndTest(test, classes.get(0));
							if (testings.size() > 0) {
								request.setAttribute("test", test);
								request.setAttribute("subject", subject);
								request.setAttribute("semester", semester);
								request.setAttribute("classes", classes);
								request.setAttribute("testings", testings);
								request.getRequestDispatcher("WEB-INF/teacher/tcEditStudentsOfTest.jsp")
										.forward(request, response);
							}
						} 
					}
				} else if (userType.equals("sv")) {
					response.sendRedirect("Student");
				}
				return;
			}
		}
		response.sendRedirect("Home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean user = (LoginBean)ses.getAttribute("loginBean");
			if(user != null) {	
				String[] checkValues = request.getParameterValues("check_value");
				String[] studentIDs = request.getParameterValues("student_name");
				String testID = request.getParameter("test_id");
				StringBuilder errors = new StringBuilder();
				if(checkValues != null && checkValues.length != 0 && studentIDs != null && studentIDs.length != 0
						&& testID != null && !testID.trim().isEmpty()) {
					int numStudent = studentIDs.length;
					TestBean test = new TestBean();
					List<StudentCheckBean> checks = new ArrayList<StudentCheckBean>();
					test.setId(testID);
					for(int i = 0; i < numStudent; i++) {
						StudentCheckBean check = new StudentCheckBean();
						StudentBean student = new StudentBean();
						student.setUsername(studentIDs[i]);
						check.setStudent(student);
						check.setChecked((checkValues[i].equals("1"))?true:false);
						checks.add(check);
					}
					request.setAttribute("success", 
							String.format("\u2713\u2713 Đã cập nhật %d sinh viên.", this.updateStudentsOfTest(checks, test)));
					request.getRequestDispatcher("WEB-INF/teacher/tcEditStudentsOfTest.jsp").forward(request, response);
				} else {
					errors.append("> Lưu thất bại.<br />");
				}
			}
		}
	}
	
	private int updateStudentsOfTest(List<StudentCheckBean> checks, TestBean test) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement insCmd = con.prepareCall("{call sp_tcAddStudentsToTest(?,?)}");
				CallableStatement delCmd = con.prepareCall("{call sp_tcDeleteStudentsFromTest(?,?)}");) {
			String testID = test.getId();
			int numIns = 0;
			int numDel = 0;	
			con.setAutoCommit(false);
			for(StudentCheckBean check : checks) {
				if(check.isChecked()) {
					numIns++;
					insCmd.setString(1, testID);
					insCmd.setString(2, check.getStudent().getUsername());
					insCmd.addBatch();
				} else {
					numDel++;
					delCmd.setString(1, testID);
					delCmd.setString(2, check.getStudent().getUsername());
					delCmd.addBatch();
				}
			}
			if(numIns > 0) {
				int[] insRows = insCmd.executeBatch();
				numIns = 0;
				for(int insRow : insRows) {
					numIns += insRow;
				}
			}
			if(numDel > 0) {
				int[] delRows = delCmd.executeBatch();
				numDel = 0;
				for(int delRow : delRows) {
					numDel += delRow;
				}
			}
			con.commit();
			return numDel + numIns;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
