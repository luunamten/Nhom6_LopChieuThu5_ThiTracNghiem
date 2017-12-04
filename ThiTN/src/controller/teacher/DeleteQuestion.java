package controller.teacher;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginBean;

/**
 * Servlet implementation class DeleteQuestion
 */
@WebServlet("/DeleteQuestion")
public class DeleteQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQuestion() {
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
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession();
		if(ses != null) {
			LoginBean bean = (LoginBean)ses.getAttribute("loginBean");
			if(bean != null) {
				request.setCharacterEncoding("utf-8");
				String questionID = request.getParameter("questionID");
				boolean isError = false;
				StringBuilder errors = new StringBuilder();
				if(questionID == null || questionID.trim().isEmpty()) {
					isError = true;
					errors.append("> Không thể lấy mã câu hỏi để xóa.");
				}
				if(!isError) {
					
				} else {
					request.setAttribute("viewQuestionsError", errors);
				}
			}
		}
	}

}
