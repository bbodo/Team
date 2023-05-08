package com.green.event.Vo;

public class EventVo {

	// Fields
		private int 	board_idx;
		private String 	submenu_id;
		private String 	board_title;
		private String 	board_cont;
		private int 	market_value;
		private int 	usercode;
		private int 	managercode;
		private String 	board_regdate;
		private int		readcount;
		private int 	bnum;
		private int 	lvl;
		private int 	step;
		private int 	nref;
		private int 	delboard;
		private int 	parent;
		private String	userid;
		private String  nickname;
		
		// paging 처리를 위한 추가 정보
		// sql 문을 위한 변수
	private  int      nowpage;          // 현재 페이지
	private  int      pagecount;        // 현재 페이지에 보여줄 row 수
	private  int      totalcount;       // 전체 자료(row)수
	
	// paging.jsp 가 쓸 변수
	private  int      totalpagecount;   // 화면에 보여줄 페이지 수
	private  int      pagestartnum;     // 페이지 시작 번호
	private  int      pageendnum;       // 페이지 끝   번호
	private  int      pagegrpnum;       // 페이지 그룹 번호.
	
	public EventVo() {}
	public EventVo(int board_idx, String submenu_id, String board_title, String board_cont, int market_value,
			int usercode, int managercode, String board_regdate, int readcount, int bnum, int lvl, int step, int nref,
			int delboard, int parent, String userid, String nickname, int nowpage, int pagecount, int totalcount,
			int totalpagecount, int pagestartnum, int pageendnum, int pagegrpnum) {
		super();
		this.board_idx = board_idx;
		this.submenu_id = submenu_id;
		this.board_title = board_title;
		this.board_cont = board_cont;
		this.market_value = market_value;
		this.usercode = usercode;
		this.managercode = managercode;
		this.board_regdate = board_regdate;
		this.readcount = readcount;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.delboard = delboard;
		this.parent = parent;
		this.userid = userid;
		this.nickname = nickname;
		this.nowpage = nowpage;
		this.pagecount = pagecount;
		this.totalcount = totalcount;
		this.totalpagecount = totalpagecount;
		this.pagestartnum = pagestartnum;
		this.pageendnum = pageendnum;
		this.pagegrpnum = pagegrpnum;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getSubmenu_id() {
		return submenu_id;
	}
	public void setSubmenu_id(String submenu_id) {
		this.submenu_id = submenu_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_cont() {
		return board_cont;
	}
	public void setBoard_cont(String board_cont) {
		this.board_cont = board_cont;
	}
	public int getMarket_value() {
		return market_value;
	}
	public void setMarket_value(int market_value) {
		this.market_value = market_value;
	}
	public int getUsercode() {
		return usercode;
	}
	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}
	public int getManagercode() {
		return managercode;
	}
	public void setManagercode(int managercode) {
		this.managercode = managercode;
	}
	public String getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getNref() {
		return nref;
	}
	public void setNref(int nref) {
		this.nref = nref;
	}
	public int getDelboard() {
		return delboard;
	}
	public void setDelboard(int delboard) {
		this.delboard = delboard;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
		return "EventVo [board_idx=" + board_idx + ", submenu_id=" + submenu_id + ", board_title=" + board_title
				+ ", board_cont=" + board_cont + ", market_value=" + market_value + ", usercode=" + usercode
				+ ", managercode=" + managercode + ", board_regdate=" + board_regdate + ", readcount=" + readcount
				+ ", bnum=" + bnum + ", lvl=" + lvl + ", step=" + step + ", nref=" + nref + ", delboard=" + delboard
				+ ", parent=" + parent + ", userid=" + userid + ", nickname=" + nickname + ", nowpage=" + nowpage
				+ ", pagecount=" + pagecount + ", totalcount=" + totalcount + ", totalpagecount=" + totalpagecount
				+ ", pagestartnum=" + pagestartnum + ", pageendnum=" + pageendnum + ", pagegrpnum=" + pagegrpnum + "]";
	}
	

	
		
}
