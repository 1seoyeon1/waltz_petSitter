<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/sitter/sitterrqlist.css" rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>요청 리스트</title>
</head>
<body>
<c:import url="../common/nav.jsp"></c:import>
<div class="page-top">
<h1>요청 리스트</h1>
</div>
<div class="page-btt">
<div id="container">
<form role="form" method="get">
<div class="rqlist">
<div class="inf">
<p> 신청 내용은 <span>예약 이용 종료일</span>까지 확인 할 수 있습니다. </p> 
</div>
<div class="headpt">
<span style="margin-left:50px;">예약날짜</span><span style="margin-left: 100px; margin-right: 30px;">보낸사람</span><span style="margin-left: 60px;">신청일</span><span style="margin-left: 50px;margin-right: 20px;">읽음</span><span style="margin-right: 50px;">처리상태</span>
</div>
<div class="conlist">
<c:forEach items="${rqList}" var="list">
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<c:if test="${list.end_date >= today}">
<a href="/sitter/sittReserve_rqView?reno=${list.reno}&User_email=${list.user_email}">
</c:if>
<div class="rqcon">

<div class="elm">
<input type="hidden" name="reno" id="reno" value="${list.reno}">
<c:out value="${list.start_date}"/>~<c:out value="${list.end_date}"/>
</div>
<div class="elm" style="width: 110px; margin-left: 40px; margin-right: 60px;">
<c:out value="${list.user_email}"/>
</div>
<div class="elem" style="margin-left: 20px;">
<fmt:formatDate value="${list.rq_date}" pattern="yyyy-MM-dd"/>
</div>
<div class="elm" style="width: 90px; margin-left: 70px; padding-left: 30px;">
<c:if test="${list.rd==0}">

</c:if>
<c:if test="${list.rd ne 0}">
<img src="/upload/img/check.png" style="width : 30px; height : 30px;" title="읽음">
</c:if>
</div>
<div class="elm" style="width: 70px; margin-right: 40px; padding-left: 20px;">
<c:choose>
<c:when test="${list.chk==0}">

</c:when>
<c:when test="${list.chk==1}">
<img src="/upload/img/ac.png" title="수락됨" style="width : 30px; height:30px">
</c:when>
<c:when test="${list.chk==2}">
<img src="/upload/img/rj.png" title="거절됨" style="width : 30px; height:30px">
</c:when>
</c:choose>
</div> 
</div>
</a>
</c:forEach>
</div>
</div>

<div class="col-md-offset-3">
<ul class="pagination">
<c:if test="${pageMaker.prev}">
<li><a href="rq_list${pageMaker.makeSearch2(pageMaker.startPage-1)}&rd=${rd}">이전</a></li></c:if>
<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
<li <c:out value="${pageMaker.cri.page==idx ? 'class=info':''}"/>>
<a href="rq_list${pageMaker.makeSearch2(idx)}&rd=${rd}">${idx}</a></li></c:forEach>
<c:if test="${pageMaker.next && pageMaker.endPage >0}">
<li><a href="rq_list${pageMaker.makeSearch2(pageMaker.endPage+1)}&rd=${rd}">다음</a></li></c:if>
</ul>
</div>
</form>
</div>
</div>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>