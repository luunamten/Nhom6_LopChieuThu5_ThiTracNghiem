package controller.teacher;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;
import dao.TeacherUtil;
import model.LoginBean;
import model.PartBean;
import model.QuestionBean;
import model.SubjectBean;

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
					TeacherUtil util = new TeacherUtil();
					List<SubjectBean> subjects = util.getAllSubjects();
					if(subjects != null && subjects.size() > 0) {
						List<PartBean> parts = util.getPartsOfSubject(subjects.get(0));
						if(parts != null && parts.size() > 0) {
							request.setAttribute("parts", parts);
						}
						request.setAttribute("subjects", subjects);
					}
					request.getRequestDispatcher("WEB-INF/teacher/tcAddQuestion.jsp").forward(request, response);
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
		request.setCharacterEncoding("utf-8");
		String partID = request.getParameter("select_part");
		String subjectID = request.getParameter("select_subject");
		String content = request.getParameter("input_question");
		String correct = request.getParameter("correct_answer");
		String wrong1 = request.getParameter("wrong_answer1");
		String wrong2 = request.getParameter("wrong_answer2");
		String wrong3 = request.getParameter("wrong_answer3");
		boolean isError = false;
		StringBuilder errors = new StringBuilder("");
		if(subjectID == null || subjectID.trim().length() == 0) {
			errors.append("> Phải chọn một môn.<br />");
			isError = true;
		}
		if(partID == null || partID.trim().length() == 0) {
			errors.append("> Phải chọn một phần.<br />");
			isError = true;
		}
		if(content == null || content.trim().length() < 6) {
			errors.append(">Nội dung câu hỏi phải tối thiểu 6 kí tự.<br />");
			isError = true;
		}
		if(correct == null || correct.trim().length() < 1) {
			errors.append("> Câu trả lời đúng phải tối thiểu 1 kí tự.<br />");
			isError = true;
		}
		if(wrong1 == null || wrong1.trim().length() < 1) {
			errors.append("> Câu sai 1 phải tối thiểu 1 kí tự.<br />");
			isError = true;
		}
		if(wrong2 == null || wrong2.trim().length() < 1) {
			errors.append("> Câu sai 2 phải tối thiểu 1 kí tự.<br />");
			isError = true;
		}
		if(wrong3 == null || wrong3.trim().length() < 1) {
			errors.append("> Câu sai 3 phải tối thiểu 1 kí tự.<br />");
			isError = true;
		}
		request.setAttribute("saveContent", content);
		request.setAttribute("saveCorrect", correct);
		request.setAttribute("saveWrong1", wrong1);
		request.setAttribute("saveWrong2", wrong2);
		request.setAttribute("saveWrong3", wrong3);
		if(!isError) {
			QuestionBean bean = new QuestionBean();
			String wrongs = String.format("[%s][%s][%s]", wrong1, wrong2, wrong3);
			bean.setPartID(partID);
			bean.setContent(content);
			bean.setCorrect(correct);
			bean.setWrongs(wrongs);
			int numRow = this.addQuestion(bean);
			if(numRow > 0) {
				request.setAttribute("success", "\u2713\u2713 Đã thêm 1 câu hỏi.");
			} else {
				errors.append("> Thêm câu hỏi thất bại.");
			}
		} else {
			request.setAttribute("errors", errors);
		}
		this.doGet(request, response);
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
