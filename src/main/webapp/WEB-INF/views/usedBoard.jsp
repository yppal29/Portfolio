<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.ezen.dto.MemberVO"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>JobCom</title>
<link rel="stylesheet" href="/css/style.css" type="text/css"
	charset="utf-8" />
<!-- JQuery -->
<script src="https://d3js.org/d3.v7.min.js"></script>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="header">
		<a href="index" id="logo"><img src="images/logo.png" alt="LOGO" /></a>
		<div id="navigation">
			<ul>
				<li><a href="freeBoard">자유게시판</a></li>
				<li><a href="tipBoard">팁 게시판</a></li>
				<li><a href="companyBoard">기업 게시판</a></li>
				<li><a style="color: #00c73c;" href="usedBoard">중고거래 게시판</a></li>
				<li><a href="gongjiBoard">공지사항</a></li>
				<li><a href="qnaBoard">Q&A 게시판</a></li>
			</ul>
		</div>
	</div>
	<!-- /#header -->
	<div id="adbox">
		<div class="container">
			<div class="img_wrap">
				<ul class="rollimgs">
					<li><a href="https://www.naver.com/"><img
							src="images/naver.png" alt="Img" height="50" width="50px"
							class="preview" /></a>
					<li><a href="https://www.daum.net/"><img
							src="images/daum.png" alt="Img" height="50" width="50px" /></a>
					<li><a href="https://www.google.com/"><img
							src="images/google.png" alt="Img" height="50" width="50px"
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
			<span><a href="chart">더보기+</a></span>
		</div>
	</div>
	<!-- /#adbox -->
	<div id="contents">
		<div class="body">
			<div id="main">

				<form method="get" id="moveForm">
					<div class="search_wrap">
						<div class="search_area">
							<select name="type">
								<option value=""
									<c:out value="${cri.type == null?'selected':'' }"/>>--</option>
								<option value="T"
									<c:out value="${cri.type eq 'T'?'selected':'' }"/>>제목</option>
								<option value="C"
									<c:out value="${cri.type eq 'C'?'selected':'' }"/>>내용</option>
								<option value="W"
									<c:out value="${cri.type eq 'W'?'selected':'' }"/>>작성자</option>
								<option value="TC"
									<c:out value="${cri.type eq 'TC'?'selected':'' }"/>>제목
									+ 내용</option>
								<option value="TW"
									<c:out value="${cri.type eq 'TW'?'selected':'' }"/>>제목
									+ 작성자</option>
								<option value="TCW"
									<c:out value="${cri.type eq 'TCW'?'selected':'' }"/>>제목
									+ 내용 + 작성자</option>
							</select> <input type="text" name="keyword" value="${cri.keyword }">
							<button>Search</button>
						</div>
					</div>
				</form>

				<c:if test="${sessionScope.member.member_id != null }">
					<button style="float: right; margin-bottom: 20px;"
						class="list-button" onclick="location.href='/usedInsert'">글쓰기</button>
				</c:if>
			</div>

			<div class="col-xs-12">

				<table width="960" align="left">
					<tr>
						<th>번호</th>
						<th>태그</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="used" items="${usedBoard}">
						<tr style="cursor: pointer" class="move"
							onclick="location.href='/usedDetail/${used.bseq}'">
							<td>${used.bseq}</td>
							<td style="color: #73b9ff">${used.catType}</td>
							<td>${used.title}</td>
							<td>${used.nick_name}</td>
							<td><fmt:formatDate value="${used.regdate}"
									pattern="yyyy.MM.dd" /></td>
							<td>${used.count}</td>
						</tr>
					</c:forEach>
				</table>

				<div class="pageInfo_area">
					<ul class="pageInfo">
						<c:if test="${page.prev}">
							<li><a
								href='<c:url value="/usedBoard?page=${page.startPage-1}"/>'>이전</a></li>
						</c:if>
						<c:forEach begin="${page.startPage}" end="${page.endPage}"
							var="num">
							<li class="${page.cri.page == num ? "active":"" }"><a
								class="num" href='<c:url value="/usedBoard?page=${num}"/>'>${num}</a></li>
						</c:forEach>
						<c:if test="${page.next && page.endPage>0}">
							<li><a
								href='<c:url value="/usedBoard?page=${page.endPage+1}"/>'>다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- /#contents -->
	<div id="footer">
		<span class="footnote">&copy; Copyright &copy; 2011. All rights
			reserved</span>
	</div>
	<!-- /#footer -->
	<script src="js/d3.js"></script>
	<script src="js/rolling.js"></script>
</body>
</html>