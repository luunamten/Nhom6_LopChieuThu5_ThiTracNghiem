package controller.teacher;

import java.io.IOException;
import java.sql.CallableStatement;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Util;
import model.ClassBean;
import model.TestBean;
import model.TestingBean;

/**
 * Servlet implementation class LoadStudentsAndTest
 */
@WebServlet("/LoadStudentsAndTest")
public class LoadStudentsAndTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadStudentsAndTest() {
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
		request.setCharacterEncoding("utf-8");
		String classID = request.getParameter("classID");
		String testID = request.getParameter("testID");
		if(classID != null && !classID.trim().isEmpty() && testID != null && !testID.trim().isEmpty()) {
			ClassBean _class = new ClassBean();
			TestBean test = new TestBean();
			List<TestingBean> testings;
			Util util = new Util();
			_class.setId(classID);
			test.setId(testID);
			testings = util.getStudentsAndTest(test, _class);
			if(testings != null) {
				request.setAttribute("testings", testings);
				request.getRequestDispatcher("WEB-INF/teacher/tcSelectStudentTableRows.jsp").forward(request, response);
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
