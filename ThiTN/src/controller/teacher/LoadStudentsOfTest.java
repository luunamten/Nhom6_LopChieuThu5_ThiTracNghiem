package controller.teacher;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBConnection;
import model.ClassBean;
import model.StudentTestingBean;
import model.TestBean;

/**
 * Servlet implementation class LoadStudentsOfTest
 */
@WebServlet("/LoadStudentsOfTest")
public class LoadStudentsOfTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadStudentsOfTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String classID = request.getParameter("classID");
		String testID = request.getParameter("testID");
		if(classID != null && !classID.trim().isEmpty() && testID != null && !testID.trim().isEmpty()) {
			ClassBean _class = new ClassBean();
			TestBean test = new TestBean();
			List<StudentTestingBean> students;
			_class.setId(classID);
			test.setId(testID);
			students = this.getStudentstudents(_class, test);
			if(students != null) {
				request.setAttribute("students", students);
				request.getRequestDispatcher("WEB-INF/teacher/tcStudentTableRows.jsp").forward(request, response);
			}
		}
	}
	
	private List<StudentTestingBean> getStudentstudents(ClassBean _class, TestBean test) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement studentsCmd = con.prepareCall("{call sp_tcLoadStudentsOfTest(?,?)}")) {
			studentsCmd.setString(1, _class.getId());
			studentsCmd.setString(2, test.getId());
			try(ResultSet tesingsRes = studentsCmd.executeQuery()) {
				List<StudentTestingBean> students = new ArrayList<StudentTestingBean>();
				while(tesingsRes.next()) {
					StudentTestingBean student = new StudentTestingBean();
					student.setStudentID(tesingsRes.getString("mssv"));
					student.setStudentName(tesingsRes.getString("hoten"));
					student.setPoint(tesingsRes.getFloat("diemthi"));
					student.setStart(tesingsRes.getString("ngaythi"));
					students.add(student);
				}
				return students;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
