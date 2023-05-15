package com.green.manager.vo;

public class ManagerVo {
	private int managercode;
	private int manager_pw;
	private String manager_name;
	private String joindate;
	
	public ManagerVo() {}
	public ManagerVo(int managercode, int manager_pw, String manager_name, String joindate) {
		super();
		this.managercode = managercode;
		this.manager_pw = manager_pw;
		this.manager_name = manager_name;
		this.joindate = joindate;
	}
	public int getManagercode() {
		return managercode;
	}
	public void setManagercode(int managercode) {
		this.managercode = managercode;
	}
	public int getManager_pw() {
		return manager_pw;
	}
	public void setManager_pw(int manager_pw) {
		this.manager_pw = manager_pw;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	
	@Override
	public String toString() {
		return "ManagerVo [managercode=" + managercode + ", manager_pw=" + manager_pw + ", manager_name=" + manager_name
				+ ", joindate=" + joindate + "]";
	}
	
	
}
