<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css" type="text/css"
	charset="UTF-8" />
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>JobCom</title>
</head>
<body>
	<div id="contents">
		<div class="body">
			<div id="main">
				<form action="<c:url value='/register'/>" method="post">
					<div class="form-group">
						이름<input style="margin-top: 20px;" class="form-control" type="text" name="member_name"
							id="member_name" placeholder="이름을 입력하세요.">
					</div>
					<div style="margin-top: 20px;" class="form-group">
						아이디<input style="margin-top: 20px;" class="form-control" type="text" name="member_id"
							id="member_id" placeholder="아이디를 입력하세요.">
					</div>
					<button style="margin-top: 20px; width: 140px;" class="list-button" type="button" onclick="idCheck()">아이디
						중복확인</button>
					<div style="margin-top: 20px;" class="form-group">
						별명<input style="margin-top: 20px;" style="margin-top: 20px;" class="form-control" type="text" name="nick_name"
							id="nick_name" placeholder="별명을 입력하세요.">
					</div>
					<div style="margin-top: 20px;" class="form-group">
						비밀번호<input style="margin-top: 20px;" class="form-control" type="password" name="member_pass"
							id="member_pass" placeholder="비밀번호를 입력하세요.">
					</div>
				</form>
				<button style="margin-top: 20px;" class="list-button" type="button" id="submit"
					disabled="disabled" onclick="registerCheck()">가입완료</button>
				<button style="margin-top: 20px;" class="list-button" type="button"
					onclick="location.href='/'">처음으로</button>
			</div>
		</div>
	</div>
	<div id="footer">
		<span class="footnote">&copy; Copyright &copy; 2011. All rights
			reserved</span>
	</div>
	<script type="text/javascript">
		function registerCheck() {
			if ($.trim($('#member_name').val()) == '') {
				alert("이름을 입력해주세요.");
				return false;
			}
			if ($.trim($('#member_id').val()) == '') {
				alert("아이디를 입력해주세요.");
				return false;
			}
			if ($.trim($('#member_pass').val()) == '') {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			if ($.trim($('#nick_name').val()) == '') {
				alert("별명을 입력해주세요.");
				return false;
			}
			if (confirm("회원가입을 하시겠습니까?")) {
				alert("회원가입이 완료되었습니다. 감사합니다.");
				$("form").submit();
			}
		}

		function idCheck() {

			var member_id = $("#member_id").val();

			if (member_id.search(/\s/) != -1) {
				alert("아이디에는 공백이 들어갈 수 없습니다.");
			} else {
				if (member_id.trim().length != 0) {
					console.log(member_id.trim().length);
					$.ajax({
						async : true,
						type : 'POST',
						data : member_id,
						url : "/idCheck",
						dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(count) {
							if (count > 0) {
								alert("해당 아이디 존재");
								$("#submit").attr("disabled", "disabled");
								window.location.reload();
							} else {
								alert("사용가능 아이디");
								$("#submit").removeAttr("disabled");
							}
						},
						error : function(error) {
							alert("아이디를 입력해주세요.");
						}
					});
				} else {
					alert("아이디를 입력해주세요.");
				}
			}
		}
	</script>
</body>
</html>