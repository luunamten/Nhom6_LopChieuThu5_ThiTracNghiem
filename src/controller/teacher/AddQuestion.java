package controller.teacher;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.DBConnection;
import model.LoginBean;
import model.QuestionBean;

/**
 * Servlet implementation class AddQuestionServlet
 */
@WebServlet("/AddQuestion")
public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestion() {
        
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
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean bean = (LoginBean)ses.getAttribute("loginBean");
			if(bean != null) {
				String userType = bean.getUserType();
				if(userType.equals("gv")) {
					request.getRequestDispatcher("WEB-INF/teacher/tcAddQuestion.jsp").forward(request, response);
				} else if(userType.equals("sv")) {
					request.getRequestDispatcher("Student").forward(request, response);
				}
				return;
			}
		}
		request.getRequestDispatcher("Home").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String partID = request.getParameter("select_part");
		String content = request.getParameter("input_question");
		String correct = request.getParameter("correct_answer");
		String wrong1 = request.getParameter("wrong_answer1");
		String wrong2 = request.getParameter("wrong_answer2");
		String wrong3 = request.getParameter("wrong_answer3");
		boolean isError = false;
		if(partID.trim().length() == 0) {
			request.setAttribute("partError", "Phải chọn một phần.");
			isError = true;
		}
		if(content.trim().length() < 6) {
			request.setAttribute("contentError", "Phải tối thiểu 6 kí tự.");
			isError = true;
		}
		if(correct.trim().length() < 1) {
			request.setAttribute("correctError", "Phải tối thiểu 1 kí tự.");
			isError = true;
		}
		if(wrong1.trim().length() < 1) {
			request.setAttribute("wrong1Error", "Phải tối thiểu 1 kí tự.");
			isError = true;
		}
		if(wrong2.trim().length() < 1) {
			request.setAttribute("wrong2Error", "Phải tối thiểu 1 kí tự.");
			isError = true;
		}
		if(wrong3.trim().length() < 1) {
			request.setAttribute("wrong3Error", "Phải tối thiểu 1 kí tự.");
			isError = true;
		}
		if(!isError) {
			QuestionBean bean = new QuestionBean();
			String wrongs = String.format("[%s][%s][%s]", wrong1, wrong2, wrong3);
			bean.setPartID(partID);
			bean.setContent(content);
			bean.setCorrect(correct);
			bean.setWrongs(wrongs);
			int numRow = this.addQuestion(bean);
			if(numRow > 0) {
				request.setAttribute("addSuccess", "\u2713\u2713 Đã thêm 1 câu hỏi.");
			} else {
				request.setAttribute("addError", "!! Thêm câu hỏi thất bại.");
			}
		}
		request.getRequestDispatcher("WEB-INF/teacher/tcAddQuestion.jsp").forward(request, response);
	}
	

	public int addQuestion(QuestionBean bean) {
		try(
			Connection con = DBConnection.getConnection();
			CallableStatement cmd = con.prepareCall("{call sp_tcAddQuestion(?,?,?,?)}");
				) {
			cmd.setString(1, bean.getContent());
			cmd.setString(2, bean.getCorrect());
			cmd.setString(3, bean.getWrongs());
			cmd.setString(4, bean.getPartID());
			int numRow = cmd.executeUpdate();
			return numRow;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
