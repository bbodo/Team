<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@include file="/WEB-INF/include/comHead.jsp" %>

<title>${ map.submenu_name } 게시글 상세보기</title>

<style type="text/css">

	* {
		box-sizing: border-box;
	} 

	#title {
		width: 100%;
		text-align: center;
		height: 100px;
		background-color: orange;
	}
	#title p {
		 line-height: 100px;
	}
	#section {
		height: auto;
	}
	#aside {
		float: left;
		height: 1500px;
		background-color: white;
		width: 15%;
		padding: 10px;
	}
	#main {
		width: 85%;
		height: auto;
		min-height: 1500px;
		float: left;
		padding: 10px;
		background-color: white;
		padding-right : 15%;
		min-height: calc(100% - 120px);
		padding-bottom: 100%;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 90%;
		border-collapse: collapse;
		margin-top: 10px;
		border-top: 3px solid #228B22;
	}
	#cont tr:nth-of-type(2) {
		border-bottom: 1px solid #228B22;
	}
	#reply_coment_cont {
		widows: 875px;
		height: 60px;
		resize: none;
	}
	#board_title {
		font-size: 32px;
		font-weight: bold;
	}
	#commentNoti {
		border-bottom: 3px solid #228B22;
		padding: 20px;
	}
	#readComment {
		margin-bottom: 50px;
	}
	#writeComment {
		border-bottom: 1px solid #228B22;
	}
	#sidemenu {
		padding: 30px;
	}
	#sidemenu li {
		padding: 10px;
	}
	#sidemenu li a {
		position: relative;
		display: block;
		font-size: 20px;
	}
	#sidemenu li a:after {
		content: "";
		position: absolute;
		left: 0;
		bottom: 24px;
		width: 0px;
		height: 3px;
		margin: 5px 0 0;
		transition: all 0.2s ease-in-out;
		transition-duration: 0.3s;
		opacity: 0;
		background-color: #2E8B57;
	}
	#sidemenu li a:hover:after {
		width: 100%;
		opacity: 1;
	}
	.nameSpace {
		padding: 30px;
	}
	.coment_cont {
		margin: 0 20px;
		width: 95%;
		padding: 3px;
		height: 70px;
		resize: none;
	}
	.contSpace {
		width: 70%;
		padding: 10px;
	}
	.comment_empty {
		padding-left: 80px;
	}

	#cont th td {
		padding: 15px;
		border-bottom: 1px solid #C0C0C0;
	}
	.right {
		text-align: right;
		margin-top: 20px;
		margin-right: 150px;
	}
	textarea {
		width: 1000px;
	}
	.floatright {
		float:right;
	}
	.floatleft {
		float:left;
	}
    #bc {
    	height: 500px;
    	vertical-align: top;
    	padding-top: 10px;
    }  

</style>

