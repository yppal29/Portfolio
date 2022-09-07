<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<meta charset="UTF-8">
<title>JobCom</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginBtn").click(function() {
			if ($("#member_id").val() == "") {
				alert("아이디 입력!!!");
				return;
			} else if ($("#member_pass").val() == "") {
				alert("비밀번호 입력!!!");
				return;
			} else {
				$("#loginform").attr("action", "${root}/login").submit();
			}
		});

		$('#myRegisterBtn').focusin(function() {
			$(location).attr("href", "${root}/register");
		});
	});
</script>
</head>
<body>
	<div class="login" align="center">
		<form id="loginform" method="post" action="">
			<div>
				<label style="margin-right: 16px;" for="">아이디</label> <input
					align="center" placeholder="ID" type="text" id="member_id"
					name="member_id" style="width: 200px; height: 30px;">
			</div>
			<div style="padding-top: 8px">
				<label for="">비밀번호</label> <input type="password" id="member_pass"
					align="center" placeholder="Password" name="member_pass"
					style="width: 200px; height: 30px;"
					onkeydown="javascript:if(event.keyCode == 13) {login();}">
			</div>
			<div style="padding-top: 8px">
				<button type="button" id="loginBtn" class="button"
					style="margin-right: 10px; padding: 1px 12px 1px 12px">로그인</button>
				<button type="button" id="myRegisterBtn" class="button">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>