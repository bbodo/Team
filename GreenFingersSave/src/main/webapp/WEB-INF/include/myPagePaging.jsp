<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sendPaing">
<c:set  var="startnum"           value="${ sendPagingVo.pagestartnum    }" /> 
<c:set  var="endnum"             value="${ sendPagingVo.pageendnum      }" /> 
<c:set  var="totalpagecount"     value="${ sendPagingVo.totalpagecount  }" /> 
  <table width="500" height="25"  align="center"  >
   <tr>
     <td width="500" height="25"  align="center" >
   
   <!-- 처음/ 이전 -->     
   <c:if test="${ startnum gt 1 }">
     <a href="/myPage/myList?nowpage=1">처음</a>
     <a href="/myPage/myList?nowpage=${ startnum - 1 }">
     [이전]
     </a>
   </c:if>
   
   <!-- 1 2 3 4 5 6 [7] 8 9 10  -->
   <c:forEach  var="pagenum"  begin="${startnum}"  end="${endnum}"  step="1">
      <a href="/myPage/myList?nowpage=${ pagenum }">
      ${ pagenum }
      </a>&nbsp;&nbsp;     
   </c:forEach>    
   
   <!-- 다음 / 마지막 -->
   <c:if test="${ totalpagecount ne endnum }">
     <a href="/myPage/myList?nowpage=${ endnum + 1 }">
     [다음]
     </a>
     <a href="/myPage/myList?nowpage=${ totalpagecount }">마지막</a>
   </c:if>    
   
    </td>
   </tr>    
  </table>   
</div>

<!-- 받은 쪽지 -->
<div id="recPaing">
<c:set  var="startnum1"           value="${ recPagingVo.pagestartnum    }" /> 
<c:set  var="endnum1"             value="${ recPagingVo.pageendnum      }" /> 
<c:set  var="totalpagecount1"     value="${ recPagingVo.totalpagecount  }" /> 
  <table width="500" height="25"  align="center"  >
   <tr>
     <td width="500" height="25"  align="center" >
   
   <!-- 처음/ 이전 -->     
   <c:if test="${ startnum1 gt 1 }">
     <a href="/myPage/myList?nowpage=1">처음</a>
     <a href="/myPage/myList?nowpage=${ startnum1 - 1 }">
     [이전]
     </a>
   </c:if>
   
   <!-- 1 2 3 4 5 6 [7] 8 9 10  -->
   <c:forEach  var="pagenum"  begin="${startnum1}"  end="${endnum1}"  step="1">
      <a href="/myPage/myList?nowpage=${ pagenum }">
      ${ pagenum }
      </a>&nbsp;&nbsp;     
   </c:forEach>    
   
   <!-- 다음 / 마지막 -->
   <c:if test="${ totalpagecount1 ne endnum1 }">
     <a href="/myPage/myList?nowpage=${ endnum1 + 1 }">
     [다음]
     </a>
     <a href="/myPage/myList?nowpage=${ totalpagecount1 }">마지막</a>
   </c:if>    
   
    </td>
   </tr>    
  </table>   
</div>