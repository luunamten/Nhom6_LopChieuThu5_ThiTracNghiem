package controller.student;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
					StudentTestingBean testingInfo = (StudentTestingBean)ses.getAttribute("testingInfo");
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");

					int duration = testingInfo.getTotalDuration();
					Date start = formatter.parse( testingInfo.getStart());
					/*
					 	declare @miliseconds int;
	declare @seconds varchar(2);
	declare @minutes varchar(2);
	declare @hours varchar(2);
	set @miliseconds = DATEDIFF(MILLISECOND, @start, @end);
	set @seconds = convert(varchar(2), (@miliseconds / 1000) % 60);
	set @minutes =  convert(varchar(2), (@miliseconds / 60000) % 60);
	set @hours =  convert(varchar(2), (@miliseconds / 3600000));
	if(LEN(@hours) = 1)
		set @hours = '0' + @hours;
	if(LEN(@minutes) = 1)
		set @minutes = '0' + @minutes;
	if(LEN(@seconds) = 1)
		set @seconds = '0' + @seconds;
	return concat(@hours,':',@minutes,':' ,@seconds);
					 * */
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
