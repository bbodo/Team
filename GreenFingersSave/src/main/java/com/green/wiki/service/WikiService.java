package com.green.wiki.service;

import java.io.IOException;

public interface WikiService {

	// Api data 받아오기
	String search(String keyword, int numOfRows, int pageNo) throws IOException;




}
