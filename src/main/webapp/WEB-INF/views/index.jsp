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
				<li><a href="usedBoard">중고거래 게시판</a></li>
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
					<strong style="margin-top: 50px">${member.nick_name}</strong>님 환영 합니다. <br><br> <a
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
				<table width="960">
					<tr>
						<th align="left"><a style="color: black; float: left;" href="gongjiBoard">공지사항</a></th>
						<th></th>
						<th></th>
						<th><a
							style="font-size: small; color: #949494; float: right;" href="gongjiBoard">더보기+</a></th>
					</tr>
					<c:forEach var="gongji" items="${gongjiBoard}">
						<tr style="cursor: pointer"
							onclick="location.href='/gongjiDetail/${gongji.bseq}'">
							<td style="color: #fe2582;">${gongji.catType}</td>
							<td>${gongji.title}</td>
							<td>${gongji.nick_name}</td>
							<td align="center">${gongji.count}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="freeBoard">
				<table width="470">
					<tr>
						<th align="left"><a style="color: black; float: left;" href="freeBoard">자유게시판</a></th>
						<th></th>
						<th></th>
						<th><a
							style="font-size: small; color: #949494; float: right;" href="freeBoard">더보기+</a></th>
					</tr>
					<c:forEach var="free" items="${freeBoard}">
						<tr style="cursor: pointer"
							onclick="location.href='/freeDetail/${free.bseq}'">
							<td style="color: #73b9ff;">${free.catType}</td>
							<td>${free.title}</td>
							<td>${free.nick_name}</td>
							<td align="center">${free.count}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="tipBoard">
				<table width="470">
					<tr>
						<th align="left"><a style="color: black; float: left;" href="tipBoard">팁 게시판</a></th>
						<th></th>
						<th></th>
						<th><a
							style="font-size: small; color: #949494; float: right;" href="tipBoard">더보기+</a></th>
					</tr>
					<c:forEach var="tip" items="${tipBoard}">
						<tr style="cursor: pointer"
							onclick="location.href='/tipDetail/${tip.bseq}'">
							<td style="color: #73b9ff;">${tip.catType}</td>
							<td>${tip.title}</td>
							<td>${tip.nick_name}</td>
							<td align="center">${tip.count}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="main">
				<table width="960">
					<tr>
						<th align="left"><a style="color: black; float: left;" href="companyBoard">기업 게시판</a></th>
						<th></th>
						<th></th>
						<th><a
							style="font-size: small; color: #949494; float: right;" href="companyBoard">더보기+</a></th>
					</tr>
					<c:forEach var="comp" items="${companyBoard}">
						<tr style="cursor: pointer"
							onclick="location.href='/companyDetail/${comp.bseq}'">
							<td style="color: #73b9ff;">${comp.catType}</td>
							<td>${comp.title}</td>
							<td>${comp.nick_name}</td>
							<td align="center">${comp.count}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="main">
				<table width="960">
					<tr>
						<th align="left"><a style="color: black; float: left;" href="usedBoard">중고거래 게시판</a></th>
						<th></th>
						<th></th>
						<th><a
							style="font-size: small; color: #949494; float: right;" href="usedBoard">더보기+</a></th>
					</tr>
					<c:forEach var="used" items="${usedBoard}">
						<tr style="cursor: pointer"
							onclick="location.href='/usedDetail/${used.bseq}'">
							<td style="color: #73b9ff;">${used.catType}</td>
							<td>${used.title}</td>
							<td>${used.nick_name}</td>
							<td align="center">${used.count}</td>
						</tr>
					</c:forEach>
				</table>
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