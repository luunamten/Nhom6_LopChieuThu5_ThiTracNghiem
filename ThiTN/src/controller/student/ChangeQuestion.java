package controller.student;

import java.io.IOException;
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

import model.AnswerBean;
import model.LoginBean;
import model.QuestionBean;
import model.StudentTestingBean;
import model.TestBean;

/**
 * Servlet implementation class ChangeQuestion
 */
@WebServlet("/ChangeQuestion")
public class ChangeQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeQuestion() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean user = (LoginBean)ses.getAttribute("loginBean");
			if(user != null) {
				String userType = user.getUserType();
				if(userType.equals("sv")) {
					String questionIndex = request.getParameter("qindex");
					if(questionIndex != null && Pattern.matches("^[0-9]+$", questionIndex)) {
						int qindex = Integer.parseInt(questionIndex);
						TestBean test = (TestBean)ses.getAttribute("test");
						StudentTestingBean testing = (StudentTestingBean)ses.getAttribute("testingInfo");
						List<QuestionBean> questions = test.getQuestions();
						int numQuestion = questions.size();
						if(numQuestion > qindex) {
							request.setAttribute("question", questions.get(qindex));
							testing.setPageIndex(qindex);
						}
						request.getRequestDispatcher("WEB-INF/student/QuestionPanel.jsp").forward(request, response);
					}
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
