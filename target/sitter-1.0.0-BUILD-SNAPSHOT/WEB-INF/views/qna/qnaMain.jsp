<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script>
function changeFC(color)
{document.getElementById("category_detail").style.backgroundColor = color;
}
</script>

<meta charset="UTF-8">
<title>Q&A 게시판</title>
</head>



<style>
	.nav-item{
		margin-left: 30px;
	}	
	.catchk #category_detail
</style>
<body>
	<c:import url="../common/nav.jsp"></c:import>
		<c:import url="./qnaSearch.jsp"></c:import>
<%-- 	<c:out value="${sessionScope.member}"/> --%>
		<hr/>
		<div class="main">
		<c:choose>
		<c:when test = "${not empty member}">
		<div>
			<a href="${pageContext.request.contextPath}/qna/qnaWriteView">q&a 등록하기</a>
		</div>
		</c:when>
		<c:when test="${not empty sitter}"/>	
		<c:otherwise>
			<a href="/login/memberLogin">사용자 로그인</a><p>
			<a href="/login/sitterLogin">시터 로그인</a>
		</c:otherwise>
		</c:choose>
		
		
		<div>
		<h3>자주 묻는 질문</h3>
		
		<a href="">산책을 무서워해요</a>
		<hr/>
		<p id="qna_catagory_main">질문 카테고리</p>
		<div class="category">
		<a href="http://localhost:8080/qna/qnaMain"><div id="category_detail" class="catchk"><p>전체</p></div></a>
		<a href="http://localhost:8080/qna/qnaMain?keyword=%EB%B0%B0%EB%B3%80"><div id="category_detail" class="catchk" onClick="changeBTC('#95a5a6')"><p>배변</p></div></a>
		<a href="http://localhost:8080/qna/qnaMain?keyword=%EC%82%B0%EC%B1%85"><div id="category_detail" class="catchk"><p>산책</p></div></a>
		<a href="http://localhost:8080/qna/qnaMain?keyword=%EA%B3%B5%EA%B2%A9%EC%84%B1"><div id="category_detail" class="catchk"><p>공격성</p></div></a>
		<a href="http://localhost:8080/qna/qnaMain?keyword=%EC%A7%96%EC%9D%8C"><div id="category_detail" class="catchk"><p>짖음</p></div></a>
		<a href="http://localhost:8080/qna/qnaMain?keyword=%EA%B8%B0%EB%B3%B8%EC%98%88%EC%A0%88"><div id="category_detail" class="catchk"><p>기본예절</p></div></a>
		<a href="http://localhost:8080/qna/qnaMain?keyword=%EA%B8%B0%ED%83%80"><div id="category_detail" class="catchk"><p>기타</p></div></a>
		</div>
		<hr/>
		</div>
		<div>
		<c:import url="./qnaList.jsp"></c:import>
		</div>
		</div>
		
</body>
</html>