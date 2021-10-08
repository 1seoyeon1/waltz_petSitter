<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/review/imageUpdate.css"rel="stylesheet">
<script type="text/javascript">
window.onload=function(){
	var btn=document.getElementById("changeImg");
	btn.onclick=function(){
		window.opener.name = "reviewReview";
		document.imageForm.target="reviewReview";
		document.imageForm.action="/review/imageUpdate";
		document.imageForm.method="POST";
		document.imageForm.submit();
		self.close();
		}
};
function closenReload(){
	opener.parent.location.reload();
	self.close();
}
</script>
<meta charset="UTF-8">
<title>이미지수정</title>
</head>
<body>
<form name="imageForm" role="form" enctype="multipart/form-data" method="POST" action="/review/imageUpdate">
<input type="hidden" id="rno" name="rno" value="${imageUpdate.rno}"/>
<div class="page-t">
	<h3> 리뷰 게시판 이미지 변경 </h3>
</div>
<div class="wrpt">
<div class="imgch">
<label for="r_image" class="btnf">이미지 선택</label>
<input type="file" id="r_image" name="image" style="position : absolute; z-index:-1; left: 30px; top: 4px;"/>
</div>
<div class="btnpt">
<button type="button" id="changeImg" onclick="window.close()" class="btnn">이미지 수정</button>
<button class="btnn" type="button" id="close" onclick="closenReload()">취소</button>
</div>
</div>
</form>
</body>
</html>