package com.green.myNote.vo;

public class MyNoteVo {
	//Fields
	private int noteidx;
	private String notetitle;
	private String notecont;
	private String noteregdate;
	private String sendusercode;
	private String receiverusercode;
	private String readmark;
	private String delnote;
	private String nickname;
	
	//Constructor
	public MyNoteVo() {}

	public MyNoteVo(int noteidx, String notetitle, String notecont, String noteregdate, String sendusercode,
			String receiverusercode, String readmark, String delnote, String nickname) {
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
	}
	
	//Getter/ Setter
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

	@Override
	public String toString() {
		return "MyNoteVo [noteidx=" + noteidx + ", notetitle=" + notetitle + ", notecont=" + notecont + ", noteregdate="
				+ noteregdate + ", sendusercode=" + sendusercode + ", receiverusercode=" + receiverusercode
				+ ", readmark=" + readmark + ", delnote=" + delnote + ", nickname=" + nickname + "]";
	}
	
}
