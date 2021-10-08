<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/sitter/sitterrqlist.css"rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<div class="headpt">
<span style="margin-left:50px;">제목</span><span style="margin-left: 70px;">받은사람</span><span style="margin-left: 30px;">요청일</span><span style="margin-right: 20px;">처리상태</span><span></span>
</div>
<div class="conlist">
<c:forEach items="${mreserveList}" var="list">
<div class="rqcon">
<div class="elm">
   <input type="hidden" name="reno" id="reno" value="${list.reno}">
    <c:out value="${list.subject}"/>
</div>
<div class="elm">
    <c:out value="${list.sitter_email}"/>
</div>
<div class="elem" style="margin-left: 20px;">
    <fmt:formatDate value="${list.rq_date}" pattern="yyyy-MM-dd"/>
</div>
<div class="elm" style="width: 90px; margin-right: 90px; padding-left: 30px;">
    <c:if test="${list.chk == 0}">

    </c:if>
    

    <c:if test="${list.chk == 1 }">
    <div class="ac-type">
    <img src="/upload/img/ac.png" title="수락됨" style="width : 30px; height:30px">
    <c:if test="${list.rv == 0 }">
    <input class="rvWrite" style="margin-left:80px;"type="button" onclick="location.href='/review/writeReview?reno=${list.reno}'" value="후기 작성"/>
    </c:if>
    </div>
    </c:if>
    
    <c:if test="${list.chk == 2}">
    <img src="/upload/img/rj.png" title="거절됨" style="width : 30px; height:30px">
    </c:if>
</div>
   </div>
</c:forEach>
</div>
</div>

<div class="col-md-offset-3">
<ul class="pagination">
<c:if test="${pageMaker.prev}">
<li><a href="memReserve_rq_list${pageMaker.makeSearch2(pageMaker.startPage-1)}">이전</a></li></c:if>
<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
<li <c:out value="${pageMaker.cri.page==idx ? 'class=info':''}"/>>
<a href="memReserve_rq_list${pageMaker.makeSearch2(idx)}">${idx}</a></li></c:forEach>
<c:if test="${pageMaker.next && pageMaker.endPage >0}">
<li><a href="memReserve_rq_list${pageMaker.makeSearch2(pageMaker.endPage+1)}">다음</a></li></c:if>
</ul>
</div>
</form>
</div>
</div>
</body>
</html>