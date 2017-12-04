package controller;

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

/**
 * Servlet implementation class ChangePass
 */
@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePass() {
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
		HttpSession ses = request.getSession();
		if(ses != null) {
			LoginBean bean = (LoginBean)ses.getAttribute("loginBean");
			if(bean != null) {
				String type = bean.getUserType();
				if(type.equals("gv")) {
					request.getRequestDispatcher("Teacher").forward(request, response);
				} else if(type.equals("sv")) {
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
			LoginBean oldBean = (LoginBean)ses.getAttribute("loginBean");
			if(oldBean != null) {
				String oldPass = request.getParameter("oldPassTxt");
				String newPass = request.getParameter("newPassTxt");
				String reNewPass = request.getParameter("reNewPassTxt");
				boolean isError = false;
				StringBuilder errors = new StringBuilder();
				if(oldPass == null || oldPass.trim().length() < 1) {
					isError = true;
					errors.append("> Mật khẩu cũ phải tối thiểu 1 kí tự.");
				} else if(!oldBean.getPassword().equals(oldPass)) {
					isError = true;
					errors.append("> Mật khẩu cũ sai.");
				}

				if(newPass == null || newPass.trim().length() < 1) {
					isError = true;
					errors.append("> Mật khẩu mới phải tối thiểu 1 kí tự.");
				}
				if(reNewPass == null || reNewPass.trim().length() < 1) {
					isError = true;
					errors.append("> Nhập lại mật khẩu phải tối thiểu 1 kí tự.");
				}
				
				if(!newPass.equals(reNewPass)) {
					isError = true;
					errors.append("> Nhập lại mật khẩu mới không trùng khớp.");
				}
				
				if(!isError) {
					if(this.changePass(oldBean, newPass) > 0) {
						request.setAttribute("success", "\u2713\u2713 Cập nhật mật khẩu thành công.");
						oldBean.setPassword(newPass);
					} else {
						request.setAttribute("errors", errors);
					}
				} else {
					request.setAttribute("errors", errors);
				}
				this.doGet(request, response);
			}
		}

	}

	private int changePass(LoginBean bean, String newPass) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement cmd = con.prepareCall("{call sp_changePass(?,?,?,?)}")) {
			int numRowAffected = 0;
			cmd.setString(1, bean.getUserType());
			cmd.setString(2, bean.getUsername());
			cmd.setString(3, bean.getPassword());
			cmd.setString(4, newPass);
			numRowAffected = cmd.executeUpdate();
			return numRowAffected;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
