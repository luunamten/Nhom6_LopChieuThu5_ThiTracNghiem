package controller.teacher;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.TeacherUtil;
import model.PartAndNumQuestionBean;
import model.SubjectBean;

/**
 * Servlet implementation class LoadPartServlet
 */
@WebServlet("/LoadPartAndNumQuestion")
public class LoadPartAndNumQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadPartAndNumQuestion() {
        super();
        
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String subjectID = request.getParameter("subjectID");
		if(subjectID !=null && !subjectID.trim().isEmpty()) {
			SubjectBean subject = new SubjectBean();
			TeacherUtil util = new TeacherUtil();
			List<PartAndNumQuestionBean> parts;
			subject.setId(subjectID);
			parts = util.getPartAndNumQuesion(subject);
			if(parts != null) {
				request.setAttribute("items", parts);
				request.getRequestDispatcher("WEB-INF/common/PartAndNumQuestionList.jsp").forward(request, response);
			}
		}
	}
}
