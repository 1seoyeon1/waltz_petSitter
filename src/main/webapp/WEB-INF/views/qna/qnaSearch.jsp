<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<div>
	
	</div>
</header>
<div class="container" style="height:250px;">
	
		<section>
		
		<div>
		<h1 id="qna_search_title">
			Q & A
		</h1>
		<p id="qna_search_midtitle">
		우리 강아지, 고양이가 왜 그럴까요?
		</p>
		</div>
			<form role="form" method="get">
			<div id="qna_search_bar">
					<img src="../resources/images/loupe.png" id="qnaimg">
				<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" value placeholder="궁금한 키워드를 검색해보세요"/>

					<script>
					$("#searchBtn").on("click", function(e){
				        e.preventDefault();
				        let val = $("input[name='keyword']").val();
				        moveForm.find("input[name='keyword']").val(val);
				        moveForm.find("input[name='page']").val(1);
				        moveForm.submit();
				    });

					</script>
					</div>
				</div>

				
			</form>
		</section>
	</div>
</body>
</html>