package controller;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.regex.Pattern;

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
 * Servlet implementation class ChangePhoneServlet
 */
@WebServlet({"/ChangePhone"})
public class ChangePhone extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePhone() {
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
					return;
				}else if(oldBean.getUserType().equals("sv")) {
					request.getRequestDispatcher("/Student").forward(request, response);
					return;
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
				String phoneNumber = request.getParameter("phoneNumberTxt");
				if(Pattern.matches("^[0-9]{4,}$", phoneNumber)) {
					LoginBean newBean = new LoginBean();
					newBean.setPhoneNumber(phoneNumber);
					newBean.setUserType(oldBean.getUserType());
					newBean.setUsername(oldBean.getUsername());
					if(this.changePhoneNumber(newBean) > 0) {
						request.setAttribute("phoneSuccess", "\u2713\u2713 Cập nhật số điện thoại thành công.");
						oldBean.setPhoneNumber(phoneNumber);
					} else {
						request.setAttribute("phoneError", "!! Cập nhật số điện thoại thất bại.");
					}				
				} else {
					request.setAttribute("phoneTxtError", "Tối thiểu 4 kí tự, phải nhập số 0-9.");
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
	
	public int changePhoneNumber(LoginBean bean) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement cmd = con.prepareCall("{call sp_changePhone(?, ?,?)}");
				) {
			int numRowAffected = 0;
			cmd.setString(1, bean.getUserType());
			cmd.setString(2, bean.getUsername());
			cmd.setString(3, bean.getPhoneNumber());
			numRowAffected = cmd.executeUpdate();
			return numRowAffected;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