<script src="https://code.jquery.com/jquery.min.js"></script>
<script>

		function comment_update(coment_idx, coment_cont) {

			let cont = $("#comment_update_" + coment_idx).val();
			
			fetch("/Comment/CommentUpdate?coment_idx=" + coment_idx + "&coment_cont="+ cont +"&usercode=" + ${login.usercode})
				.then(res => res.json())
				.then(data => {
					comment_display(data);
				})
				.catch( err => {
					console.log(err);
					alert("오류발생 : " + err);
				});
		}

		function reply_comment(coment_idx, board_idx, com_bnum, com_lvl, com_step, com_nref, com_parent) {
			let coment_cont = $("#reply_coment_cont").val();
			
			fetch("/Comment/ReCommentWrite?coment_idx=" + coment_idx + "&board_idx=" + board_idx + "&coment_cont=" + coment_cont + "&usercode=" + ${login.usercode}
				  +"&com_bnum=" + com_bnum + "&com_lvl=" + com_lvl + "&com_step=" + com_step + "&com_nref=" + com_nref +
				  "&com_parent=" + com_parent)
				.then(res => res.json())
				.then(data => {
					comment_display(data);
				})
				.catch( err => {
					console.log(err);
					alert("오류발생 : " + err);
				});
		}
		
		function comment_back(coment_idx, coment_cont) {
			let html  = '';
				html += '<div>';
				html += '<div class="floatleft" id="commentCont_'+ coment_idx +'" onclick="c(' + coment_idx + ')">'+ coment_cont +'</div>';
				html += '</div>';
				
			console.log($('#comment_updateForm_'+ coment_idx));
			$('#comment_updateForm_'+ coment_idx).replaceWith(html);
		}

		function updateForm_comment(coment_idx, coment_cont) {
			let html  = '';
				html += `<div id="comment_updateForm_\${coment_idx}">`;
			    html += `<textarea name="coment_cont" id="comment_update_\${coment_idx}">\${coment_cont}</textarea>`;
			    html += `<input type="button" value="수정" onclick="comment_update(\${coment_idx})"/>`;
			    html += `<input type="button" value="취소" onclick="comment_back(\${coment_idx}, '\${coment_cont}')"/>`;
			    html += '</div>';
			
			$('#commentCont_'+ coment_idx).replaceWith(html);
			$('#comment_update_' + coment_idx).focus();
		}

		function delete_comment(comm) {
				if(window.confirm("정말 삭제하시겠습니까?")) {
					fetch("/Comment/Delete?coment_idx=" + comm)
						.then(res => res.text())
						.then(data => {
							if(data == "suc") {
								alert("삭제되었습니다");
								$("#comment_li_" + comm).remove()
								location.reload();
							} else {
								location.reload();
							}
						})
						.catch( err => {
							console.log(err);
							alert("오류발생 : " + err);
						});
				} else {
					console.log("취소")
				}
			
		}

		function c(coment_idx, board_idx, com_bnum, com_lvl, com_step, com_nref, com_parent) {
			if($("#comment_empty_" + coment_idx).length) {
				
				$("#comment_empty_" + coment_idx).remove()
			} else {
				const commentEl = $("#comment_li_" + coment_idx);
				let html  = '<li class="comment_empty" id=comment_empty_' + coment_idx + '>'
					html += '<div id="replyComment">'
				    html += `<b style="display:inline-block; width:\${com_lvl * 40}px"></b><textarea id="reply_coment_cont" name="comment_cont"></textarea><br />`;
					html += `<b style="display:inline-block; width:\${com_lvl * 40}px"></b><input type="button" value="대댓작성" id="replyBtn" onclick="reply_comment( \${coment_idx}, \${board_idx}, \${com_bnum}, \${com_lvl}, \${com_step}, \${com_nref}, \${com_parent})">`
					html += '</div></li>';
				
					commentEl.append(html);
			}
		}
		
		function comment_display(data) {
			let html = '';
			for (let comm of data) {
				html += '<li id="comment_li_' + comm.coment_idx +'">';
				if(comm.com_lvl == 0) {
					if(comm.delcoment == 0) {
						html += '<div class="floatleft nameSpace"><p><h2>'+ comm.nickname +'</h2></p></div>';
						html += '<div class="floatright dateSpace"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
						html += `<div class="floatleft contSpace" id="commentCont_\${comm.coment_idx}" onclick="c(\${comm.coment_idx}, \${comm.board_idx}, \${comm.com_bnum}, \${comm.com_lvl}, \${comm.com_step}, \${comm.com_nref}, \${comm.com_parent})">\${comm.coment_cont}</div><br />`;
						if(comm.usercode == ${login.usercode}) {
							html += '<div class="floatright btns"><input type="button" onclick="updateForm_comment('+ comm.coment_idx + ',\'' + comm.coment_cont + '\')" value="수정" />';
							html += '<input type="button" onclick="delete_comment(' + comm.coment_idx + ')" value="삭제" /></div><br />';
						}						
					} else {
						html += '<b>삭제된 댓글입니다.</b>';
					}					
				} else {
					if(comm.delcoment == 0) {
						html += `<b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>`;
						html += `<div class="floatleft nameSpace"><p><h2><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>\${comm.nickname}</h2></p></div>`;
						html += '<div class="floatright dateSpace"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
						html += `<div class="floatleft contSpace" id="commentCont_\${ comm.coment_idx }" onclick="c( \${comm.coment_idx}, \${comm.board_idx}, \${comm.com_bnum}, \${comm.com_lvl}, \${comm.com_step}, \${comm.com_nref}, \${comm.com_parent})"><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>\${comm.coment_cont}</div><br />`;
						if(comm.usercode == ${login.usercode}) {
							html += '<div class="floatright btns"><input type="button" onclick="updateForm_comment('+ comm.coment_idx + ',\'' + comm.coment_cont + '\')" value="수정" />';
							html += '<input type="button" onclick="delete_comment(' + comm.coment_idx + ')" value="삭제" /></div><br />';
						}	
					} else {
						html += `<div class="floatleft"><p><h2><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>\${comm.nickname}</h2></p></div>`;
						html += '<div class="floatright"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
						html += `<s><b style="display:inline-block; width:\${comm.com_lvl*20}px"></b>삭제된 댓글입니다.</s><br />`;
					}
				}
				html += '<br /></li>';
			}
			const commentListEl = document.getElementById("commentList");
			commentListEl.innerHTML = html;
			
		}
	window.onload = function() {
		
		const writeBtnEl = document.getElementById("writeBtn");
		const coment_contEl = document.getElementById("coment_cont");
		const readCEl = document.getElementById("readC");
		const writeCEl = document.getElementById("writeC");
		
		let datar = new FormData(readCEl);
		
		let optionR = {
				method : "POST",
				body : datar
		};
		
		fetch("/Comment/Read", optionR)
			.then( res => res.json() )
			.then( data => {
				comment_display(data);
				    
				})
			.catch( err => {
				console.log(err);
				alert("오류발생 : " + err);
			});
		
		writeBtnEl.addEventListener("click", function(e) {
			let dataw = new FormData(writeCEl);
			
			let optionW = {
					method : "POST",
					body : dataw
			};
			
			fetch("/Comment/Write", optionW)
				.then( res => res.json() )
				.then( data => {
					comment_display(data);
					coment_contEl.value = '';
					coment_contEl.focus();
				})
				.catch( err => {
					console.log(err);
					alert("오류발생 : " + err);
				})
		})
		
	}

