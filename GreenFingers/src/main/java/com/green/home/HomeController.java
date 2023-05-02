package com.green.home;

<<<<<<< Updated upstream:GreenFingers/src/main/java/com/green/home/HomeController.java
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
=======
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.XMLOutputter;
>>>>>>> Stashed changes:GreenFingers/src/main/java/com/green/user/HomeController.java
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.user.service.UserService;
import com.green.user.vo.UserVo;

import com.green.xml.Controller.DataVo;

@Controller 
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	// --------------------------- 양식을 위한 주소
	// --------------------------- 그림 다그리고 컨트롤러 다시 만들죠~
	
	// ---------Board---------
	@RequestMapping("/board")
	public String board() {
		return "/board/list";
	}
	@RequestMapping("/write")
	public String write() {
		return "/board/write";
	}
	@RequestMapping("/view")
	public String view() {
		return "/board/view";
	}
	
	@RequestMapping("/update")
	public String update() {
		return "/board/update";
	}
	
	
	// ---------user---------
	@RequestMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	@RequestMapping("/loginprocess")
	public String loginprocess(
			HttpSession session,
			@RequestParam HashMap<String, Object> map
			) {
		String returnURL = "";
		
		if(session.getAttribute("login") != null) {
			// 기존 login 정보가 존재한다면 
			session.removeAttribute("login");
		}
		
		// 로그인 성공하면
		UserVo vo = userService.getLogin(map);
		if ( vo != null) {
			session.setAttribute("login", vo);
			returnURL = "redirect:/";
		} else {
			returnURL = "redirect:/login";
		}
		
		return returnURL;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(
			HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/login";
	}
	
	@RequestMapping("/userwrite")
	public String userwrite() {
		return "/user/userwrite";
	}
	


	
	@RequestMapping("qalist")
	public String qlist() {
		return "/board/qalist";
	}
	
	@RequestMapping("qawrite")
	public String qawrite() {
		return "/board/qawrite";
	}
	

	// ---------Event---------
	@RequestMapping("/eventList")
	public String eventList() {
		return "/event/eventList";
	}
	@RequestMapping("/eventView")
	public String eventView() {
		return "/event/eventView";
	}
	@RequestMapping("/winnerList")
	public String winnerList() {
		return "/event/winnerList";
	}
	@RequestMapping("/winnerView")
	public String winnerView() {
		return "/event/winnerView";
	}

	// ---------mypage---------
	
	@RequestMapping("/myList")
	public String myList() {
		return "/mypage/myList";
	}
	@RequestMapping("/myNote")
	public String myNote() {
		return "/mypage/myNote";
	}
	@RequestMapping("/myNoteWrite")
	public String myNoteWrite() {
		return "/mypage/myNoteWrite";
	}
	@RequestMapping("/myPageCheck")
	public String myPageCheck() {
		return "/mypage/myPageCheck";
	}
	@RequestMapping("/myPageUpdate")
	public String myPageUpdate() {
		return "/mypage/myPageUpdate";
	}
	
	// ---------admin---------

	@RequestMapping("/memberManagement")
	public String memberManagement() {
		return "/admin/memberManagement";
	}
	@RequestMapping("/memberUpdate")
	public String memberUpdate() {
		return "/admin/memberUpdate";
	}
	@RequestMapping("/menuManagement")
	public String menuManagement() {
		return "/admin/menuManagement";
	}
	@RequestMapping("/menuWrite")
	public String menuWrite() {
		return "/admin/menuWrite";
	}
	@RequestMapping("/subMenuManagement")
	public String subMenuManagement() {
		return "/admin/subMenuManagement";
	}
	@RequestMapping("/subMenuWrite")
	public String subMenuWrite() {
		return "/admin/subMenuWrite";
	}
	
	
	//---------market-----------------

    @RequestMapping("/market")
    public String market() {
        return "/market/list";
    }
    @RequestMapping("/marketWrite")
    public String marketWrite() {
    	return "/market/write";
    }
    @RequestMapping("/marketUpdate")
    public String marketUpdate() {
    	return "/market/update";
    }
<<<<<<< Updated upstream:GreenFingers/src/main/java/com/green/home/HomeController.java
    @RequestMapping("/marketView")
    public String marketView() {
    	return "/market/view";
    }
=======
    
    @RequestMapping("/green")
    public String test() {
    	return "redirect:/static/html/green.html";
    }
    /*
    //-------------------------------------------
	@RequestMapping("/index")
	public String index(Model m) throws Exception{

		StringBuffer sb = new StringBuffer("http://api.nongsaro.go.kr/service/garden/gardenDtl");


		sb.append("ServiceKey=202305025VHPZXP3YHGROCJF74CBW");
		sb.append("&areaCode=35");
		sb.append("&MobileOS=ETC");
		sb.append("&MobileApp=AppTest");
		sb.append("&pageNo=1");
		sb.append("&numOfRows=10");

		URL url = new URL(sb.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestProperty("Content-Type","application/xml");

		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();

		Document document = builder.build(conn.getInputStream());
		System.out.println(document);

		Element root = document.getRootElement();
		//루트의 자식!이니까 child를 얻어야한다!
		Element body = root.getChild("body");
		System.out.println(body);
		//body안에 있는 items라는 엘리먼트를 얻어야한다.
		Element items = body.getChild("items");
		System.out.println(items);
		//items안에있는 자식들을 가져오자 ! 여러개니까 리스트여야겠지 ? 타입은 엘리먼트 !!
		List<Element> item_list = items.getChildren("item");


        DataVo[] ar = new DataVo[item_list.size()];
		
		int i = 0;
		for(Element item:item_list) {
			
			String cntntsNo = item.getChildText("cntntsNo");
			String cntntsSj = item.getChildText("cntntsSj");
			String rtnFileSn = item.getChildText("rtnFileSn");
			String rtnFileSeCode = item.getChildText("rtnFileSeCode");
			
			String rtnFileSeCodeName = item.getChildText("rtnFileSeCodeName");
			String rtnImgSeCode = item.getChildText("rtnImgSeCode");
			String rtnImgSeCodeName = item.getChildText("rtnImgSeCodeName");
			String rtnOrginlFileNm = item.getChildText("rtnOrginlFileNm");
			String rtnImageDc = item.getChildText("rtnImageDc");
			String rtnFileUrl = item.getChildText("rtnFileUrl");
			String rtnThumbFileUrl = item.getChildText("rtnThumbFileUrl");
			
			String fmlNm = item.getChildText("fmlNm");
			String smellCode = item.getChildText("smellCode");
			String managelevelCode = item.getChildText("managelevelCode");
			String grwtveCode = item.getChildText("grwtveCode");
			String grwhTpCode = item.getChildText("grwhTpCode");
			
			String winterLwetTpCode = item.getChildText("winterLwetTpCode");
			String hdCode = item.getChildText("hdCode");
			String watercycleSprngCode = item.getChildText("watercycleSprngCode");
			String watercycleSummerCode = item.getChildText("watercycleSummerCode");
			String watercycleAutumnCode = item.getChildText("watercycleAutumnCode");
			String watercycleWinterCode = item.getChildText("watercycleWinterCode");
			String managedemanddoCode = item.getChildText("managedemanddoCode");
			String clCode = item.getChildText("clCode");
			String grwhstleCode = item.getChildText("grwhstleCode");
			String indoorpsncpacompositionCode = item.getChildText("indoorpsncpacompositionCode");
			String eclgyCode = item.getChildText("eclgyCode");
			String lefmrkCode = item.getChildText("lefmrkCode");
			String lefcolrCode = item.getChildText("lefcolrCode");
			String ignSeasonCode = item.getChildText("ignSeasonCode");
			
			String flclrCode = item.getChildText("flclrCode");
			String fmldeSeasonCode = item.getChildText("fmldeSeasonCode");
			String fmldecolrCode = item.getChildText("fmldecolrCode");
			String prpgtmthCode = item.getChildText("prpgtmthCode");
			String lighttdemanddoCode = item.getChildText("lighttdemanddoCode");
			String postngplaceCode = item.getChildText("postngplaceCode");
			String dlthtsCode = item.getChildText("dlthtsCode");
									
			DataVo vo = new DataVo(
					cntntsNo,
					cntntsSj,
					rtnFileSn,
					rtnFileSeCode,

					rtnFileSeCodeName,
					rtnImgSeCode,
					rtnImgSeCodeName,
					rtnOrginlFileNm,
					rtnImageDc,
					rtnFileUrl,
					rtnThumbFileUrl,

					fmlNm,
					smellCode,
					managelevelCode,
					grwtveCode,
					grwhTpCode,

					winterLwetTpCode,
					hdCode,
					watercycleSprngCode,
					watercycleSummerCode,
					watercycleAutumnCode,
					watercycleWinterCode,
					managedemanddoCode,
					clCode,
					grwhstleCode,
					indoorpsncpacompositionCode,
					eclgyCode,
					lefmrkCode,
					lefcolrCode,
					ignSeasonCode,

					flclrCode,
					fmldeSeasonCode,
					fmldecolrCode,
					prpgtmthCode,
					lighttdemanddoCode,
					postngplaceCode,
					dlthtsCode
);
			
			ar[i++] = vo;

	}
		
		m.addAttribute("list", ar);
		return "index";
}
	*/
    
>>>>>>> Stashed changes:GreenFingers/src/main/java/com/green/user/HomeController.java
    
}
