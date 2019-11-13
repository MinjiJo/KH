<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>includeTest1</title>
<style>
	body{text-align: center;}
	table{width: 500px; margin: 0 auto;}
</style>
</head>
<body>
<h2>Include 액션 테스트</h2>
<form action="includeTest2.jsp" method="post">

	<!-- hidden 타입의 input으로 다음 페이지에서 사용할 주소값을 지정하였습니다. -->
	<input type="hidden" name="includePage"
		   value="includeTest3.jsp">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" required></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" required></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address" required></td>
		</tr>
		<tr><td colspan=2>
			<input type="submit" value="전송">
		</td></tr>
	</table>
</form>
</body>
</html>