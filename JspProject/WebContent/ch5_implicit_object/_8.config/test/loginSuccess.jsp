<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>loginSuccess</title>
<style>
div{color:green;}
</style>
</head>
<body>
<%
String web_id =config.getInitParameter("id"); 
String web_pass =config.getInitParameter("pass");

String id = request.getParameter("id");
String pass = request.getParameter("passwd");

if(web_id.equals(id) && web_pass.equals(pass)){ 
%>
<div>로그인에 성공하셨습니다.</div>
<% 
} else { 
%>
<div>로그인에 실패하셨습니다.</div>
<% 
} 
%>
</body>
</html>