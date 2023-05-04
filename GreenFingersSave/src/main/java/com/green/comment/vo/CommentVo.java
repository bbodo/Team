package com.green.comment.vo;

public class CommentVo {
	// Fields
	private int    coment_idx;
	private String coment_cont;
	private String coment_regdate;
	private int    board_idx;
	private int    usercode;
	private int    delcoment;
	private String nickname;
	
	// Constructor
	public CommentVo() {}
	public CommentVo(int coment_idx, String coment_cont, String coment_regdate, int board_idx, int usercode,
			int delcoment, String nickname) {
		super();
		this.coment_idx = coment_idx;
		this.coment_cont = coment_cont;
		this.coment_regdate = coment_regdate;
		this.board_idx = board_idx;
		this.usercode = usercode;
		this.delcoment = delcoment;
		this.nickname = nickname;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	// toString
	@Override
	public String toString() {
		return "CommentVo [coment_idx=" + coment_idx + ", coment_cont=" + coment_cont + ", coment_regdate="
				+ coment_regdate + ", board_idx=" + board_idx + ", usercode=" + usercode + ", delcoment=" + delcoment
				+ ", nickname=" + nickname + "]";
	}
	
	
	
}
