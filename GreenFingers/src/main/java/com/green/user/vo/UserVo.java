package com.green.user.vo;

public class UserVo {

	//Fields
	
	private int    usercode;
	private String userid;
	private String passwd;
	private String username;
	private String birthday;
	private String gender;
	private String grade;
	private String addr;
	private String email;
	private String joindate;
	private int    delmem;
	private int    point;
	
	// Constructor
	public UserVo() {}
	public UserVo(int usercode, String userid, String passwd, String username, String birthday, String gender,
			String grade, String addr, String email, String joindate, int delmem, int point) {
		this.usercode = usercode;
		this.userid = userid;
		this.passwd = passwd;
		this.username = username;
		this.birthday = birthday;
		this.gender = gender;
		this.grade = grade;
		this.addr = addr;
		this.email = email;
		this.joindate = joindate;
		this.delmem = delmem;
		this.point = point;
	}

	// Getter / Setter
	
	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public int getDelmem() {
		return delmem;
	}

	public void setDelmem(int delmem) {
		this.delmem = delmem;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
	// toString
	@Override
	public String toString() {
		return "UserVo [usercode=" + usercode + ", userid=" + userid + ", passwd=" + passwd + ", username=" + username
				+ ", birthday=" + birthday + ", gender=" + gender + ", grade=" + grade + ", addr=" + addr + ", email="
				+ email + ", joindate=" + joindate + ", delmem=" + delmem + ", point=" + point + "]";
	}
	
	
	
}
