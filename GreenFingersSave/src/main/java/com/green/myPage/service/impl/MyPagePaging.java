package com.green.myPage.service.impl;

import com.green.myPage.vo.MyPageVo;

public class MyPagePaging {
	private   int     nowpage;
	private   int     pagecount;
	private   int     totalcount;
	private   int     pagetotalcount;
	
	
	public MyPagePaging() {}
	public MyPagePaging(int nowpage, int pagecount, int totalcount, int pagetotalcount) {
		this.nowpage = nowpage;
		this.pagecount = pagecount;
		this.totalcount = totalcount;
		this.pagetotalcount = pagetotalcount;
	}
	
	// method
	public MyPageVo getMyPagePagingInfo() {
		
		MyPageVo vo = new MyPageVo();
		
		int          totalpagecount = 
				(int) Math.ceil( (double) totalcount / (double) pagecount );

		int          pagestartnum   =  (nowpage-1)  /  pagetotalcount * pagetotalcount + 1;
		int          pageendnum     =  ((nowpage-1) /  pagetotalcount + 1) * pagetotalcount;		
		if( pageendnum > totalpagecount  )
			pageendnum  =  totalpagecount;
		
		vo.setPagestartnum( pagestartnum );
		vo.setPageendnum( pageendnum );
		vo.setTotalpagecount( totalpagecount );
		
		return vo;
	}

	
	
}
