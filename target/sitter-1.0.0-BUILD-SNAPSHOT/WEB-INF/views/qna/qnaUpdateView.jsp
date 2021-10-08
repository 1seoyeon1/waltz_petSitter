<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>qna 수정</title>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");

		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			/* 이벤트를 취소하는 도중에 preventDefault를 호출하게 되면,
			   일반적으로는 브라우저의 구현에 의해 처리되는 기존의 액션이 동작하지 않게되고
			   그 결과 이벤트가 발생하지 않게 됩니다. */

			location.href="/qna/qnaReadView?qno=${update.qno}" 
				 + "&page=${scri.page}"
				 + "&perPageNum=${scri.perPageNum}"
				 + "&searchType=${srci.searchType}"
				 + "&keyword=${srci.keyword}";
			})

			$(".update_btn").on("click",function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/qna/qnaUpdate");
				formObj.attr("method", "post");
				formObj.submit();
				})
		})
		
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
</script>


<body>
<c:import url="../common/nav.jsp"></c:import>
<div id="root">
		<header>
			<h1> qna 수정</h1>
		</header>
		<hr>

		<section id="container">
			<form name="updateForm" role="form" method="post" action="/qna/qnaUpdate">
				<input type="hidden" name="qno" value="${update.qno}" readonly="readonly"/>
				<input type="hidden" id="page" name="page" value="${scri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
				<table>
					<tbody>
						<tr>
							<td>
								<label for="qna_title">제목</label>
								<input type="text" id="qna_title" name="qna_title" value="${update.qna_title}" class="chk" title="제목을 입력하세요."/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="qna_category">카테고리</label>
								<textarea id="qna_category" name="qna_category" class="chk" title="내용을 입력하세요">
									<c:out value="${update.qna_category}"/></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="qna_content">내용</label>
								<textarea id="qna_content" name="qna_content" class="chk" title="내용을 입력하세요">
									<c:out value="${update.qna_content}"/></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="user_email">작성자</label>
								<input type="text" id="user_email" name="user_email" value="${update.user_email}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="qna_date">작성날짜</label>
								<fmt:formatDate value="${update.qna_date}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>	
					</tbody>
				</table>
				<hr>
				<div>
					<button type="submit" class="update_btn">저장</button>
					<button type="button" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
	</div>
</body>
</html>