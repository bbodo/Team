<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 등록</title>
<link rel="shortcut icon" href="/img/favicon.ico">
<link rel="stylesheet" href="/css/common.css" />

<style>
   th      { width : 20%;  }  
   td      { width : 80%; padding : 50;  }  
   input[type=text] ,  input[type=password], input[type=email]    { width:100%; } 
   table {margin  : auto; }  
   h2 {text-align : center}
   
   #title {
		width: 100%;
		text-align: center;
		height: 100px;
		background-color: orange;
	}
#title p {
		 line-height: 100px;
	}
   
  #id {
  width:300px;
  height:50px;
  font-size:20px;
}
  #pwd1 {
  width:300px;
  height:50px;
  font-size:20px;
}
  #pwd2 {
  width:300px;
  height:50px;
  font-size:20px;
}
  #name {
  width:300px;
  height:50px;
  font-size:20px;
}
  #birh {
  width:300px;
  height:50px;
  font-size:20px;
}
  #mail {
  width:300px;
  height:50px;
  font-size:20px;
}

  #add {
  width:300px;
  height:50px;
  font-size:20px;
}
   
</style>

</head>
<body>
     <div id="title">
     	<p>반려식물 회원가입</p>
     </div>
  <div id="main">
  <h2>회원 가입</h2>
  <form action="/User/Write" method="POST" >
  <table>
   <tr>
     <th>아이디</th>
     <td><input type="text" name="userid"  id = "id"/></td>
   </tr> 
   <tr>
     <th>비밀번호</th>
     <td><input type="password" name="passwd" id="pwd1" /></td>
   </tr> 
   <tr>
     <th>비밀번호 확인</th>
     <td><input type="password" id="pwd2" /></td>
   </tr> 
   <tr>
     <th>이름</th>
     <td><input type="text" name="username" id = "name"/></td>
   </tr> 
   <tr>
     <th>생년월일</th>
     <td><input type="date" name="userBirth" id="birth"/> </td>
   </tr> 
   <tr>
     <th>성별</th>
     <td><input type="radio" name="userGender" data-th-value="남"/>남
         <input type="radio" name="userGender" data-th-value="녀"/>녀</td>
   </tr> 
   <tr>
     <th>이메일</th>
     <td><input type="email" name="email" id ="mail"/></td>
   </tr> 
   <tr>
     <th>주소</th>
     <td><input type="text" name="adder" id="add"/></td>
   </tr>  
   <tr>     
     <td colspan="2">
     <button type="submit" style="width:50pt;height:30pt; float: right; "> 가입 </button>
     </td>
   </tr> 
  </table>
  </form>
  </div>
</body>
</html>








