<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	session.setMaxInactiveInterval(10);//10초 동안 세션유지
	//실행 방법 - 실행 후 10초 안에 새로 고침(F5)해 보세요.
	//		     실행 후 10초 후에 새로 고침(F5)해 보세요.
	//10초 후 새로운 세션 ID로 생성됩니다.
	
	SimpleDateFormat formatter =
			new SimpleDateFormat("yyyy-MM-dd E요일 HH:mm:ss");
%>
<html>
<head>
	<title>Session Test</title>
</head>
<body>
	<h2>세션 테스트</h2>
		isNew():<%=session.isNew() %><br> <!-- 새로운 세션이면 true 아니면 false -->
		세션 생성시간:<%=formatter.format(session.getCreationTime()) %><br>
		최종 접속 시간:<%=formatter.format(session.getLastAccessedTime()) %><br>
		세션ID:<%=session.getId() %><br>
		<!-- ID는 session 객체 생성시에 웹 컨테이너에 의해 자동으로 할당됩니다. -->
</body>
</html>