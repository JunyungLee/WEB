package com.mystudy.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcUtil {
	private static final String DRIVER = "oracle.jdbc.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "mystudy";
	private static final String PASSWORD = "mystudypw";
	
	//static 초기화 구문
	static { 
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
	
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) rs.close();
		} catch (Exception e) {}
		
		try {
			if (pstmt != null) pstmt.close();
		} catch (SQLException e) {}
		
		try {
			if (conn != null) conn.close();
		} catch (SQLException e) {}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt) {
		try { 
			if (pstmt != null) pstmt.close();
		} catch (SQLException e) {}
		
		try {
			if (conn != null) conn.close();
		} catch (SQLException e) {}
	}
}
