package com.demo.User;

public class UserEducation {
	private int id;
	private String email, school, degree, grade, year;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public UserEducation() {
		super();
	}

	public UserEducation(String email, String school, String degree, String grade, String year) {
		super();
		this.email = email;
		this.school = school;
		this.degree = degree;
		this.grade = grade;
		this.year = year;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

}
