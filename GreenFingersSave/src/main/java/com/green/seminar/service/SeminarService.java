package com.green.seminar.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface SeminarService {

	void insertSeminar(HashMap<String, Object> map, HttpServletRequest request);



}
