<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link href="login.css" rel="stylesheet" type="text/css">
		<title>LOGIN</title>
	</head>
	<body>		
		<form action="login_ok2" method="post">
			아이디 : <input type="text" name="id"><br>
			비밀번호: <input type="password" name="passwd"><br>
			<input type="submit" value="전송"><input type="reset" value="취소">
		</form>
	</body>
</html>