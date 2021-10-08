<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/sitter/sitterimg.css"rel="stylesheet">
<script type="text/javascript">
window.onload=function(){
 	/* document.getElementById("sitter_email").value=opener.document.getElementById("sitter_email").value; */
	var btn=document.getElementById("changeImg");
	btn.onclick=function(){
		window.opener.name = "profileDetail";
		document.imageForm.target="profileDetail";
		document.imageForm.action="/sitter/profileImageEdit";
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
<form name="imageForm" role="form" enctype="multipart/form-data" method="POST" action="/sitter/profileImageEdit">
<input type="hidden" id="sitter_email" name="sitter_email" value="${profileEdit.sitter_email}">
<div class="page-t">
<h4> 프로필 이미지 변경 </h4>
</div>
<div class="wrpt">
<div class="imgch">
<label for="sitter_image" class="btnf">이미지 선택</label>
<input type="file" id="sitter_image" name="file" style="position : absolute; z-index:-1; left: 30px; top: 4px;" />
</div>
<div class="btnpt">
<button class="btnn" type="button" id="changeImg">이미지 수정</button>
<button class="btnn" type="button" id="close" onclick="closenReload()">취소</button>
</div>
</div>
</form>
</body>
</html>