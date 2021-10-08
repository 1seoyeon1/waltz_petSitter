<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/sitter/sitterrqprofile.css"rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="pagept">
<div class="page-top">
<h1>sitter 정보</h1>
</div>

<div class="pt">
<div class="bott">
<div class="info">
<div class="con">
<label>아이디</label><input type="text" name="sitter_email" value="${sitterPf.sitter_email}">
</div>
<div class="con">
<label>이름</label><input type="text" name="sitter_name" value="${sitterPf.sitter_name}">
</div>
<div class="con">
<label>성별</label><input type="text" name="sitter_gender" value="${sitterPf.sitter_gender}">
</div>
<div class="con">
<label>전화번호</label><input type="text" name="sitter_phone" value="${sitterPf.sitter_phone}">
</div>
<div class="con">
<label>지역</label><input type="text" name="sitter_addr" value="${sitterPf.sitter_addr}">
</div>
</div>
</div>

<div class="bott">
<div class="info">
<div class="con">
<label>예약일자</label>
<input id="incon" type="text" name="start_date" value="${rqinfo.start_date}">~
<input id="incon" type="text" name="end_date" value="${rqinfo.end_date}">
</div>
<div class="con">
<label>이용시간</label>
<c:choose>
<c:when test="${rqinfo.all_day eq 0}">
<input id="incon" type="text" name="st_time" value="${rqinfo.st_time}">~
<input id="incon" type="text" name="ed_time" value="${rqinfo.ed_time}">
</c:when>
<c:otherwise>
<input type="text" name="all_day" value="하루 종일" style="text-align: center;">
</c:otherwise>
</c:choose>
</div>
</div>
</div>

<input class="rvWrite" type="button" value="닫기" onclick="self.close()";>

</div>
</div>
</body>
</html>