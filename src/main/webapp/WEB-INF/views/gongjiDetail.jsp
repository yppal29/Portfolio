<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.ezen.dto.MemberVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>JobCom</title>
<link rel="stylesheet" href="/css/style.css" type="text/css"
	charset="UTF-8" />
<!-- JQuery -->
<script src="https://d3js.org/d3.v7.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

#result_card {
	position: relative;
}
</style>
</head>
<body>
	<div id="header">
		<a href="/index" id="logo"><img src="/images/logo.png" alt="LOGO" /></a>
		<div id="navigation">
			<ul>
				<li><a href="/freeBoard">자유게시판</a></li>
				<li><a href="/tipBoard">팁 게시판</a></li>
				<li><a href="/companyBoard">기업 게시판</a></li>
				<li><a href="/usedBoard">중고거래 게시판</a></li>
				<li><a href="/gogjiBoard">공지사항</a></li>
				<li><a href="/qnaBoard">Q&A 게시판</a></li>
			</ul>
		</div>
	</div>
	<!-- /#header -->
	<div id="adbox">
		<div class="container">
			<div class="img_wrap">
				<ul class="rollimgs">
					<li><a href="https://www.naver.com/"><img
							src="/images/naver.png" alt="Img" height="50" width="50px"
							class="preview" /></a>
					<li><a href="https://www.daum.net/"><img
							src="/images/daum.png" alt="Img" height="50" width="50px" /></a>
					<li><a href="https://www.google.com/"><img
							src="/images/google.png" alt="Img" height="50" width="50px"
							class="last" /></a>
				</ul>
			</div>
		</div>
		<div>
			<c:if test="${member == null}">
				<h3>${msg}</h3>
				<%@ include file="/WEB-INF/views/login.jsp"%>
			</c:if>
			<c:if test="${member != null}">
				<div id="loginSuccess" align="center">
					<strong>${member.nick_name}</strong>님 환영 합니다. <br> <br> <a
						href="${root}/logout.do" class="logout" style="padding: 5px">로그아웃</a>
				</div>
			</c:if>
		</div>
		<div class="footer">
			<li>교사</li>
			<code class="char1" data-val='87%'>8.7%</code>
			<li>간호사</li>
			<code class="char2" data-val='53%'>5.3%</code>
			<li>군인</li>
			<code class="char3" data-val='35%'>3.5%</code>
			<li>프로그래머</li>
			<code class="char4" data-val='34%'>3.4%</code>
			<li>경찰</li>
			<code class="char5" data-val='33%'>3.3%</code>
			<span><a href="/chart">더보기+</a></span>
		</div>
	</div>
	<div id="contents">
		<div class="body">
			<div id="main">
				<form action="/insertProc" method="post">
					<table class="detail">
						<tr>
							<td style="width: 33%;">${detail.nick_name}</td>
							<td style="width: 33%;">${detail.title}</td>
							<td style="width: 33%;"><fmt:formatDate value="${detail.regdate}"
									pattern="yyyy.MM.dd" /></td>
						</tr>
						<tr>
							<c:if test="${files.bseq != null }">
								<th
									style="border-right: 1px solid; border-color: #dadada;">첨부파일</th>
								<td><a href="/fileDown/${files.bseq}">${files.fileOriName}</a>
								</td>
							</c:if>
						</tr>
						<tr style="width: 100%; height: 100%;">
							<td colspan="3" align="left" valign="top"
								>${detail.content}<c:if
									test="${files.bseq != null }">
									<div id="result_card">
										<img src="/fileDown/${files.bseq}">
									</div>
								</c:if></td>
						</tr>
					</table>
				</form>
				<div class="detailButton" role="group">
					<button id="list_btn" style="float: right;" type="button" class="list-button"
						onClick="location.href='/gongjiBoard'">목록</button>
				</div>
			</div>
			
			<!-- 댓글 -->
			<div class="comment">
				<label for="content">댓글</label>
				<form name="commentInsertForm">
					<div class="input-group">
						<c:if test="${sessionScope.member.member_id != null }">
							<input type="hidden" name="bseq" value="${detail.bseq}" />
							<input type="text" class="form-control" id="content"
								name="content" placeholder="내용을 입력하세요.">
							<div class="form-group">
								<label for="writer"></label> <input type="hidden"
									class="form-control" id="writer" name="writer"
									value="${sessionScope.member.nick_name}">
							</div>
							<span class="input-group-btn">
								<button class="comment-button" type="button"
									name="commentInsertBtn">등록</button>
							</span>
						</c:if>
					</div>
				</form>
				
				<div class="reply_view">
					<div class="commentList"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<span class="footnote">&copy; Copyright &copy; 2011. All rights
			reserved</span>
	</div>
	<script src="/js/d3.js"></script>
	<script src="/js/rolling.js"></script>
</body>
</html>

<%@ include file="commentS.jsp"%>