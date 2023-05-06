package com.green.myPage.vo;

public class MyPageVo {
	//Fields
	//usercode
	private int usercode;
	
	//쪽지
	private int noteidx;
	private String notetitle;
	private String notecont;
	private String noteregdate;
	private String sendusercode;
	private String receiverusercode;
	private String readmark;
	private String delnote;
	private String nickname;
	private String boardtitle;
	
	//Constructor
	public MyPageVo() {}

	public MyPageVo(int noteidx, String notetitle, String notecont, String noteregdate, String sendusercode,
			String receiverusercode, String readmark, String delnote, String nickname, String board_title, int usercode) {
		super();
		this.noteidx = noteidx;
		this.notetitle = notetitle;
		this.notecont = notecont;
		this.noteregdate = noteregdate;
		this.sendusercode = sendusercode;
		this.receiverusercode = receiverusercode;
		this.readmark = readmark;
		this.delnote = delnote;
		this.nickname = nickname;
		this.boardtitle = board_title;
		this.usercode = usercode;
	}

	public int getNoteidx() {
		return noteidx;
	}

	public void setNoteidx(int noteidx) {
		this.noteidx = noteidx;
	}

	public String getNotetitle() {
		return notetitle;
	}

	public void setNotetitle(String notetitle) {
		this.notetitle = notetitle;
	}

	public String getNotecont() {
		return notecont;
	}

	public void setNotecont(String notecont) {
		this.notecont = notecont;
	}

	public String getNoteregdate() {
		return noteregdate;
	}

	public void setNoteregdate(String noteregdate) {
		this.noteregdate = noteregdate;
	}

	public String getSendusercode() {
		return sendusercode;
	}

	public void setSendusercode(String sendusercode) {
		this.sendusercode = sendusercode;
	}

	public String getReceiverusercode() {
		return receiverusercode;
	}

	public void setReceiverusercode(String receiverusercode) {
		this.receiverusercode = receiverusercode;
	}

	public String getReadmark() {
		return readmark;
	}

	public void setReadmark(String readmark) {
		this.readmark = readmark;
	}

	public String getDelnote() {
		return delnote;
	}

	public void setDelnote(String delnote) {
		this.delnote = delnote;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBoard_title() {
		return boardtitle;
	}

	public void setBoard_title(String board_title) {
		this.boardtitle = board_title;
	}
	
	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	@Override
	public String toString() {
		return "MyNoteVo [noteidx=" + noteidx + ", notetitle=" + notetitle + ", notecont=" + notecont + ", noteregdate="
				+ noteregdate + ", sendusercode=" + sendusercode + ", receiverusercode=" + receiverusercode
				+ ", readmark=" + readmark + ", delnote=" + delnote + ", nickname=" + nickname + ", board_title="
				+ boardtitle + ", usercode=" + usercode + "]";
	}



}
