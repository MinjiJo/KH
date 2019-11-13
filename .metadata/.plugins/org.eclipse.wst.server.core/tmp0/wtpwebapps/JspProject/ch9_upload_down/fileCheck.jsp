<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String filename1=request.getParameter("filename1");
	String filename2=request.getParameter("filename2");
	String origfilename1=request.getParameter("origfilename1");
	String origfilename2=request.getParameter("origfilename2");
%>
<html>
<head>
<title>파일 업로드 확인 및 다운로드</title>
<style>
	table{margin:0 auto; width: 400px;}
	input{width: 95%}
	td{text-align: center;}
</style>
</head>
<body>
<form>
	<table border=1>
		<tr class="yellow">
			<td colspan=2 class="center pad"><h3>파일 다운로드 폼</h3>
		</tr>
		<tr>
			<td>올린 사람</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=subject %></td>
		</tr>
		<tr>
			<td>파일명1</td>
			<td>
				<a href="file_down.jsp?file_name=<%=filename1%>">
					<%=origfilename1 %>
				</a>
			</td>
		</tr>
		<tr>
			<td>파일명2</td>
			<td>
				<a href="file_down.jsp?file_name=<%=filename2%>">
					<%=origfilename2 %>
				</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>