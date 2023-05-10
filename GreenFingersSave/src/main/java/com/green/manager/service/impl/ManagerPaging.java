package com.green.manager.service.impl;

import com.green.manager.vo.StoreVo;

public class ManagerPaging {

	// Fields
	private   String  menu_id;
	private   int     nowpage;
	private   int     pagecount;
	private   int     totalcount;
	private   int     pagetotalcount;
	
	// 생성자
	public ManagerPaging(
			String menu_id, int nowpage, int pagecount, int totalcount, int pagetotalcount) {
		this.menu_id          =  menu_id;
		this.nowpage          =  nowpage;
		this.pagecount        =  pagecount;
		this.totalcount       =  totalcount;
		this.pagetotalcount   =  pagetotalcount;
	}

	// method
	public StoreVo getPdsPagingInfo() {
		
		StoreVo  vo             =  new StoreVo();

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
}
