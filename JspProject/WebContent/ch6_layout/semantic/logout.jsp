<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>logout.jsp</title>
	<script>
		alert("<%=session.getAttribute("id")%>�� �α׾ƿ� �Ǽ̽��ϴ�.");
	</script>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href="templatetest.jsp";
	</script>
</body>
</html>