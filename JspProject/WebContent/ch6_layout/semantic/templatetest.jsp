<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>templatetest.jsp</title>
<style>
	*{margin: 0; padding: 0; box-sizing: border-box;}
	body{padding: 10px; text-align: center;}
	a{text-decoration: none; margin-right: 20px;}
	nav{width: 100%; height: 50px; text-align: right; line-height: 50px; 
		background: silver; }
	#wrap{margin-top: 50px; }
	aside{width: 20%; height: 300px; text-align: left; float: left; 
		  background: silver; border: 1px solid silver; padding: 10px;}
	aside>a{color: black; display: block; margin: 0 0 50px 0; }
	aside>a:hover{opacity: 30%}
	section{width: 80%; height: 300px; text-align: left; float: right;
			border: 1px solid silver; padding: 30px 10px 30px 50px;}
	footer{width: 100%; height: 50px; text-align: center; line-height: 50px;}
</style>
</head>
<body>
	<%
	String pagefile = request.getParameter("page");
	if(pagefile==null){
		pagefile="newitem";
	}
	%>
	<header>
		<h1>상품 목록입니다.</h1><br>
	</header>
	<nav>
		<jsp:include page="top.jsp"/><br><br>
	</nav>
	<div id="wrap">
		<aside>
			<jsp:include page="left.jsp"/>
		</aside>
		<section>
			<jsp:include page='<%=pagefile+".jsp" %>'/>
		</section>
	</div>
	<footer>
		<jsp:include page="bottom.jsp"/>
	</footer>
</body>
</html>