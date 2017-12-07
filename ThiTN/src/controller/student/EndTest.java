package controller.student;

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
import model.AnswerBean;
import model.LoginBean;
import model.QuestionBean;
import model.TestBean;
import model.TestingBean;

/**
 * Servlet implementation class EndTest
 */
@WebServlet("/EndTest")
public class EndTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EndTest() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean user = (LoginBean)ses.getAttribute("loginBean");
			if(user != null) {
				String userType = user.getUserType();
				if(userType.equals("sv")) {
					int numCorrect = 0;
					TestBean test = (TestBean)ses.getAttribute("test");
					AnswerBean answers = (AnswerBean)ses.getAttribute("answers");
					List<QuestionBean> questions = test.getQuestions();
					TestingBean testing = new TestingBean();
					int[] answerArr = answers.getAnswerIndex();
					int numQuestion = answerArr.length;
					float point = 0;
					StringBuilder answerString = new StringBuilder();
					for(int i = 0; i < numQuestion; i++) {
						if(questions.get(i).getMapCorrectIndex() == answerArr[i]) {
							numCorrect ++;	
						}
						answerString.append(String.format("[%d]", answerArr[i]));
					}
					point = Math.round((numCorrect*1.0 / numQuestion) * 10.00);
					testing.setTest(test);
					testing.setPoint(point);
					testing.setNumCorrect(numCorrect);
					testing.setAnswers(answerString.toString());
					this.endTest(testing, user);
					request.getRequestDispatcher("STViewTest").forward(request, response);
				}
			}
		}
	}
	
	private int endTest(TestingBean testing, LoginBean user) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement cmd = con.prepareCall("{call sp_stEndtest(?,?,?,?,?)}")) {
			cmd.setString(1, testing.getTest().getId());
			cmd.setString(2, user.getUsername());
			cmd.setFloat(3, testing.getPoint());
			cmd.setInt(4, testing.getNumCorrect());
			cmd.setString(5, testing.getAnswers());
			return cmd.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
