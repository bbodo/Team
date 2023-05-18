package com.green.myPage.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.myPage.vo.FilesVo;


public class MypageFile {

	public static void save(
			HashMap<String, Object> map, 
			HttpServletRequest request) {
		
		// 자료실에 파일이 저장될 경로(디렉토리) 지정 없으면 생성
		String  filePath   =  "d:\\uploadProfile\\";
		File    dir        =  new File(filePath);
		if( !dir.exists() ) {
			dir.mkdir();    // make directory   
		}
		
		String userid = (String) map.get("userid");
		
		// 파일 저장
		MultipartHttpServletRequest  multipartHttpServletRequest
		  =  (MultipartHttpServletRequest) request;
				
		// write.jsp 보내준 여러파일의 이름을 추출
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
				
		MultipartFile  multipartFile = null;
		
		List<FilesVo>  fileList      = new ArrayList<>();
		
		String         fileName      = null;
		String         fileExt       = null;
		
		// 넘어온 파일을 한개씩 반복 처리한다
		while( iterator.hasNext() ) {
			multipartFile = multipartHttpServletRequest.getFile( iterator.next() );
			
			if( !multipartFile.isEmpty() ) {
				fileName     =  multipartFile.getOriginalFilename(); // 손.흥민.jpg
				fileExt      =  fileName.substring( fileName.lastIndexOf('.') );   // .jpg  
				
			
				String path = "d:\\uploadProfile\\";
				String sfile = userid;
				File   file  = new File(path + sfile);
				if(file.exists())
					file.delete();
				
				FilesVo  vo   = new FilesVo(0, 0, fileName, fileExt, userid);
				fileList.add( vo );
				
				//  파일 저장
				File     filesave = new File( filePath + userid); 
				try {
					multipartFile.transferTo( filesave );     // 실제 파일 저장
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}  
				
			}  // if end
			
		}  //hwile end
		
		map.put("fileList", fileList );
		
	}

}








