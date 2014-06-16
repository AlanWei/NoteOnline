package com.NoteOnline.db;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.NoteOnline.model.Course;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class CourseDatabaseManager {
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/noteonline";
	private static final String user = "root";
	private static final String password = "137993";
	private Connection conn;

	// constructor
	public CourseDatabaseManager() {
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

	public List<Course> courseList(int uniId) throws SQLException {
		CourseDatabaseManager dm = new CourseDatabaseManager();
		String s_uniId = Integer.toString(uniId);
		String sql = "select * from course where uni_id = " + s_uniId + ";";
		ResultSet rs = dm.sqlQuery(sql);

		List<Course> cList = new ArrayList<Course>();

		while (rs.next()) {
			int courseId = rs.getInt("course_id");
			String courseCode = rs.getString("course_code");
			String courseName = rs.getString("course_name");
			String courseIntro = rs.getString("course_intro");

			Course c = new Course(courseId, uniId, courseCode, courseName,
					courseIntro);
			cList.add(c);
		}
		return cList;
	}
}
