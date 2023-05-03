package com.green.menus.vo;

public class SubmenuVo {
	
	// 필드
	private String submenu_id;
	private String submenu_name;
	private int    submenu_seq;
	private String menu_id;
	
	// 생성자
	public SubmenuVo() { }
	public SubmenuVo(String submenu_id, String submenu_name, int submenu_seq, String menu_id) {
		this.submenu_id = submenu_id;
		this.submenu_name = submenu_name;
		this.submenu_seq = submenu_seq;
		this.menu_id = menu_id;
	}
	
	// Getter / Setter
	public String getSubmenu_id() {
		return submenu_id;
	}
	public void setSubmenu_id(String submenu_id) {
		this.submenu_id = submenu_id;
	}
	public String getSubmenu_name() {
		return submenu_name;
	}
	public void setSubmenu_name(String submenu_name) {
		this.submenu_name = submenu_name;
	}
	public int getSubmenu_seq() {
		return submenu_seq;
	}
	public void setSubmenu_seq(int submenu_seq) {
		this.submenu_seq = submenu_seq;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	
	// toString
	@Override
	public String toString() {
		return "SubmenuVo [submenu_id=" + submenu_id + ", submenu_name=" + submenu_name + ", submenu_seq=" + submenu_seq
				+ ", menu_id=" + menu_id + "]";
	}
	
}
