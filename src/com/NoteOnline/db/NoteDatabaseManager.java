package com.NoteOnline.db;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.NoteOnline.model.Note;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class NoteDatabaseManager {
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/noteonline";
	private static final String user = "root";
	private static final String password = "137993";
	private Connection conn;

	// constructor
	public NoteDatabaseManager() {
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

	public List<Note> noteList(int courseId) throws SQLException {
		NoteDatabaseManager dm = new NoteDatabaseManager();
		String s_courseId = Integer.toString(courseId);
		String sql = "select * from note where course_id = " + s_courseId + ";";
		ResultSet rs = dm.sqlQuery(sql);

		List<Note> nList = new ArrayList<Note>();

		while (rs.next()) {
			int noteId = rs.getInt("note_id");
			String noteName = rs.getString("note_name");
			String noteAuthor = rs.getString("note_author");
			String noteContent = rs.getString("note_content");
			Timestamp updateTime = rs.getTimestamp("update_time");

			Note n = new Note(noteId, courseId, noteName, noteAuthor,
					noteContent, updateTime);
			nList.add(n);
		}
		return nList;
	}

	public String getNoteContent(int noteId) throws SQLException {
		NoteDatabaseManager dm = new NoteDatabaseManager();
		String s_noteId = Integer.toString(noteId);
		String sql = "select note_content from note where note_id = "
				+ s_noteId + ";";
		ResultSet rs = dm.sqlQuery(sql);
		String noteContent = null;
		while (rs.next()) {
			noteContent = rs.getString("note_content");
		}
		return noteContent;
	}
	
	public String getNoteName(int noteId) throws SQLException {
		NoteDatabaseManager dm = new NoteDatabaseManager();
		String s_noteId = Integer.toString(noteId);
		String sql = "select note_name from note where note_id = "
				+ s_noteId + ";";
		ResultSet rs = dm.sqlQuery(sql);
		String noteName = null;
		while (rs.next()) {
			noteName = rs.getString("note_name");
		}
		return noteName;
	}
	
	public String getNoteAuthor(int noteId) throws SQLException {
		NoteDatabaseManager dm = new NoteDatabaseManager();
		String s_noteId = Integer.toString(noteId);
		String sql = "select note_author from note where note_id = "
				+ s_noteId + ";";
		ResultSet rs = dm.sqlQuery(sql);
		String noteAuthor = null;
		while (rs.next()) {
			noteAuthor = rs.getString("note_author");
		}
		return noteAuthor;
	}
	
	public Timestamp getNoteUpdateTime(int noteId) throws SQLException {
		NoteDatabaseManager dm = new NoteDatabaseManager();
		String s_noteId = Integer.toString(noteId);
		String sql = "select update_time from note where note_id = "
				+ s_noteId + ";";
		ResultSet rs = dm.sqlQuery(sql);
		
		Timestamp noteUpdateTime = null;
		while (rs.next()) {
			noteUpdateTime = rs.getTimestamp("update_time");
		}
		return noteUpdateTime;
	}
	
	public List<String> getHeader(String content){
		List<String> results = new ArrayList<String>();
		Pattern p = Pattern.compile("<strong>(.*?)</strong>");
		Matcher m = p.matcher(content);
		while (!m.hitEnd() && m.find()){
			results.add(m.group(1));
		}
		return results;
	}
	
	public List<String> getHref(String content){
		List<String> results = new ArrayList<String>();
		Pattern p = Pattern.compile("<h3 id=\"(.*?)\">");
		Matcher m = p.matcher(content);
		while (!m.hitEnd() && m.find()){
			results.add(m.group(1));
		}
		return results;
	}
	
}