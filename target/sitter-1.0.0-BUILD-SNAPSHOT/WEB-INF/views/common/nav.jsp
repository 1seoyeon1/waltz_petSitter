<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       
<style>

#bg_white{background-color: white;}

#navbarDropdown:hover{color: #1890FF;
                      text-decoration:none;}

/* NAVIGATION */
nav {
  width: 100%;
  background-color: white;
  box-shadow: 2px 2px 2px #EBEBEB;
}
nav ul {
  list-style: none;
  text-align: center;
 
}
nav ul li {
  display: inline-block;
}

.dropdown-item:hover{
	text-decoration:none;
}

.nav-link:hover{text-decoration: none;}

nav ul li:hover ul{
  display:block;
  padding: 15px;
  text-decoration: none;
  color: #1890FF;
  font-weight: 800;
  margin: 0 10px;
  text-align: center;
  position: absolute;
}

#hover:hover{color:#1890FF;}


.navbar-brand{font-size:100px;
              margin-bottom:15px;
              margin-top: 0px;}

.brandlogo {
	width:300px;
    height:50px;
}
   
.nav-item {
		margin-left: 90px;	
		font-weight-bold;
		font-size:18px;				
	}
	
		
</style>
<meta charset="UTF-8">

<title>nav-bar</title>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light" id="bg_white">

  <div class="container-fluid">
  
    <a class="navbar-brand" href="/"><img class="brandlogo" src="/resources/images/brandlogo.jpg"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <li class="nav-item">
          <a class="nav-link " href="/sitter/profileBoard" id="hover">훈련사 소개</a>
        </li>
        
        
        <li class="nav-item">
          <a class="nav-link active size" aria-current="page" href="/review/boardReview" id="hover">후기</a>
        </li>
               
        
        <li class="nav-item">
          <a class="nav-link" href="/qna/qnaMain" id="hover">Q&A</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="/blog/list" id="hover">BLOG</a>
        </li>
        
        
        <c:choose>
        <c:when test="${member != null && sitter == null}">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                   내 정보
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/petinfo/writePetInfo">펫등록</a></li>
            <li><a class="dropdown-item" href="/petinfo/petInfo">펫 정보 보기</a></li>
            <li><a class="dropdown-item" href="/login/memberProfile">회원 정보</a></li>
            <li><a class="dropdown-item" href="/sitter/memReserve_rq_list">나의 예약 현황</a></li>
          </ul>
        </li>        
        </c:when>
        </c:choose>
        
        <c:choose>
        <c:when test="${member == null && sitter != null}">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          내 정보
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown" >
            <li><a class="dropdown-item" href="/sitter/rq_list?read=1">요청 리스트</a></li>
            <li><a class="dropdown-item" href="/sitter/profileView?sitter_email=${sitter}">나의 정보 보기</a></li>
          </ul>
        </li>        
        </c:when>
        </c:choose>
        
                               
        
        <c:choose>
        <c:when test="${member == null && sitter == null }">
        <li class="nav-item dropdown" id="hover">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
               회원가입
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown" >
            <li><a class="dropdown-item" href="/join/sitterRegister">훈련사 회원가입하기</a></li>
            <li><a class="dropdown-item" href="/join/memberRegister">사용자 회원가입하기</a></li>           
          </ul>
        </li>        
        </c:when>
        </c:choose>
        
        
   
			<c:choose>
					<c:when test="${member != null || sitter != null}">
		  <li class="nav-item">
          <a class="nav-link " href="/login/logout" id="hover">로그아웃</a>
        </li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								로그인 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown" id="hover">
								<li><a class="dropdown-item" href="/login/sitterLogin">훈련사 로그인</a></li>
								<li><a class="dropdown-item" href="/login/memberLogin">사용자 로그인</a></li>
							</ul></li>

					</c:otherwise>
				</c:choose>
			</ul>
				</div>
  </div>
</nav>


</body>
</html>