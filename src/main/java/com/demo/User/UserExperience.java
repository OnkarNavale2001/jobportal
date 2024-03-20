package com.demo.User;

public class UserExperience {
	private int id;
	private String email, location, company, description, job_title, year;

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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public UserExperience() {
		super();
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public UserExperience( String email, String location, String company, String description, String job_title,
			String year) {
		
		
		this.email = email;
		this.location = location;
		this.company = company;
		this.description = description;
		this.job_title = job_title;
		this.year = year;
	}

}
