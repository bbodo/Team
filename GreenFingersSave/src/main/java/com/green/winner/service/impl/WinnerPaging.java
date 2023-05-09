package com.green.winner.service.impl;

import com.green.board.vo.BoardVo;
import com.green.event.Vo.EventVo;
import com.green.winner.Vo.WinnerVo;

public class WinnerPaging {

	// Fields
	private   String  menu_id;
	private   int     nowpage;
	private   int     pagecount;
	private   int     totalcount;
	private   int     pagetotalcount;
	
	// 생성자
	public WinnerPaging(
			String menu_id, int nowpage, int pagecount, int totalcount, int pagetotalcount) {
		this.menu_id          =  menu_id;
		this.nowpage          =  nowpage;
		this.pagecount        =  pagecount;
		this.totalcount       =  totalcount;
		this.pagetotalcount   =  pagetotalcount;
	}

	// method
	public WinnerVo getPdsPagingInfo() {
		
		WinnerVo  vo             =  new WinnerVo();

		int          totalpagecount = 
				(int) Math.ceil( (double) totalcount / (double) pagecount );

		int          pagestartnum   =  (nowpage-1)  /  pagetotalcount * pagetotalcount + 1;
		int          pageendnum     =  ((nowpage-1) /  pagetotalcount + 1) * pagetotalcount;		
		if( pageendnum > totalpagecount  )
			pageendnum  =  totalpagecount;
					
		vo.setSubmenu_id( menu_id );
		vo.setPagestartnum( pagestartnum );
		vo.setPageendnum( pageendnum );
		vo.setTotalpagecount( totalpagecount );
		
		return  vo;
		
	}
	
	// 

}








