<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix ="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>내 페이지</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src = "js/jquery-3.4.1.js"></script>
<link href="css/mypage.css"  rel="stylesheet" type="text/css" />
<script>
$(function(){
	$(".update").click(function(){
		location.href="ProfileUpdate.do";
	});
	function follower(){
		$.ajax({
			type : "post",
			url : "followercheck.do",
			data : {'id' : '${sessionScope.id}'},
			success : function(rdata){
				$('#follower').empty();
				$('#follower').append(rdata);
			}
		})
	}
	follower();
	
	function following(){
		$.ajax({
			type : "post",
			url : "followingcheck.do",
			data : {'id' : '${sessionScope.id}'},
			success : function(rdata){
				$('#following').empty();
				$('#following').append(rdata);
			}
		})
	}
	following();
	function postcount(){
		$.ajax({
			type : "post",
			url : "postCount.do",
			data : {'id' : '${sessionScope.id}'},
			success : function(rdata){
				$('#postCount').empty();
				$('#postCount').append(rdata);
			}
		})
	}
	postcount();
	
	function followerlist(){
		$.ajax({
			type : "post",
			url : "followerlist.do",
			data : {'id' : '${sessionScope.id}'},
			dataType : 'json',
			success : function(rdata){
				$('#modal_follower').empty();
				output = '';
				var count = 0;
				$.each(rdata[0], function(index, data){
					count = count + 1;
				});
				for(var i=0; i<count; i++){
					output += "<img src='id/"+ rdata[0][i]  + "/" + rdata[1][i] +"' width='30px' style='border-radius:50px'>  " + rdata[0][i];
					output += "<button type='button' class='btn";
					var text = rdata[0][i].substr(1,rdata[0][i].length);
					if(rdata[2].text == 1){
						output += " btn-light' style='float:right;'>팔로잉</button><br>";
					}else{
						output += " btn-primary' style='float:right;'>팔로우</button><br>";
					}
				}
				
				$('#modal_follower').append(output);
			}
		})
	}
	followerlist();
	function followinglist(){
		$.ajax({
			type : "post",
			url : "followinglist.do",
			data : {'id' : '${sessionScope.id}'},
			dataType : 'json',
			success : function(rdata){
				$('#modal_following').empty();
				output = '';
				var count = 0;
				$.each(rdata[0], function(index, data){
					count = count + 1;
				});
				for(var i=0; i<count; i++){
					output += "<img src='id/"+ rdata[0][i]  + "/" + rdata[1][i] +"' width='30px' style='border-radius:50px'>  " + rdata[0][i] + "<button type='button' class='btn btn-light' style='float:right;'>팔로잉</button><br>";
				}
				
				$('#modal_following').append(output);
			}
		})
	}
	followinglist();
	
})
</script>
<jsp:include page="header.jsp"/>
</head>
<body>
       	<div class = "bg">
       		<div class = "gg">
       			<div class = "profile"><img src = "id/${id }/${pic_url}" class = "profile"></div>
       		</div>
       		<div class = "gg2">
       			<div class = "h_font">${id }&nbsp;<button class = "update">프로필 설정</button>
       			</div>
       		</div>
       		<div class = "gg3">	
       			<div class = "board"><h3 class = "m15">게시글</h3><h3 class = "m10" id = "postCount"></h3></div>
       			<div class = "board"><a href = "#" data-toggle="modal" data-target="#myModal"><h3 class = "m15">팔로워</h3><h3 class = "m10" id = "follower"></h3></a></div>
       			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  					<div class="modal-dialog">
		    			<div class="modal-content">
	      					<div class="modal-header">
	        					<h3 class="modal-title" id="myModalLabel">팔로워</h3>
	      					</div>
	      					<div class="modal-body" id="modal_follower">
	      					</div>
		      				<div class="modal-footer">
			        			<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
		      				</div>
	    				</div>
		  			</div>
				</div>
       			<div class = "board"><a href = "#" data-toggle="modal" data-target="#myModal2"><h3 class = "m15">팔로잉</h3><h3 class = "m10" id = "following"></h3></a></div> 
		       		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		 			<div class="modal-dialog">
		   				<div class="modal-content">
	    					<div class="modal-header">
	      						<h3 class="modal-title" id="myModalLabel2">팔로잉</h3>
	     					</div>
	    					<div class="modal-body" id="modal_following">
	    					</div>
		    				<div class="modal-footer">
		       					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
		     				</div>
		   				</div>
			  			</div>
					</div>
       		</div>
       	</div>
       	<div class = "bg2">
	       	<c:forEach var="list" items="${profileList }" varStatus="status">
	       		<c:if test="${status.count %3 == 1 }">
					<div class="pi">		       		
		       			<a href="postView.do?id=${id}&&itemNum=${list.itemNum}"><img src="id/${id }/${list.itemNum }/${list.pic_url}" width="200px" height="200px"></a>
	       			</div>
	    		</c:if>
       			<c:if test="${status.count %3 == 2 }">
       				<div class="pi">		
		       			<a href="postView.do?id=${id}&&itemNum=${list.itemNum}"><img src="id/${id }/${list.itemNum }/${list.pic_url}"  width="200px" height="200px"></a>
	       			</div>
       			</c:if>
	       		<c:if test="${status.count%3 == 0 }">
	       			<div class = "pi">
		       			<a href="postView.do?id=${id}&&itemNum=${list.itemNum}"><img src="id/${id }/${list.itemNum }/${list.pic_url}"  width="200px" height="200px"></a>
	       			</div>
	       			<br>
	       		</c:if>
	       	</c:forEach>
       	</div>
</body>
</html>