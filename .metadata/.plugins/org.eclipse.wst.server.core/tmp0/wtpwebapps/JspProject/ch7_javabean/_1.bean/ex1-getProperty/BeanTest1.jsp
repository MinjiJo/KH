<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "javabean.BeanTest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자바빈을 스크립트 요소로 접근한 경우</title>
</head>
<body>
	<h1>자바빈 예제</h1>
	<%
		BeanTest beantest = new BeanTest();
	%>
	<h3><%=beantest.getName() %></h3>
</body>
</html>