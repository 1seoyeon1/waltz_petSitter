<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../hello/bootStrap.jsp"></c:import>
</head>
<body>		
		<p id="totalQna">전체글 <c:out value="${pageMaker.totalCount}" /> 개</p>
	<form role="form" method="get">
			<c:forEach items="${list}" var="list">
		<div class="grid_column">
	
				<a href="/qna/qnaReadView?qno=${list.qno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
					<div class="qna_title_content">
						<div id="qna_title">
							<img src="../resources/images/loupe.png" id="qnaimg"> 
							<p id="qna_real_title"><c:out value="${list.qna_title}" /></p>
						</div>
						<div id="qna_content">	
							<c:out value="${list.qna_content}" />	
						</div>
					</div>
								
						<div class="qna_reply">
							<div id="qna_reply_tt">
								<div id="qna_reply_img_sitter">
									<div>
										<img src="../" id="qna_reply_sitter_img">
									</div>
									<div id="qna_reply_sitter">
										<c:if test="${not empty qnaReply}">
											답글이 있습니다.
										</c:if>
									</div>
								</div>
									<div>
										<img src="../resources/images/arrow_right.png" id="qna_reply_img"/>
									</div>
							</div>	
						</div>						
					</a>


</div>
			</c:forEach>
				<div class="col-md-offset-3">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="qnaList${pageMaker.makeSearch(pageMaker.startPage -1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="qnaList${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="qnaList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</form>
		
</body>
</html>