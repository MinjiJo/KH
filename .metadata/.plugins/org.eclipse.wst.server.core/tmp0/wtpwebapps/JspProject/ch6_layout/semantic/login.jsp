<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>LOGIN</title>
	</head>
	<body>
		<form action="login_ok.jsp" method="post">
			<h1>로그인</h1>
			<hr>
			<b>아이디</b>
				<input type="text" name="id"
						placeholder="Enter id" required><br>
			<b>비밀번호</b>
				<input type="password" name="passwd"
						placeholder="Enter password" required><br>
			<div class="clearfix">
				<button type="submit" class="submitbtn">Submit</button>
				<button type="reset" class="cancelbtn">Cancel</button>
			</div>
		</form>
	</body>
</html>