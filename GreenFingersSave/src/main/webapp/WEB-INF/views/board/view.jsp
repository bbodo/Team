 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="/WEB-INF/include/comHead.jsp" %>
<title>${ map.submenu_name } 게시글 보기</title>

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
	#aside {
		float: left;
		height: 800px;
		background-color: navy;
		width: 20%;
		padding: 10px;
	}
	#main {
		width: 80%;
		height: 800px;
		float: left;
		padding: 10px;
		background-color: gray;
	}
	#cont {
		background-color: #fff;
		margin: 0 auto;
		width: 100%;
	}
	#cont th {
		background-color: #666;
	}
	.right {
		text-align: right;
	}
	.left {
		text-align: left;
	}
	textarea {
		width: 650px;
	}
	.floatright {
		float:right;
	}
	.floatleft {
		float:left;
	}

</style>

<script src="https://code.jquery.com/jquery.min.js"></script>

<script>
		function reply_comment(coment_idx, board_idx, com_bnum, com_lvl, com_step, com_nref, com_parent) {
			let coment_cont = $("#reply_coment_cont").val();
			console.log(${login.usercode})
			
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
				html += '<div id="comment_updateForm_'+ coment_idx +'">';
			    html += `<textarea name=\${coment_cont} id=comment_update_\${coment_idx}>${ coment_cont}</textarea>`;
			    html += '<input type="button" value="취소" onclick="comment_back('+ coment_idx +',\'' + coment_cont + '\')" />';
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
							} else {
								alert("삭제가 되지않았습니다");
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
				let html  = '<li id=comment_empty_' + coment_idx + '>'
					html += '<div id="replyComment">'
				    html += '<textarea id="reply_coment_cont" name="comment_cont"></textarea>'
					html += `<input type="button" value="대댓작성" id="replyBtn" onclick="reply_comment( \${coment_idx}, \${board_idx}, \${com_bnum}, \${com_lvl}, \${com_step}, \${com_nref}, \${com_parent})">`
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
						html += '<div class="floatleft"><p><h2>'+ comm.nickname +'</h2></p></div>';
						html += '<div class="floatright"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
						html += `<div class="floatleft" id="commentCont_ \${comm.coment_idx}" onclick="c(\${comm.coment_idx}, \${comm.board_idx}, \${comm.com_bnum}, \${comm.com_lvl}, \${comm.com_step}, \${comm.com_nref}, \${comm.com_parent})">\${comm.coment_cont}</div>`;
						//html += '<div class="floatright"><input type="button" onclick="updateForm_comment('+ comm.coment_idx +',\'' + comm.coment_cont + '\')" value="수정" />';
						html += `<div class="floatright"><input type="button" onclick="updateForm_comment"( comm.coment_idx, comm.coment_cont) value="수정" />`;
						html += '<input type="button" onclick="delete_comment(' + comm.coment_idx + ')" value="삭제" /></div><br /><br />';
					} else {
						html += '<b>삭제된 댓글입니다.</b>';
					}					
				} else {
					if(comm.delcoment == 0) {
						html += '<div class="floatleft"><p><h2>'+ comm.nickname +'</h2></p></div>';
						html += '<div class="floatright"><p><h2>'+ comm.coment_regdate +'</h2></p></div><br />';
						html += '<div class="floatleft" id="commentCont_'+ comm.coment_idx +'" onclick="c(' + comm.coment_idx + ')"><b style="display:inline-block; width:\${'+ comm.com_lvl*20 +'}px"></b>'+ comm.coment_cont +'</div>';
						html += '<div class="floatright"><input type="button" onclick="updateForm_comment('+ comm.coment_idx +',\'' + comm.coment_cont + '\')" value="수정" />';
						html += '<input type="button" onclick="delete_comment(' + comm.coment_idx + ')" value="삭제" /></div><br /><br />';
					} else {
						html += '<b style="display:inline-block; width:${'+ comm.com_lvl*20 +'}px">삭제된 댓글입니다.</b>';
					}
				}
				html += '</li>';
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
	 <%@include file="/WEB-INF/include/header.jsp" %>
     <div id="title">
     	<p>식물 연합</p>
     </div>
     <div id="aside">
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     	포이즌<br />
     </div>
     <div id="main">
		<table id="cont">
			<caption class="left">${ map.submenu_name }게시글 보기</caption>
			<tr>
				<th>제목</th>
				<td>${vo.board_title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.nickname }</td>
				<th>작성일</th>
				<td>${vo.board_regdate }</td>
				<th>조회수</th>
				<td>${vo.readcount }</td>
			</tr>
				<tr><td colspan="6"><hr /></td></tr>
			<tr>
				<th>내용</th>
				<td>${vo.board_cont }</td>
			</tr>
			<tr>
				<th>파일 첨부</th>
				<td> 
				<c:forEach var="file"  items="${ fileList }" >
				<div>
					<a href="/Board/download/external/${ file.sfilename }">
					${ file.filename }
					</a>
				</div>
				</c:forEach> 
   	    	 </td>
			</tr>
		</table>
		<!-- 나중에 if 문 -->
		<div class="right">
		<a href="/Board/WriteForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&bnum=${vo.bnum}&lvl=${vo.lvl}&step=${vo.step}&nref=${vo.nref}&nowpage=${map.nowpage}&userid=${login.userid}">답글쓰기</a>
		<a href="/Board/UpdateForm?submenu_id=${vo.submenu_id}&board_idx=${vo.board_idx}&nowpage=${map.nowpage}">수정</a>
		<a href="/Board/Delete?submenu_id=${vo.submenu_id}&board_idx=${ vo.board_idx }&nowpage=${map.nowpage}">삭제</a> <br />
		</div>
	
		<br />
		
		<div id="writeComment">
			<form id="writeC">
			<input type="hidden"  name="board_idx" value="${ vo.board_idx }" />
			<input type="hidden"  name="usercode" value="${ login.usercode }" />
			<table>
				<tr>
					<th>${ login.nickname }</th>
					<td>
						<textarea name="coment_cont" placeholder="내용을 작성하세요."
					     required id="coment_cont"></textarea>
					</td>
					<td><input type="button" id="writeBtn" value="등록"/></td>
				</tr>
			</table>
			</form>
		</div>
		<br />
		<div id="readComment">
			<form id="readC">
			<input type="hidden"  name="board_idx" value="${ vo.board_idx }" />
			<!-- <div id="commentZone"></div> -->
			<ul id="commentList"></ul>
			</form>
		</div>
     </div>
     <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>