</script>

</head>
<body>
	 <!-- header -->
	 <c:choose>
		<c:when test="${ sessionScope.login eq null }">
			<%@include file="/WEB-INF/include/header.jsp" %>
		</c:when>
		<c:otherwise>
			<%@include file="/WEB-INF/include/header2.jsp" %>
		</c:otherwise>
	</c:choose>
	<div id="section">
     <div id="title">
     	<p>그린마켓</p>
     </div>
     <div id="aside">
      <ul id="sidemenu">
     	<li><a href="/Market/List?submenu_id=SUBMENU15&nowpage=1">입양원해요</a></li><br />
     	<li><a href="/Market/List?submenu_id=SUBMENU16&nowpage=1">나눔합니다</a></li><br />
     	<li><a href="/Market/List?submenu_id=SUBMENU17&nowpage=1">포인트 스토어</a></li><br />
      </ul>
     </div>
     
     <div id="main">
     <c:choose>	
	  <c:when test="${ map.submenu_id == 'SUBMENU17' }">
	   <div><a style="padding-left: 80px;" id="board_title" href="/Board/List?menu_id=${ map.menu_id }&submenu_id=${ map.submenu_id }&nowpage=1">포인트 ${ map.submenu_name }</a></div>
	    </c:when>
	<c:otherwise>
		<div><a style="padding-left: 80px;" id="board_title" href="/Board/List?menu_id=${ map.menu_id }&submenu_id=${ map.submenu_id }&nowpage=1">${ map.submenu_name } 원해요</a></div>
	</c:otherwise>
	</c:choose>		
		<table id="cont">
			<tr>
				<td class="padd8">제목</td>
				<td class="padd8">${ vo.board_title }</td>
			</tr>
			<tr>
				<!-- 포인트 스토어일 때 작성자 비활성화 -->
	     	<c:choose>	
			<c:when test="${ map.submenu_id != 'SUBMENU17' }">
				<td class="padd8">작성자</td>
				<td class="padd8">${ vo.nickname }</td>
			 </c:when>
			<c:otherwise>
			</c:otherwise>
			</c:choose>		
				<td class="padd8">작성일</td>
				<td class="padd8">${ vo.board_regdate }</td>
				<td class="padd8" >조회수</td>
				<td class="padd8">${ vo.readcount }</td>
			</tr>
		
		<!-- 포인트 스토에서만 활성화  -->	
		<c:choose>	
			<c:when test="${ map.submenu_id == 'SUBMENU17' }">
			<tr>
			   <td class="padd8">가격</td>
			   <td class="padd8">${ vo.market_value }</td>
			</tr>
			<tr>
			   <td class="padd8">수량</td>
			   <td>
			     <select name="amount">
					<option value="">최대 3개 제한</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
			     </select>
			     <a href="/Market/PointPayForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&userid=${sessionScope.login.userid}">
			     <button>구매</button>
			     </a>
			   </td>
			</tr>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>	
		
			<tr>
				<th>내용</th>
				<td colspan="5" id="bc">
				<c:forEach var="file"  items="${ fileList }" >
				 <div>
					<img src="/upload/${ file.sfilename }">
				 </div>
				</c:forEach>
				${ vo.board_cont }
				</td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td colspan="5"> 
				<c:forEach var="file"  items="${ fileList }" >
				<div>
					<a href="/Market/download/external/${ file.sfilename }">
					${ file.filename }
					</a>
				</div>
				</c:forEach> 
   	    	 </td>
			</tr>
		</table>
		

		<div class="right">
		
		<a href="/Market/WriteForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&bnum=${vo.bnum}&lvl=${vo.lvl}&step=${vo.step}&nref=${vo.nref}&nowpage=${map.nowpage}&userid=${login.userid}">답글쓰기</a>
		
			<c:if test="${vo.usercode eq login.usercode}">
			<a href="/myPage/myNoteWriteForm?board_idx=${vo.board_idx}">쪽지</a>
			<a href="/Market/UpdateForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">수정</a>
			<a href="/Market/Delete?submenu_id=${vo.submenu_id}&board_idx=${ vo.board_idx }&nowpage=${map.nowpage}">삭제</a>
			</c:if> 

		</div>
	
		<div id="commentNoti">댓글</div>
		<br />
		
		<div id="writeComment">
			<form id="writeC">
			<input type="hidden"  name="board_idx" value="${ vo.board_idx }" />
			<input type="hidden"  name="usercode" value="${ login.usercode }" />
			<table>
				<tr>
					<th><div class="nameSpace">${ login.nickname }</div></th>
					<td style="width: 1000px;">
						<textarea name="coment_cont" placeholder="내용을 작성하세요."
					     required class="coment_cont" id="coment_cont"></textarea>
					</td>
					<td style="width: 100px;">
						<input class="btns" type="button" id="writeBtn" value="등록"/>
					</td>
				</tr>
			</table>
			</form>
		</div>
		<br />
		<div id="readComment">
			<form id="readC">
			<input type="hidden"  name="board_idx" value="${ vo.board_idx }" />
			<ul id="commentList"></ul>
			</form>
		</div>
     </div> <!--  main end -->
     
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>