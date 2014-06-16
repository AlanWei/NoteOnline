package com.NoteOnline.model;

public class Course {
	private int courseId;
	private int uniId;
	private String courseCode;
	private String courseName;
	private String courseIntro;
	
	public Course(int courseId, int uniId, String courseCode, String courseName, String courseIntro){
		this.courseId = courseId;
		this.uniId = uniId;
		this.courseCode = courseCode;
		this.courseName = courseName;
		this.courseIntro = courseIntro;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getUniId() {
		return uniId;
	}

	public void setUniId(int uniId) {
		this.uniId = uniId;
	}

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseIntro() {
		return courseIntro;
	}

	public void setCourseIntro(String courseIntro) {
		this.courseIntro = courseIntro;
	}
	
	
}
