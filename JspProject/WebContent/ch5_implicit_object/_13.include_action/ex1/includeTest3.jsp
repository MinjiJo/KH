<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>
<%	request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<title>includeTest3</title>
<style>
	body{text-align: center;}
	table{width: 500px; margin: 0 auto;}
</style>
</head>
<body>
<h2>include �� ������(includeTest3.jsp)</h2>
<table>
<%
	Enumeration<String> e = request.getParameterNames();
	while(e.hasMoreElements()){
		String attributeName = e.nextElement();
		String attributeValue = 
				request.getParameter(attributeName);
%>
	<tr>
		<td><%=attributeName %></td>
		<td><%=attributeValue %></td>
	</tr>
	<%
		}
	%>
</table>
</body>
</html>