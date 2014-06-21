package com.NoteOnline.model;

import java.sql.Timestamp;

public class Note {
	private int noteId;
	private int courseId;
	private String noteName;
	private String noteAuthor;
	private String noteContent;
	private Timestamp updateTime;

	public Note(int noteId, int courseId, String noteName, String noteAuthor,
			String noteContent, Timestamp updateTime) {
		this.noteId = noteId;
		this.courseId = courseId;
		this.noteName = noteName;
		this.noteAuthor = noteAuthor;
		this.noteContent = noteContent;
		this.updateTime = updateTime;
	}

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getNoteName() {
		return noteName;
	}

	public void setNoteName(String noteName) {
		this.noteName = noteName;
	}

	public String getNoteAuthor() {
		return noteAuthor;
	}

	public void setNoteAuthor(String noteAuthor) {
		this.noteAuthor = noteAuthor;
	}

	public String getNoteContent() {
		return noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
}
