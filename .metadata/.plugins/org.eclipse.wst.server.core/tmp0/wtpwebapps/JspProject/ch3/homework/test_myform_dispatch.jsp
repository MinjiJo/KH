<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table{border: 1px solid silver; border-collapse: collapse; margin:0 auto}
td{border: 1px solid silver; font-size: 20px; text-align: center;}
td:first-child{width: 100px; background: lightblue; text-align: center;}
td:last-child{padding: 10px}
</style>
</head>
<body>

<table>
	<tr>
		<td>ID</td>
		<td><%=request.getAttribute("id") %></td>
	</tr>
	<tr>
		<td>PASS</td>
		<td><%=request.getAttribute("pass") %></td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td><%=request.getAttribute("jumin1") %>
			-
			<%=request.getAttribute("jumin2") %></td>
	</tr>
	<tr>
		<td>E-mail</td>
		<td><%=request.getAttribute("email") %>
			@
			<%=request.getAttribute("domain") %></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><%if(request.getAttribute("gender") == "m"){
				out.print("남성");
			} else {
				out.print("여성");
			}
			%></td>
	</tr>
	<tr>
		<td>취미</td>
		<td><%
			String[] hobby = request.getParameterValues("hobby");
			for(int i = 0; i < hobby.length; i++) {
				if(i != hobby.length - 1) {
					out.print(hobby[i] + " / ");
				} else {
					out.print(hobby[i]);
				}
			}
			%>
		</td>
	</tr>
	<tr>
		<td>우편번호</td>
		<td><%=request.getAttribute("post1") %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=request.getAttribute("address") %></td>
	</tr>
	<tr>
		<td>자기소개</td>
		<td><%=request.getAttribute("intro") %></td>
	</tr>
</table>
</body>
</html>