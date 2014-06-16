package com.NoteOnline.model;

public class University {

	private int id;
	private String name;
	private String intro;
	private String location;

	public University(int id, String name, String intro, String location) {
		this.id = id;
		this.name = name;
		this.intro = intro;
		this.location = location;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
