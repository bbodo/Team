package com.green.seminar.service.impl;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.common.service.CommonService;
import com.green.common.vo.FilesVo;
import com.green.myPage.dao.MyPageDao;
import com.green.myPage.service.impl.MypageFile;
import com.green.seminar.dao.SeminarDao;
import com.green.seminar.service.SeminarService;
@Service("SeminarService")
public class SeminarServiceImpl implements SeminarService {
	
	@Autowired
	private SeminarDao seminarDao;

	@Override
	public void insertSeminar(HashMap<String, Object> map, HttpServletRequest request) {
		CommonService.save(map, request);
		seminarDao.setSave(map);
	}


}
