$(document).ready(function(){
	var isStyle=false;
	$("form").submit(function(e){//전송 버튼 클릭시
		e.preventDefault();
		var check=0;//이름에 포커스를 줄 때는 check=0입니다.
					//나이에 포커스를 줄 때는 check=0입니다.
					//주소에 포커스를 줄 때는 check=0입니다.
		
		if($("#name").val()==""){//이름을 입력하지 않은 경우
			$("#name").attr("placeholder", "이름을 입력하세요");
			//이름에 포커스를 줍니다.
			$("#name").focus();
			check++;
		}
		
		if($("#age").val()==""){//나이를 입력하지 않은 경우
			//placeholder의 값을 변경합니다.
			$("#age").attr("placeholder", "나이를 입력하세요");
			//나이에 포커스를 줍니다.
			if(check==0) $("#age").focus();
			check++;
		}
		
		if($("#address").val()==""){//주소를 입력하지 않은 경우
			//palceholder의 값을 변경합니다.
			$("#address").attr("placeholder", "주소를 입력하세요");
			//주소에 포커스를 줍니다.
			if(check==0) $("#address").focus();
			check++;
		}
		
		//input 태그 중 빈 곳이 한 곳이라도 있으면 placeholder의 색상을 변경합니다.
		if(check!=0){
			if(!isStyle){
				//placeholder의 색상을 빨간색으로 변경하는 스타리을 head태그 뒤에 추가합니다.
				$("<style>input::-webkit-input-placeholder{color:red}</style>")
				.appendTo("head");//크롬, 사파리
				$("<style>input::-moz-placeholder{color:red;opacity:1}</style>")
				.appendTo("head");//파이어폭스
				$("<style>input:-ms-input-placeholder{color:red}</style>")
				.appendTo("head");//IE
				isStyle=true;
			} 
		} else {
			//서버로 보낼 데이터를 폼에서 얻어옵니다.
			//입력 양식에 적힌 값을 쿼리 문자열로 바꿉니다.
			var data=$('form').serialize();
			console.log(data);
			//$("div").load("process.jsp",name=love&age=21&address=서울시 중구);
			$("div").load("../ex2/process.jsp",data);
		}
	});//ready end
})