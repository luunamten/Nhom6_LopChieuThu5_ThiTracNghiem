package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String HOST = "jdbc:mysql://localhost:3306/thitn";
	private static final String USER = "root";
	private static final String PASS = "luunam";
	public static Connection getConnection() throws SQLException {		
		Connection con = DriverManager.getConnection(HOST, USER, PASS);
		return con;
	}
}
