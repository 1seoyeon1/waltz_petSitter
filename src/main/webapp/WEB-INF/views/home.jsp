 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
   <title>Home</title>

<link href="<c:url value="/resources/css/home.css"/>" rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</head>
<body>
<c:import url="./common/nav.jsp"></c:import>
<div class="full-hidden">
<section class="intro-section">
<div style="display:flex;position:relative;flex-direction:column;width:100%;height:auto;align-items:center">
<div style="display:flex;justify-content:flex-end;align-items:flex-end;width:80%;height:570px;position:relative">
<img src="/resources/images/maindog.jpg" style="width:100%;height:100%;margin-right:60px; opacity:0.7;'">
</div>
<div style="display:flex;flex-direction:column;align-self:center;position:absolute;top:229px;left:0;right:0;margin:0px auto;width:1440px;z-index:20">
<div style="min-width:1440px;margin-left:220px">
<p style="display:flex;flex-direction:column;align-self:flex-start;font-weight:600;letter-spacing:0.2px;font-size:67px;line-height:87px;color:#333333">
반려생활 <br> 파트너.
</p>
<div style="margin-top:30px">
<p style="font-size:17px;color:#333333;letter-spacing:-0.1px">
	반려가족의 하루에 함께하겠습니다.
</p>
</div>
</div>
</div>
</div>
</section>
<div style="width:1440px;margin:0px auto;background-color:white;margin-top:170px;padding-bottom:180px;position:relative">
	<div style="display:flex;justify-content:space-between;padding:0px 220px 0px 220px">
	
	<div style="padding-top:72px">
	<h1 style="font-size:47px;color:#333333;font-weight:600;line-height:67px">
	펫시터가 <br> 집으로 와요!
	</h1>
	<h3 style="font-weight:400;margin-top:38px;font-size:17px;color:#333333;letter-spacing:-0.1px;line-height:normal">
	전문 펫시터가 돌봐드려요 <br> 나와 내 반려동물을 위한 돌봄서비스
	</h3>
	</div>
	<img src="/resources/images/dog2.jpg" style="width:500px;height:450px;border-radius:2px">
	</div>
	
	
	<div style="display:flex;padding:0px 220px 0px 220px;margin-top:110px;">
	<img src="/resources/images/dog3.jpg" style="width:500px;height:450px;border-radius:2px">
	<div style="margin-left: 110px">
	<h2 style="font-size:47px;color:#333333;font-weight:600;line-height:67px;">
	간편하게 <br> 펫시터를 만나요
	</h2>
	<h3 style="font-weight:400;margin-top:38px;font-size:17px;color:#333333;letter-spacing:-0.1px;line-height:normal">
	펫시터님의 프로필에서 돌봄 환경 사진과 <br> 교육 및 자격증 등을 확인하고 예약해보세요.
	</h3>
	<input style = "width:150px; height:52px; border: 1px solid rgb(113,162,255); border-radius:38px; color:rgb(113,162,255); background-color:unset; margin-left:20%; margin-top:15%;" type="button" value="예약하기" onclick="location.href='/sitter/profileBoard'"/>
	</div> 
	</div>
	
	<div style="display:flex;justify-content:space-between;padding:0px 220px 0px 220px;margin-top:110px">
	<div style="padding-top:72px">
	<h1 style="font-size:47px;color:#333333;font-weight:600;line-height:67px">
	행복한 하루를 <br> 선물하세요!
	</h1>
	<h3 style="font-weight:400;margin-top:38px;font-size:17px;color:#333333;letter-spacing:-0.1px;line-height:normal">
	집을 비우게 되도 걱정마세요! <br> 내 가족처럼 정성껏 돌봐드립니다
	</h3>
	</div>
	<img src="/resources/images/dog4.jpg" style="width:500px;height:450px;border-radius:2px">
	</div>
</div>
</div>
<c:import url="./common/footer.jsp"></c:import>
</body>
</html>