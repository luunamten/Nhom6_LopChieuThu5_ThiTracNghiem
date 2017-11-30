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
 * Servlet implementation class ChangePassServlet
 */
@WebServlet({"/ChangePass"})
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean oldBean = (LoginBean)ses.getAttribute("loginBean");
			if(oldBean != null) {
				if(oldBean.getUserType().equals("gv")) {
					request.getRequestDispatcher("/Teacher").forward(request, response);
				}else if(oldBean.getUserType().equals("sv")) {
					request.getRequestDispatcher("/Student").forward(request, response);
				}
				return;
			}
		}
		response.sendRedirect("/Home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean oldBean = (LoginBean)ses.getAttribute("loginBean");
			if(oldBean != null) {
				String newPass = request.getParameter("newPassTxt").trim();
				String reNewPass = request.getParameter("reNewPassTxt").trim();
				String oldPass = request.getParameter("oldPassTxt").trim();
				boolean isError = false;
				if(oldPass.length() < 1) {
					isError = true;
					request.setAttribute("oldError", "Phải tối thiểu 1 kí tự.");
				}
				if(newPass.length() < 1) {
					isError = true;
					request.setAttribute("newError", "Phải tối thiểu 1 kí tự.");
				}

				if(reNewPass.length() < 1) {
					isError = true;
					request.setAttribute("reNewError", "Phải tối thiểu 1 kí tự.");

				} else if(!reNewPass.equals(newPass)) {
					isError = true;
					request.setAttribute("reNewError", "Nhập lại không trùng.");
				}
				if(!isError) {	
					LoginBean newBean = new LoginBean();
					newBean.setPassword(oldPass);
					newBean.setUserType(oldBean.getUserType());
					newBean.setUsername(oldBean.getUsername());
					if(this.changePass(newBean, newPass) > 0) {
						request.setAttribute("passSuccess", "\u2713\u2713 Cập nhật mật khẩu thành công.");
					} else {
						request.setAttribute("passError", "!! Cập nhật mật khẩu thất bại.");
					}				
				} 
				if(oldBean.getUserType().equals("gv")) {
					request.getRequestDispatcher("/Teacher").forward(request, response);
				}else if(oldBean.getUserType().equals("sv")) {
					request.getRequestDispatcher("/Student").forward(request, response);
				}
				return;
			}
		}
		response.sendRedirect("/Home");
	}
	
	public int changePass(LoginBean bean, String newPass) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement cmd = con.prepareCall("{call sp_changePass(?, ?, ?, ?)}");
				) {
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
