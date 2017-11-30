package controller.teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBConnection;
import model.PartBean;

/**
 * Servlet implementation class LoadPartServlet
 */
@WebServlet("/LoadPart")
public class LoadPart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.jdbc.Driver";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadPart() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String subjectID = request.getParameter("subjectID");
		if(!subjectID.equals("")) {
			PartBean bean = new PartBean();
			ArrayList<PartBean> parts;
			bean.setSubjectID(subjectID);
			parts = this.getPartData(bean);
			if(parts != null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				for(PartBean part : parts) {
					out.printf("<option value='%s'>%s</option>", part.getPartID(), part.getPartName());
				}
			}
		}
	}
	
	public ArrayList<PartBean> getPartData(PartBean bean) {
		try(Connection con = DBConnection.getConnection();
				CallableStatement cmd = con.prepareCall("{call sp_tcLoadParts(?)}");
				) {
			cmd.setString(1, bean.getSubjectID());
			try(ResultSet res = cmd.executeQuery()) {
				ArrayList<PartBean> arr = new ArrayList<PartBean>();
				while(res.next()) {
					PartBean part = new PartBean();
					part.setPartID(res.getString("maphan"));
					part.setPartName(res.getString("tenphan"));
					arr.add(part);
				}
				return arr;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
