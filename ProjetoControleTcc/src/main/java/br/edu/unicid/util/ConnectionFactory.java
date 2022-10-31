package br.edu.unicid.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionFactory {
	public static Connection getConnection() throws Exception {
		try {
			// Indica qual é o banco de dados utilizado e seu driver
			Class.forName("com.mysql.jdbc.Driver");

			// Estabelece e retorna uma conexão
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/db_controletcc", "root", "");
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}

	// Fecha uma conexão de três formas: conn, stmt, rs
	public static void closeConnection(Connection conn, Statement stmt, ResultSet rs) throws Exception {
		close(conn, stmt, rs);
	}

	public static void closeConnection(Connection conn, Statement stmt) throws Exception {
		close(conn, stmt, null);
	}

	public static void closeConnection(Connection conn) throws Exception {
		close(conn, null, null);
	}

	private static void close(Connection conn, Statement stmt, ResultSet rs) throws Exception {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}
}
