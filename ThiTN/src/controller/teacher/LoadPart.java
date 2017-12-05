package controller.teacher;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.TeacherUtil;
import model.PartBean;
import model.SubjectBean;

/**
 * Servlet implementation class LoadPartServlet
 */
@WebServlet("/LoadPart")
public class LoadPart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadPart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
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
		request.setCharacterEncoding("utf-8");
		String subjectID = request.getParameter("subjectID");
		if(subjectID != null && !subjectID.trim().isEmpty()) {
			SubjectBean bean = new SubjectBean();
			TeacherUtil util = new TeacherUtil();
			ArrayList<PartBean> parts;
			bean.setId(subjectID);
			parts = util.getPartsOfSubject(bean);
			if(parts != null) {
				request.setAttribute("items", parts);
				request.getRequestDispatcher("WEB-INF/common/List.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
