package com.demo.Admin;

public class Job {
	private int id;
	private String job_profile;
    private String company;
    private String experience;
    private String salary;
    private String no_of_openings;
    private String job_location;
    private String time_venue;
    private String description;
    private String c_email;
    private String c_person_name;
    private String c_person_profile;
    private String c_phone_no;
    private String date1;
    private String time1;
    
    public Job(String job_profile, String company, String experience, String salary, String no_of_openings,
			String job_location, String time_venue, String description, String c_email, String c_person_name,
			String c_person_profile, String c_phone_no, String date1, String time1) {
		super();
		this.job_profile = job_profile;
		this.company = company;
		this.experience = experience;
		this.salary = salary;
		this.no_of_openings = no_of_openings;
		this.job_location = job_location;
		this.time_venue = time_venue;
		this.description = description;
		this.c_email = c_email;
		this.c_person_name = c_person_name;
		this.c_person_profile = c_person_profile;
		this.c_phone_no = c_phone_no;
		this.date1 = date1;
		this.time1 = time1;
	}
	public Job() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJob_profile() {
		return job_profile;
	}
	public void setJob_profile(String job_profile) {
		this.job_profile = job_profile;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getNo_of_openings() {
		return no_of_openings;
	}
	public void setNo_of_openings(String no_of_openings) {
		this.no_of_openings = no_of_openings;
	}
	public String getJob_location() {
		return job_location;
	}
	public void setJob_location(String job_location) {
		this.job_location = job_location;
	}
	public String getTime_venue() {
		return time_venue;
	}
	public void setTime_venue(String time_venue) {
		this.time_venue = time_venue;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_person_name() {
		return c_person_name;
	}
	public void setC_person_name(String c_person_name) {
		this.c_person_name = c_person_name;
	}
	public String getC_person_profile() {
		return c_person_profile;
	}
	public void setC_person_profile(String c_person_profile) {
		this.c_person_profile = c_person_profile;
	}
	public String getC_phone_no() {
		return c_phone_no;
	}
	public void setC_phone_no(String c_phone_no) {
		this.c_phone_no = c_phone_no;
	}
	public String getDate1() {
		return date1;
	}
	public void setDate1(String date1) {
		this.date1 = date1;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	
}
