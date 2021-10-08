<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/petinfo/petinfoImage.css"/>" rel="stylesheet">
<script type="text/javascript">
window.onload=function(){
	var btn=document.getElementById("changeImg");
	btn.onclick=function(){
		window.opener.name = "PetInfo";
		document.imageForm.target="PetInfo";
		document.imageForm.action="/petinfo/updatePetImage";
		document.imageForm.method="POST";
		document.imageForm.submit();
		self.close();
		}
};
</script>
<meta charset="UTF-8">
<title>이미지수정</title>
</head>
<body>
<form name="imageForm" role="form" enctype="multipart/form-data" method="POST" action="/petinfo/updatePetImage">
<input type="hidden" id="pno" name="pno" value="${imageUpdate.pno}"/>
<div class="page-t">
<h4> 펫 이미지 변경 </h4>
</div>
<div class="wrpt">
<div class="imgch">
<label for="r_image" class="btnf">이미지 선택</label>
<input type="file" id="r_image" name="image" style="display:none;" />
</div>
<div class="btnpt">
<button type="button" id="changeImg" onclick="window.close()" class="btnn">이미지 수정</button>
<button class="btnn" type="button" id="close" onclick="closenReload()">취소</button>
</div>
</div>
</form>
</body>
</html>