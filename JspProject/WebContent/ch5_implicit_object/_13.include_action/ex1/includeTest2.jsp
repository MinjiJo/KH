<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>인클루드 액션 테스트 시작</h2>
	<%request.setCharacterEncoding("euc-kr"); %>
	<%-- <%request.getParameter("includePage"); %>
		 표현식의 문자열은 자바로 표현해야 하므로 "를 사용하고 액션 태그에서는
		 '를 사용합니다. --%>
	<jsp:include page='<%=request.getParameter("includePage") %>'>
		<jsp:param name="tel" value="010-1234-5678"/>
		<jsp:param name="alias" value="happy"/>
	</jsp:include>
	<h2>인클루드 액션 테스트 끝</h2>
</body>
</html>