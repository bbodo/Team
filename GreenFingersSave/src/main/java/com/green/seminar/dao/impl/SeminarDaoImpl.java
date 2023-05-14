package com.green.seminar.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.myPage.vo.FilesVo;
import com.green.seminar.dao.SeminarDao;

@Repository("SeminarDao")
public class SeminarDaoImpl implements SeminarDao {
	
	@Autowired
	private SqlSession  sqlSession;

	@Override
	public void setSave(HashMap<String, Object> map) {
		sqlSession.insert("seminarMapper.InsertSave", map);
		
		List<FilesVo> fileList = (List<FilesVo>) map.get("fileList");
		if(fileList.size() !=0 )
			sqlSession.insert("seminarMapper.Updatefile", map);
	}
	
}
