package com.green.wiki.service;

import java.io.IOException;

public interface WikiService {

	// 식물도감 Api data 받아오기
	String search(String keyword, int numOfRows, int pageNo) throws IOException;

	// 식물상세 Api data 받아오기
	String detailsearch(int q1) throws IOException;




}
