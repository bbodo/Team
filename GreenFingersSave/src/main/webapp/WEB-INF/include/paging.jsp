<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
 
	<c:set  var="menu_id"            value="${ boardVo.submenu_id     }" /> 
	<c:set  var="startnum"           value="${ boardVo.pagestartnum   }" /> 
	<c:set  var="endnum"             value="${ boardVo.pageendnum     }" /> 
	<c:set  var="totalpagecount"     value="${ boardVo.totalpagecount }" /> 

<!-- 메뉴목록 -->

<div style="text-align: center;">
    <table style="margin: 0 auto;">
     <tr>
       <td width="500" height="25"  align="center" >
     
     <!-- 처음/ 이전 -->     
     <c:if test="${ startnum gt 1 }">
       <a href="/Board/List?${ map.menu_id }&submenu_id=${ menu_id }&nowpage=1">처음</a>
       <a href="/Board/List?${ map.menu_id }&submenu_id=${ menu_id }&nowpage=${ startnum - 1 }">
       [이전]
       </a>
     </c:if>
     
     <!-- 1 2 3 4 5 6 [7] 8 9 10  -->
     <c:forEach  var="pagenum"  begin="${startnum}"  end="${endnum}"  step="1">
        <a href="/Board/List?menu_id=${ map.menu_id }&submenu_id=${ menu_id }&nowpage=${ pagenum }">
        ${ pagenum }
        </a>&nbsp;&nbsp;     
     </c:forEach>    
     
     <!-- 다음 / 마지막 -->
     <c:if test="${ totalpagecount ne endnum }">
       <a href="/Board/List?${ map.menu_id }&submenu_id=${ menu_id }&nowpage=${ endnum + 1 }">
       [다음]
       </a>
       <a href="/Board/List?${ map.menu_id }&submenu_id=${ menu_id }&nowpage=${ totalpagecount }">마지막</a>
     </c:if>    
      </td>
     </tr>    
    </table>   
  </div>









    