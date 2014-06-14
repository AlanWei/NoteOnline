package com.NoteOnline.db;
import com.NoteOnline.model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class UniDatabaseManager {
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/noteonline";
	private static final String user = "root";
	private static final String password = "137993";
	private Connection conn;

	// constructor
	public UniDatabaseManager() {
		try {
			Class.forName(driver);
			conn = (Connection) DriverManager
					.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// sql query
	public ResultSet sqlQuery(String sql) {
		Statement stat = null;
		try {
			stat = (Statement) conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ResultSet rs = null;
		try {
			rs = stat.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	// sql update
	public void sqlUpdate(String sql) {
		try {
			Statement stat = (Statement) conn.createStatement();
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<University> universityList() throws SQLException{
		UniDatabaseManager dm = new UniDatabaseManager();
		String sql = "select * from university;";
		ResultSet rs = dm.sqlQuery(sql);
		
		List<University> uList = new ArrayList<University>();
		
		while (rs.next()){
			int universityId = rs.getInt("id");
			String universityName = rs.getString("name");
			String universityIntro = rs.getString("intro");
			String universityLocation = rs.getString("location");
			
			University u = new University(universityId, universityName, universityIntro, universityLocation);
			uList.add(u);
		}
		return uList;
	}
}