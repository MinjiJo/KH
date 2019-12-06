<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous" />
<link rel="stylesheet" type="text/css" href="css/header_search.css" />
<link rel="shortcut icon" href="icons/cat_logo.jpg">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/header_search.js"></script>
<c:if test="${!empty id }">
<title>Lightgram | ${id} </title>
</c:if>
<c:if test="${empty id }">
<title>Lightgram</title>
</c:if>
</head>
<body>
  <div id="mask"></div>
  <div style="background-color: #86E57F; width: 300px; height: 300px; position: absolute; top:200px; left: 500px; display: none; z-index:10001;" id="test">
   </div>
	<header id="header">
		<div class="header__column">
			<span class="header__icon"> 
				<a href="Newsfeed.do"> 
					<img src="icons/cat_logo.jpg">
				</a>
			</span>
		</div>
		<form name="searchForm" action="Search.do">
		<div class="click_search">
		<div class="header__column">
			<input type="submit" id="search_btn" value="" class="submit_img">
			<input type="text" id="search_input" name="search_word" placeholder="검색">
     		 <select class="form-control" name="search_option" id="search_option">
								<option value="hash_sel" selected>해시태그로 검색</option>
								<option value="location_sel">지역으로 검색</option>
								<option value="name_sel">이름으로 검색</option>
								<option value="id_sel">아이디로 검색</option>
							</select>
		</div>
		</div>
		</form>
		<div class="header__column">
			<span id="menu_icon"> <i class="fas fa-bars"></i>
			</span>
		</div>
	</header>
	<div id="menu">
		<ul>
			<li><div class="menu" onClick="location.href='Newsfeed.do'">Newsfeed</div></li>
			<li><div class="menu" onClick="location.href='Search.do'">Search</div></li>
			<li><div class="menu" onClick="location.href='AddF.do'">Add</div></li>
			<li><div class="menu" onClick="location.href='Magazine.do'">Magazine</div></li>
			<li><div class="menu" onClick="location.href='Mypage.do'">My page</div></li>
			<li><div class="menu" onClick="location.href='logout.net'">Logout</div></li>
		</ul>
		<p id="copyright">
			<a href="#">
				&copy; Lightgram
			</a>
		<p>
	</div>
	<div id="moveTop">
		<img src="icons/arrow_up.png" />
	</div>
</body>
</html>