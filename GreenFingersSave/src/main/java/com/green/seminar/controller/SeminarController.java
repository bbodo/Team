package com.green.seminar.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.seminar.service.SeminarService;
import com.green.user.vo.UserVo;

@Controller
@RequestMapping("Manager")
public class SeminarController {
	@Autowired
	private SeminarService seminarservice;
	
	@RequestMapping("SeminarWrite")
	public ModelAndView seminarWrite(HttpSession session,
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request) {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		//Object usercode = userVo.getUsercode();
		map.put("usercode", 0);
		
		System.out.println(request);
		System.out.println(request.toString());
		System.out.println(map.toString());
		
		//등록 
		seminarservice.insertSeminar(map, request);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/event/seminarWrite");
		//mv.addObject("seminarservice", seminarservice);
		return mv;
	} 
	
	@RequestMapping("SeminarSmarteditor")
	public ModelAndView SeminarSmarteditor(HttpSession session,
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			//request.
			//파일정보
			String sFileInfo = "";
			//파일명을 받는다 - 일반 원본파일명
			String sFilename = request.getHeader("file-name");
			//파일 확장자
			String sFilenameExt = sFilename.substring(sFilename.lastIndexOf(".")+1);
			//확장자를소문자로 변경
			sFilenameExt = sFilenameExt.toLowerCase();
			
				
			//이미지 검증 배열변수
			String[] allowFileArr = {"jpg","png","bmp","gif"};

			//확장자 체크
			int nCnt = 0;
			for(int i=0; i<allowFileArr.length; i++) {
				if(sFilenameExt.equals(allowFileArr[i])){
					nCnt++;
				}
			}

			//이미지가 아니라면
			if(nCnt == 0) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_"+sFilename);
				print.flush();
				print.close();
			} else {
				//디렉토리 설정 및 업로드	
				
				//파일저장
				
				/*
				 * CommonFilesVo commonFilesVo = new CommonFilesVo();
				 * commonFilesVo.setFilename(sFilename);
				 * 
				 * seminarservice.updatefile(map, request); String filePath = (String)
				 * map.get("filePath");
				 */
				
				
				String filePath = "d:\\upload\\";
				File file = new File(filePath);
				
				if(!file.exists()) {
					file.mkdirs();
				}
				
				/*
				 * String filePath = "d:\\upload\\"; File dir = new File(filePath); if(
				 * !dir.exists() ) { dir.mkdir(); // make directory }
				 */
				
				String sRealFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				sRealFileNm = today+UUID.randomUUID().toString() + sFilename.substring(sFilename.lastIndexOf("."));
				String rlFileNm = filePath + sRealFileNm;
				
				///////////////// 서버에 파일쓰기 ///////////////// 
				//System.out.println("request"+request);
				//System.out.println("request"+request.getInputStream());
				InputStream inputStream = request.getInputStream();
				//System.out.println("111"+inputStream);
				OutputStream outputStream=new FileOutputStream(rlFileNm);
				int numRead;
				System.out.println("111"+request.getHeader("file-size"));
				/* System.out.println(outputStream.write(b);); */
				byte bytes[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				//System.out.println("222"+request.getHeader("file-size"));
				//System.out.println("222"+bytes);
				while((numRead = inputStream.read(bytes,0,bytes.length)) != -1){
					//System.out.println("333"+numRead);
					outputStream.write(bytes,0,numRead);
					//System.out.println("444"+outputStream);
				}
				if(inputStream != null) {
					inputStream.close();
				}
				outputStream.flush();
				outputStream.close();
				
				///////////////// 이미지 /////////////////
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName="+ sFilename;
				sFileInfo += "&sFileURL="+ "/GreenFingersSave/upload/" +sRealFileNm;
				PrintWriter printWriter = response.getWriter();
				printWriter.print(sFileInfo);
				printWriter.flush();
				printWriter.close();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/event/seminarWrite");
		return mv;
	} 
	
}
