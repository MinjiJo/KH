<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<title>forwardTest3</title>
<style>
	body{text-align: center;}
	table{width: 500px; margin: 0 auto;}
</style>
</head>
<body>
<h2>포워드 된 페이지(forwardTest3.jsp)</h2>
<table>
	<tr>
		<td>name</td>
		<td><%=request.getParameter("name") %></td>
	</tr>
	<tr>
		<td>age</td>
		<td><%=request.getParameter("age") %></td>
	</tr>
	<tr>
		<td>address</td>
		<td><%=request.getParameter("address") %></td>
	</tr>
</table>
</body>
</html>