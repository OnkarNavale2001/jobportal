package com.demo.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.Admin.Job;
import com.demo.User.Aboutuser;
import com.demo.User.Appliedjob;
import com.demo.User.User;
import com.demo.User.UserEducation;
import com.demo.User.UserExperience;
import com.demo.User.Userpic;

public class Dao {
	public static Connection getconnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/jobportal", "root", "root");

		} catch (Exception e) {

		}
		return con;
	}

	public static int Adddataregister(String name, String email, String password, String gender, String[] field,
			String city) {

		int count = 0;

		try {

			Connection con = Dao.getconnection();

			String sql = "insert into register (name, email, password, gender, field, city) values (?, ?, ?, ?, ?, ?)";
			String fieldValues = String.join(",", field);
			about_userinser(email);
			insertuserrpic(email);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, gender);
			ps.setString(5, fieldValues);
			ps.setString(6, city);

			count = ps.executeUpdate();

			ps.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

	public static List<User> getallrecordofuser() {
		List<User> list = new ArrayList<>();
		try {
			Connection con = Dao.getconnection();
			String sql = "select * from register";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setFeild(rs.getString("field").split(","));
				user.setCity(rs.getString("city"));

				list.add(user);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public static User logindetail(String email, String password) {
		User user = null;
		try {
			Connection con = Dao.getconnection();
			PreparedStatement ps = con.prepareStatement("select * from register where email=? and password=?");

			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				String fields = rs.getString("field");
				String[] fieldArray = fields.split(",");
				user.setFeild(fieldArray);
				user.setCity(rs.getString("city"));

			}
		} catch (Exception e) {
		}

		return user;

	}

	public static void about_userinser(String email) {
		try {
			Connection con = Dao.getconnection();

			String sql = "insert into about_user (email,about,myskill) values (?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, "");
			ps.setString(3, "");
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static int updateregister(String name, String email, String city, String gender, String about,
			String skills) {
		int c = 0;
		try {
			Connection con = Dao.getconnection();

			String sql = "update register  set name=? ,city=?,gender=? where email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			updateuser_about(email, about, skills);
			ps.setString(1, name);
			ps.setString(2, city);
			ps.setString(3, gender);
			ps.setString(4, email);
			c = ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return c;

	}

	private static void updateuser_about(String email, String about, String skills) {
		try {
			Connection con = Dao.getconnection();

			String sql = "update about_user  set about=? ,myskill=? where email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			updateuser_about(email, about, skills);
			ps.setString(1, about);
			ps.setString(2, skills);

			ps.setString(3, email);
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public static Aboutuser About(String email) {
		Aboutuser user = null;
		try {
			Connection con = Dao.getconnection();
			PreparedStatement ps = con.prepareStatement("select * from about_user where email=?");

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				user = new Aboutuser();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));

				user.setAbout(rs.getString("about"));
				user.setSkills(rs.getString(4));

			}
		} catch (Exception e) {
		}

		return user;

	}

	public static int usereducation(UserEducation u) {
		int count = 0;

		try {

			Connection con = Dao.getconnection();

			String sql = "insert into education (email,school, degree, grade, year) values(?, ?, ?, ?, ?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getSchool());
			ps.setString(3, u.getDegree());
			ps.setString(4, u.getGrade());
			ps.setString(5, u.getYear());

			count = ps.executeUpdate();

			ps.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	public static UserEducation userEducation(int id) {
		UserEducation user = null;
		try {
			Connection con = Dao.getconnection();
			PreparedStatement ps = con.prepareStatement("select * from education where id=?");

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				user = new UserEducation();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));

				user.setDegree(rs.getString("degree"));
				user.setGrade(rs.getString("grade"));
				user.setSchool(rs.getString("school"));
				user.setYear(rs.getString("year"));
				System.out.println(user.getEmail() + "" + user.getGrade());

			}
		} catch (Exception e) {
		}

		return user;

	}

	public static int updateeducation(String email, String school, String year, String grade, String degree) {
		int i = 0;
		try {
			Connection con = Dao.getconnection();

			String sql = "update education  set school=? ,degree=? ,year=?,grade=? where email=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, school);
			ps.setString(2, degree);
			ps.setString(3, year);
			ps.setString(4, grade);
			ps.setString(5, email);
			i = ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return i;
	}

	public static int adduserexper(UserExperience u) {
		int i = 0;

		try {
			Connection con = Dao.getconnection();

			String sql = "insert into experience (email, company, location, year, job_title, description) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getCompany());
			ps.setString(3, u.getLocation());
			ps.setString(4, u.getYear());
			ps.setString(5, u.getJob_title());
			ps.setString(6, u.getDescription());
			i = ps.executeUpdate();

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return i;
	}

	public static UserExperience getUserExperiencesByEmail(String email) {
		UserExperience user = null;

		try {
			Connection con = Dao.getconnection();
			String sql = "SELECT * FROM experience WHERE email = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new UserExperience();
				user.setEmail(rs.getString("email"));
				user.setCompany(rs.getString("company"));
				user.setLocation(rs.getString("location"));
				user.setYear(rs.getString("year"));
				user.setJob_title(rs.getString("job_title"));
				user.setDescription(rs.getString("description"));
				user.setId(rs.getInt("id"));
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}

	public static UserExperience getUserExperienceById(int id) {
		UserExperience user = null;
		try {
			Connection con = Dao.getconnection();
			String sql = "select * from experience where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user = new UserExperience();
				user.setId(rs.getInt("id"));
				user.setCompany(rs.getString(3));
				user.setLocation(rs.getString("location"));
				user.setYear(rs.getString("year"));
				user.setJob_title(rs.getString("job_title"));
				user.setDescription(rs.getString("description"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public static int updateUserExperience(UserExperience userExperience) {
		int i = 0;

		try {
			Connection con = Dao.getconnection();
			String sql = "update experience set company=?, location=?, year=?, job_title=?, description=? where  email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userExperience.getCompany());
			ps.setString(2, userExperience.getLocation());
			ps.setString(3, userExperience.getYear());
			ps.setString(4, userExperience.getJob_title());
			ps.setString(5, userExperience.getDescription());
			ps.setString(6, userExperience.getEmail());

			i = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	public static int deleteEducation(int id) {

		int i = 0;
		String sql = "delete from education where id = ?";

		try {

			Connection con = Dao.getconnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			i = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public static int deleteexperence(int id) {
		int i = 0;
		String sql = "delete from experience where id = ?";

		try {

			Connection con = Dao.getconnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			i = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public static void insertuserrpic(String email) {
		try {
			Connection con = Dao.getconnection();

			String sql = "insert into profile_pics(email,path) values (?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, "profilepic.jpg");

			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static Userpic getpic(String email) {
		Userpic pic = null;
		try {
			Connection con = Dao.getconnection();
			String sql = "select * from profile_pics where email=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String email1 = resultSet.getString("email");
				String path = resultSet.getString("path");
				pic = new Userpic();
				pic.setEmail(email1);
				pic.setPath(path);
				pic.setI(id);

			}

		} catch (Exception e) {

		}

		return pic;
	}

	public static int update(int id, String path) {

		int i = 0;
		try {
			Connection con = Dao.getconnection();
			String sql = "update profile_pics set path=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, path);
			ps.setInt(2, id);
			i = ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return i;

	}

	public static int insertJob(Job job) {
		int i = 0;
		try {
			Connection conn = Dao.getconnection();
			String sql = "insert into jobs (job_profile, company, experience, salary, no_of_openings, job_location, time_venue, description, c_email, c_person_name, c_person_profile, c_phone_no, date1, time1) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, job.getJob_profile());
			statement.setString(2, job.getCompany());
			statement.setString(3, job.getExperience());
			statement.setString(4, job.getSalary());
			statement.setString(5, job.getNo_of_openings());
			statement.setString(6, job.getJob_location());
			statement.setString(7, job.getTime_venue());
			statement.setString(8, job.getDescription());
			statement.setString(9, job.getC_email());
			statement.setString(10, job.getC_person_name());
			statement.setString(11, job.getC_person_profile());
			statement.setString(12, job.getC_phone_no());
			statement.setString(13, job.getDate1());
			statement.setString(14, job.getTime1());

			i = statement.executeUpdate();

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return i;
	}

	public static List<Job> getalljob() {
		List<Job> jobs = new ArrayList<>();
		try {
			Connection conn = Dao.getconnection();
			String sql = "select  * from jobs";
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Job job = new Job();
				job.setId(resultSet.getInt("id"));
				job.setJob_profile(resultSet.getString("job_profile"));
				job.setCompany(resultSet.getString("company"));
				job.setExperience(resultSet.getString("experience"));
				job.setSalary(resultSet.getString("salary"));
				job.setNo_of_openings(resultSet.getString("no_of_openings"));
				job.setJob_location(resultSet.getString("job_location"));
				job.setTime_venue(resultSet.getString("time_venue"));
				job.setDescription(resultSet.getString("description"));
				job.setC_email(resultSet.getString("c_email"));
				job.setC_person_name(resultSet.getString("c_person_name"));
				job.setC_person_profile(resultSet.getString("c_person_profile"));
				job.setC_phone_no(resultSet.getString("c_phone_no"));
				job.setDate1(resultSet.getString("date1"));
				job.setTime1(resultSet.getString("time1"));
				jobs.add(job);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return jobs;

	}

	public static Job getalljobone(int id) {
		Job job = null;
		try {
			Connection conn = Dao.getconnection();
			String sql = "select  * from jobs where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet resultSet = ps.executeQuery();
			while (resultSet.next()) {
				job = new Job();

				job.setJob_profile(resultSet.getString("job_profile"));
				job.setCompany(resultSet.getString("company"));
				job.setExperience(resultSet.getString("experience"));
				job.setSalary(resultSet.getString("salary"));
				job.setNo_of_openings(resultSet.getString("no_of_openings"));
				job.setJob_location(resultSet.getString("job_location"));
				job.setTime_venue(resultSet.getString("time_venue"));
				job.setDescription(resultSet.getString("description"));
				job.setC_email(resultSet.getString("c_email"));
				job.setC_person_name(resultSet.getString("c_person_name"));
				job.setC_person_profile(resultSet.getString("c_person_profile"));
				job.setC_phone_no(resultSet.getString("c_phone_no"));
				job.setDate1(resultSet.getString("date1"));
				job.setTime1(resultSet.getString("time1"));

			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return job;

	}

	public static int deletejobs(int id) {
		int i = 0;
		try {

			Connection conn = Dao.getconnection();
			String sql = "delete  from jobs where  id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			i = ps.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();

		}
		return i;
	}

	public static int deleteuserdetails(int id) {
		int i = 0;
		try {
			Connection con = Dao.getconnection();
			String sql = "delete from register where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			i = ps.executeUpdate();
		} catch (Exception e) {

		}

		return i;
	}

	public static int userapplied(int id, String email, String jobdesc, String date, String time) {
		int i = 0;
		try {
			Connection con = Dao.getconnection();
			String sql = "insert into appliedjob(jobid,email,jobdesc,date,time) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, email);
			ps.setString(3, jobdesc);
			ps.setString(4, date);
			ps.setString(5, time);
			i = ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return i;
	}

	public static List<Appliedjob> getApplied() {
		List<Appliedjob> list = new ArrayList<>();
		try {
			Connection con = Dao.getconnection();
			String sql = "select * from appliedjob";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Appliedjob ap = new Appliedjob();
				ap.setDate(rs.getString("date"));
				ap.setEmail(rs.getString("email"));
				ap.setId(rs.getInt("id"));
				ap.setJobid(rs.getInt("jobid"));
				ap.setTime(rs.getString("time"));
				ap.setDescription(rs.getString("jobdesc"));
				list.add(ap);
			}

		} catch (Exception e) {
		}

		return list;
	}

	public static int deleteapplied(int id) {
		int i = 0;
		try {

			Connection con = Dao.getconnection();
			PreparedStatement ps = con.prepareStatement("delete from appliedjob where id=?");
			ps.setInt(1, id);
			i = ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return i;
	}

}
