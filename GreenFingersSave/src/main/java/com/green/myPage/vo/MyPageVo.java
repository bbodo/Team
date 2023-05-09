package com.green.mypage.vo;

public class MyPageVo {
	//Fields
	
	//MEMBER (받은 쪽지 정보)
	private int usercode;
	private String nickname;
	private String grade;
	private String point;
	
	//NOTE
	private int rnum;
	private int note_idx;
	private String note_title;
	private String note_cont;
	private String note_regdate;
	private String send_usercode;
	private String receiver_usercode;
	private String readmark;
	private String delnote;
	
	//BOARD
	private String board_title; //(받은 쪽지 정보에서도 사용)
	
	// paging 처리를 위한 추가 정보
	// sql 문을 위한 변수
	private  int      nowpage;          // 현재 페이지
	private  int      pagecount;        // 현재 페이지에 보여줄 row 수
	private  int      totalcount;       // 전체 자료(row)수
	
	// paging.jsp 가 쓸 변수
	private  int      totalpagecount;   // 화면에 보여줄 페이지 수
	private  int      pagestartnum;     // 페이지 시작 번호
	private  int      pageendnum;       // 페이지 끝   번호
	private  int      pagegrpnum;       // 페이지 그룹 번호
	
	//Constructor
	public MyPageVo() {}

	public MyPageVo(int usercode, String nickname, String grade, int rnum, int note_idx, String note_title,
			String note_cont, String note_regdate, String send_usercode, String receiver_usercode, String readmark,
			String delnote, String board_title, int nowpage, int pagecount, int totalcount, int totalpagecount,
			int pagestartnum, int pageendnum, int pagegrpnum) {
		super();
		this.usercode = usercode;
		this.nickname = nickname;
		this.grade = grade;
		this.rnum = rnum;
		this.note_idx = note_idx;
		this.note_title = note_title;
		this.note_cont = note_cont;
		this.note_regdate = note_regdate;
		this.send_usercode = send_usercode;
		this.receiver_usercode = receiver_usercode;
		this.readmark = readmark;
		this.delnote = delnote;
		this.board_title = board_title;
		this.nowpage = nowpage;
		this.pagecount = pagecount;
		this.totalcount = totalcount;
		this.totalpagecount = totalpagecount;
		this.pagestartnum = pagestartnum;
		this.pageendnum = pageendnum;
		this.pagegrpnum = pagegrpnum;
	}

	public int getUsercode() {
		return usercode;
	}

	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getNote_idx() {
		return note_idx;
	}

	public void setNote_idx(int note_idx) {
		this.note_idx = note_idx;
	}

	public String getNote_title() {
		return note_title;
	}

	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}

	public String getNote_cont() {
		return note_cont;
	}

	public void setNote_cont(String note_cont) {
		this.note_cont = note_cont;
	}

	public String getNote_regdate() {
		return note_regdate;
	}

	public void setNote_regdate(String note_regdate) {
		this.note_regdate = note_regdate;
	}

	public String getSend_usercode() {
		return send_usercode;
	}

	public void setSend_usercode(String send_usercode) {
		this.send_usercode = send_usercode;
	}

	public String getReceiver_usercode() {
		return receiver_usercode;
	}

	public void setReceiver_usercode(String receiver_usercode) {
		this.receiver_usercode = receiver_usercode;
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

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public int getNowpage() {
		return nowpage;
	}

	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}

	public int getPagecount() {
		return pagecount;
	}

	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}

	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}

	public int getTotalpagecount() {
		return totalpagecount;
	}

	public void setTotalpagecount(int totalpagecount) {
		this.totalpagecount = totalpagecount;
	}

	public int getPagestartnum() {
		return pagestartnum;
	}

	public void setPagestartnum(int pagestartnum) {
		this.pagestartnum = pagestartnum;
	}

	public int getPageendnum() {
		return pageendnum;
	}

	public void setPageendnum(int pageendnum) {
		this.pageendnum = pageendnum;
	}

	public int getPagegrpnum() {
		return pagegrpnum;
	}

	public void setPagegrpnum(int pagegrpnum) {
		this.pagegrpnum = pagegrpnum;
	}

	@Override
	public String toString() {
		return "MyPageVo [usercode=" + usercode + ", nickname=" + nickname + ", grade=" + grade + ", rnum=" + rnum
				+ ", note_idx=" + note_idx + ", note_title=" + note_title + ", note_cont=" + note_cont
				+ ", note_regdate=" + note_regdate + ", send_usercode=" + send_usercode + ", receiver_usercode="
				+ receiver_usercode + ", readmark=" + readmark + ", delnote=" + delnote + ", board_title=" + board_title
				+ ", nowpage=" + nowpage + ", pagecount=" + pagecount + ", totalcount=" + totalcount
				+ ", totalpagecount=" + totalpagecount + ", pagestartnum=" + pagestartnum + ", pageendnum=" + pageendnum
				+ ", pagegrpnum=" + pagegrpnum + "]";
	}


}
