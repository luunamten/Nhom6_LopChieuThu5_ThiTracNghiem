package controller.student;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginBean;
import model.StudentTestingBean;

/**
 * Servlet implementation class UpdateTime
 */
@WebServlet("/UpdateTime")
public class UpdateTime extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateTime() {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession ses = request.getSession(false);
		if (ses != null) {
			LoginBean user = (LoginBean) ses.getAttribute("loginBean");
			if (user != null) {
				String userType = user.getUserType();
				if (userType.equals("sv")) {
					StudentTestingBean testingInfo = (StudentTestingBean)ses.getAttribute("testingInfo");
					testingInfo.setTimeRemaining(this.diffDateTime(testingInfo.getStart(), testingInfo.getTotalDuration()));
					request.getRequestDispatcher("WEB-INF/student/TimeRemaining.jsp").forward(request, response);
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String diffDateTime(String start, int duration) {
		// HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cl = Calendar.getInstance();
		Date d1 = new Date();
		Date d2 = null;
		
		try {
			d2 = format.parse(start);
			cl.setTime(d2);
			cl.add(Calendar.MINUTE, duration);
			d2 = cl.getTime();
			// in milliseconds
			if(d2.compareTo(d1) < 1) {
				return "";
			}
			long diff = d2.getTime() - d1.getTime();
			long diffSeconds = diff / 1000 % 60;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffHours = diff / (3600 * 1000);
			return String.format("%s : %s : %s", diffHours, diffMinutes, diffSeconds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
