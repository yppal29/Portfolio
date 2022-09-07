<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<li><a href="gogjiBoard">공지사항</a></li>
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
					<strong>${member.nick_name}</strong>님 환영 합니다. <br><br> <a
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
		</div>
	</div>
	<div id="contents">
		<div class="body">
			
			<h3>희망직업 [초등학생] 1위 운동선수, (중․고등학생) 1위 교사
 			온라인기반 산업의 증가로 컴퓨터공학자/소프트웨어개발자 희망직업 상승</h3>
			<p>2021년 학생 희망직업 조사 결과, 1~3위의 희망직업은 전년도와 거의 유사한 것으로 나타났다. ※
				초:(2020)1위 운동선수, 2위 의사, 3위 교사→(2021)1위 운동선수, 2위 의사, 3위 교사 중:(2020)1위
				교사, 2위 의사, 3위 경찰관→(2021)1위 교사, 2위 의사, 3위 경찰관/수사관 고:(2020)1위 교사, 2위
				간호사, 3위 생명·자연과학자 및 연구원→(2021)1위 교사, 2위 간호사, 3위 군인 □ 학생 희망직업 상위
				20위까지의 누계 비율을 보면 지속적으로 감소추세를 보이다가 ’21년에는 다소 증가한 것으로 나타났다. ※ 초:
				(2012) 77.2% → (2019) 68.4% → (2020) 68.0% → (2021) 69.0% 중: (2012)
				69.1% → (2019) 58.2% → (2020) 57.5% → (2021) 61.5% 고: (2012) 65.0% →
				(2019) 48.5% → (2020) 51.2% → (2021) 54.3% ◦ 온라인기반 산업의 증가로 코딩 프로그래머,
				가상(증강)현실전문가 등 컴퓨터공학자/소프트웨어개발자 희망직업이 전년 대비 상승하였다. ※ 중
				:컴퓨터공학자/소프트웨어개발자 (2020)11위 → (2021)8위 고 :컴퓨터공학자/소프트웨어개발자 (2020)7위 →
				(2021)4위 ◦ 4차 산업혁명으로 인한 직업변화가 가속화됨에 따라 로봇공학자 등* 신직업을 희망하는 학생들이 나타나고
				있다 * 로봇공학자, 정보보안전문가, AI전문가, 빅데이터·통계분석전문가, 3D 프린팅 전문가 ※ 중 : (2012)
				0.04% → (2015) 1.00% → (2021) 1.41%, 고 : (2012) 0.02% → (2015) 1.54%
				→ (2021) 1.59%</p>

			<h3>학생의 희망직업 상위 20위 현황 (단위: %)</h3>
			<table cellspacing="3" align = "center" width="100%" height="500px;" border="1">
			<th>순위</th>
			<th colspan="2">초등학생</th>
			<th colspan="2">중등학생</th>
			<th colspan="2">고등학생</th>
			<tr>
				<td>1</td><td>운동선수</td><td>8.5</td><td>교사</td><td>9.8</td><td>교사</td><td>8.7</td>
			</tr>
			<tr>
				<td>2</td><td>의사</td><td>6.7</td><td>의사</td><td>5.9</td><td>간호사</td><td>5.3</td>
			</tr>
			<tr>
				<td>3</td><td>교사</td><td>6.7</td><td>경찰관/수사관</td><td>4.3</td><td>군인</td><td>3.5</td>
			</tr>
			<tr>
				<td>4</td><td>크리에이터</td><td>6.1</td><td>운동선수</td><td>4.1</td><td>컴퓨터공학자/
소프트웨어개발자</td><td>3.4</td>
			</tr>
			<tr>
				<td>5</td><td>경찰관/수사관</td><td>4.2</td><td>군인</td><td>4.0</td><td>경찰관/수사관</td><td>3.3</td>
			</tr>
			<tr>
				<td>6</td><td>조리사(요리사)</td><td>4.1</td><td>공무원</td><td>3.1</td><td>공무원</td><td>3.2</td>
			</tr>
			<tr>
				<td>7</td><td>프로게이머</td><td>3.7</td><td>조리사(요리사)</td><td>2.8</td><td>의사</td><td>2.8</td>
			</tr>
			<tr>
				<td>8</td><td>배우/모델</td><td>3.3</td><td>컴퓨터공학자/
소프트웨어개발자</td><td>2.7</td><td>생명과학자 및 연구원</td><td>2.8</td>
			</tr>
			<tr>
				<td>9</td><td>가수/성악가</td><td>2.9</td><td>뷰티디자이너</td><td>2.6</td><td>경영자/CEO</td><td>2.7</td>
			</tr>
			<tr>
				<td>10</td><td>법률전문가</td><td>2.7</td><td>경영자/CEO</td><td>2.2</td><td>의료·보건 관련직</td><td>2.3</td>
			</tr>
			</table>
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