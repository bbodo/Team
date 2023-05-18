package com.green.comment.vo;

public class CommentVo {
	// Fields
	private int coment_idx;
	private String coment_cont;
	private String coment_regdate;
	private int board_idx;
	private int usercode;
	private int delcoment;
	private int com_bnum;
	private int com_lvl;
	private int com_step;
	private int com_nref;
	private int com_parent;
	private String nickname;
	private String sfilename;
	
	// Constructor
	public CommentVo() {}
	public CommentVo(int coment_idx, String coment_cont, String coment_regdate, int board_idx, int usercode,
			int delcoment, int com_bnum, int com_lvl, int com_step, int com_nref, int com_parent, String nickname,
			String sfilename) {
		super();
		this.coment_idx = coment_idx;
		this.coment_cont = coment_cont;
		this.coment_regdate = coment_regdate;
		this.board_idx = board_idx;
		this.usercode = usercode;
		this.delcoment = delcoment;
		this.com_bnum = com_bnum;
		this.com_lvl = com_lvl;
		this.com_step = com_step;
		this.com_nref = com_nref;
		this.com_parent = com_parent;
		this.nickname = nickname;
		this.sfilename = sfilename;
	}

	// Getter / Setter
	public int getComent_idx() {
		return coment_idx;
	}
	public void setComent_idx(int coment_idx) {
		this.coment_idx = coment_idx;
	}
	public String getComent_cont() {
		return coment_cont;
	}
	public void setComent_cont(String coment_cont) {
		this.coment_cont = coment_cont;
	}
	public String getComent_regdate() {
		return coment_regdate;
	}
	public void setComent_regdate(String coment_regdate) {
		this.coment_regdate = coment_regdate;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getUsercode() {
		return usercode;
	}
	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}
	public int getDelcoment() {
		return delcoment;
	}
	public void setDelcoment(int delcoment) {
		this.delcoment = delcoment;
	}
	public int getCom_bnum() {
		return com_bnum;
	}
	public void setCom_bnum(int com_bnum) {
		this.com_bnum = com_bnum;
	}
	public int getCom_lvl() {
		return com_lvl;
	}
	public void setCom_lvl(int com_lvl) {
		this.com_lvl = com_lvl;
	}
	public int getCom_step() {
		return com_step;
	}
	public void setCom_step(int com_step) {
		this.com_step = com_step;
	}
	public int getCom_nref() {
		return com_nref;
	}
	public void setCom_nref(int com_nref) {
		this.com_nref = com_nref;
	}
	public int getCom_parent() {
		return com_parent;
	}
	public void setCom_parent(int com_parent) {
		this.com_parent = com_parent;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}

	// toString
	@Override
	public String toString() {
		return "CommentVo [coment_idx=" + coment_idx + ", coment_cont=" + coment_cont + ", coment_regdate="
				+ coment_regdate + ", board_idx=" + board_idx + ", usercode=" + usercode + ", delcoment=" + delcoment
				+ ", com_bnum=" + com_bnum + ", com_lvl=" + com_lvl + ", com_step=" + com_step + ", com_nref="
				+ com_nref + ", com_parent=" + com_parent + ", nickname=" + nickname + ", sfilename=" + sfilename + "]";
	}
	
	
	
	
}
