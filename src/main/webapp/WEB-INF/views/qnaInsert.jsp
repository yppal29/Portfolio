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
				<div class="qnaInsert">
					<form action="/qnaInsertProc" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<input type="hidden" class="form-control" id="boardTitle"
								name="boardTitle" value="6">
						</div>
						<div class="form-group">
							<label style="margin-left: 20px;" for="subject">카테고리</label> <select
								name="category">
								<option value="10">Q&A</option>
							</select>
						</div>
						<div class="form-group">
							<label style="margin-left: 20px;" for="subject">제목</label> <input
								style="margin-left: 20px; margin-top: 20px; width: 910px; height: 50px;"
								type="text" class="form-control" id="title" name="title"
								placeholder="제목을 입력하세요.">
						</div>
						<div class="form-group">
							<label for="writer"></label> <input type="hidden"
								class="form-control" id="writer" name="writer"
								value="${sessionScope.member.member_id}">
						</div>
						<div class="form-group">
							<label style="margin-left: 20px;" for="content">내용</label>
							<textarea
								style="margin-left: 20px; margin-top: 20px; width: 910px; height: 300px;"
								class="form-control" id="content" name="content" rows="3"></textarea>
						</div>
						<div style="margin-bottom: 20px;" class="form-group">
							<label for="file">파일 업로드</label> <input class="file" type="file"
								id="file" name="files">
						</div>
						<button style="margin-top: 20px; float: right;" type="button"
							class="list-button"
							onClick="location.href='javascript:history.back();'">리스트</button>
						<button style="margin-top: 20px; float: left;" type="submit"
							class="list-button">작성</button>
					</form>
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