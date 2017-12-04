package controller;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
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
 * Servlet implementation class ChangeEmailServlet
 */
@WebServlet({"/ChangeEmail"})
public class ChangeEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeEmail() {
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
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean oldBean = (LoginBean)ses.getAttribute("loginBean");
			if(oldBean != null) {
				if(oldBean.getUserType().equals("gv")) {
					request.getRequestDispatcher("Teacher").forward(request, response);
					return;
				}else if(oldBean.getUserType().equals("sv")) {
					response.sendRedirect("Student");;
					return;
				}
			}
		}
		response.sendRedirect("Home");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession(false);
		if(ses != null) {
			LoginBean oldBean = (LoginBean)ses.getAttribute("loginBean");
			if(oldBean != null) {
				String email = request.getParameter("emailTxt");
				if(Pattern.matches("^[a-zA-Z0-9_]{3,}@[a-zA-Z0-9_\\.]{1,}$", email)) {		
					LoginBean newBean = new LoginBean();
					newBean.setEmail(email);
					newBean.setUserType(oldBean.getUserType());
					newBean.setUsername(oldBean.getUsername());
					if(this.changeEmail(newBean) > 0) {
						request.setAttribute("emailSuccess", "\u2713\u2713 Cập nhật email thành công.");
						oldBean.setEmail(email);
					} else {
						request.setAttribute("emailError", "!! Cập nhật email thất bại.");
					}				
				} else {
					request.setAttribute("emailTxtError", "Tối thiểu 5 kí tự, Email không hợp lệ.");
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
	
	public int changeEmail(LoginBean bean) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement cmd = con.prepareCall("{call sp_changeEmail(?, ?, ?)}");
				) {
			int numRowAffected = 0;
			cmd.setString(1, bean.getUserType());
			cmd.setString(2, bean.getUsername());
			cmd.setString(3, bean.getEmail());
			numRowAffected = cmd.executeUpdate();
			return numRowAffected;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}


