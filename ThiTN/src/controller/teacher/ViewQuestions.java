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

import dao.DBConnection;
import dao.TeacherUtil;
import model.LoginBean;
import model.PartBean;
import model.QuestionBean;
import model.SubjectBean;
import model.ViewQuestionBean;

/**
 * Servlet implementation class ViewQuestions
 */
@WebServlet("/ViewQuestions")
public class ViewQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewQuestions() {
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
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean bean = (LoginBean)ses.getAttribute("loginBean");
			if(bean != null) {
				String userType = bean.getUserType();
				if(userType.equals("gv")) {
					request.setCharacterEncoding("utf-8");
					TeacherUtil util = new TeacherUtil();
					List<SubjectBean> subjects = util.getAllSubjects();
					if(subjects != null && subjects.size() > 0) {
						List<PartBean> parts = util.getPartsOfSubject(subjects.get(0));
						if(parts != null && parts.size() > 0) {
							request.setAttribute("parts", parts);
						}
						request.setAttribute("subjects", subjects);
					}
					request.getRequestDispatcher("WEB-INF/teacher/tcViewQuestions.jsp").forward(request, response);
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
		HttpSession ses = request.getSession();
		if(ses != null) {
			LoginBean bean = (LoginBean)ses.getAttribute("loginBean");
			if(bean != null) {
				String partID = request.getParameter("select_part");
				String searchString = request.getParameter("searchTxt");
				String strOffset = request.getParameter("offset");
				String strLength = request.getParameter("length");
				int offset = 0;
				int length = 0;
				StringBuilder errors = new StringBuilder("");
				boolean isError = false;
				if(partID == null || partID.trim().length() == 0) {
					isError = true;
					errors.append("> Phải chọn một phần.");
				}
				if(searchString == null) {
					isError = true;
					errors.append("> Không nhận được chuỗi tìm kiếm.");
				}
				if(strOffset == null || strOffset.trim().isEmpty()) {
					isError = true;
					errors.append("> Không nhận được offset.");
				}
				if(strLength == null || strLength.trim().isEmpty()) {
					isError = true;
					errors.append("> Không nhận được length.");
				}
				try {
					offset = Integer.parseInt(strOffset);
					length = Integer.parseInt(strLength);
				} catch(NumberFormatException exp) {
					isError = true;
					exp.printStackTrace();
				}
				if(!isError) {
					List<QuestionBean> questions;
					ViewQuestionBean viewQuestion = new ViewQuestionBean();
					viewQuestion.setPartID(partID);
					viewQuestion.setSearchString(searchString);
					viewQuestion.setOffset(offset);
					viewQuestion.setLength(length);
					questions = this.getQuestions(viewQuestion);
					request.setAttribute("questions", questions);
				} 
 			}
		}
		request.getRequestDispatcher("WEB-INF/teacher/tcQuestionTableRows.jsp").forward(request, response);
	}
	
	private List<QuestionBean> getQuestions(ViewQuestionBean viewQuestion) {
		try(
				Connection con = DBConnection.getConnection();
				CallableStatement getQuestionsCmd = con.prepareCall("{call sp_tcLoadQuestionsInRange(?,?,?,?)}");
				) {
			getQuestionsCmd.setString(1, viewQuestion.getPartID());
			getQuestionsCmd.setString(2, viewQuestion.getSearchString());
			getQuestionsCmd.setInt(3, viewQuestion.getOffset());
			getQuestionsCmd.setInt(4, viewQuestion.getLength());
			try(
					ResultSet questionsRes = getQuestionsCmd.executeQuery()) {
				List<QuestionBean> questions = new ArrayList<QuestionBean>();
				while(questionsRes.next()) {
					QuestionBean question = new QuestionBean();
					question.setId(questionsRes.getString("mach"));
					question.setContent(questionsRes.getString("mota"));
					question.setBirth(questionsRes.getString("thoidiemthem"));
					question.setCorrect(questionsRes.getString("cautraloi"));
					question.setWrongs(questionsRes.getString("cautraloikhac"));
					questions.add(question);
				}
				return questions;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
