package controller;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;
import model.LoginBean;
import model.LoginErrorBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({"/Home"})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean bean = (LoginBean)ses.getAttribute("loginBean");
			if(bean != null) {
				String userType = bean.getUserType();
				if(userType.equals("gv")) {
					response.sendRedirect("Teacher");
				} else if(userType.equals("sv")) {
					response.sendRedirect("Student");
				}
				return;
			}
		}
		request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String loginButton = request.getParameter("loginButton");
		if(loginButton != null) {
			String username = request.getParameter("uname");
			String password = request.getParameter("password");
			String userType = request.getParameter("qt_gv_sv");
			LoginBean bean = new LoginBean();
			bean.setUsername(username);
			bean.setPassword(password);
			bean.setUserType(userType);
			if(this.login(bean)) {
				HttpSession ses = request.getSession();
				response.setContentType("text/html;charset=utf-8");
				ses.setAttribute("loginBean", bean);
				if(userType.equals("gv")) {
					response.sendRedirect("Teacher");
				} else if(userType.equals("sv")) {
					response.sendRedirect("Student");
				}
				return;
			} else {
				LoginErrorBean errorBean = new LoginErrorBean();
				errorBean.setUsernameError("Có thể tên đăng nhập không tồn tại, hoặc không hợp lệ.");
				errorBean.setPasswordError("Có thể mật khẩu sai, hoặc không hợp lệ.");
				request.setCharacterEncoding("utf-8");
				request.setAttribute("errorBean", errorBean);
				request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
				return;
			}
		}
	}
	public boolean login(LoginBean bean) {
		Connection con = null;
			ResultSet res = null;
			CallableStatement cmd = null;
			try {
				con = DBConnection.getConnection();
				cmd = con.prepareCall("{call sp_login(?,?,?)}");
				cmd.setString(1, bean.getUsername());
				cmd.setString(2, bean.getPassword());
				cmd.setString(3, bean.getUserType());
				res = cmd.executeQuery();
				if(res.next()) {
					bean.setName(res.getString("hoten"));
					bean.setEmail(res.getString("email"));
					bean.setPhoneNumber(res.getString("sdt"));
					return true;
				} else {
					return false;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if(res != null) {
					try {res.close();} catch(SQLException e) {e.printStackTrace();}
				}
				if(cmd != null) {
					try {cmd.close();} catch(SQLException e) {e.printStackTrace();}
				}
				if(con != null) {
					try {con.close();} catch (SQLException e) {e.printStackTrace();}
				}
			}
		return false;
	}
}
