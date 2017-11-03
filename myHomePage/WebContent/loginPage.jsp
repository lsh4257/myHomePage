<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

	dody, div{
	
		padding: 0px;
		margin: 0px;
	}
	
	.div_login {
		text-align: center;
		width: 390px;
		margin: 50px auto;
		padding: 30px 0;
		border: 1px solid #353866;
	
	}
	
	.div_login2 {
		border: 2px solid black;
		width: 350px;
		padding: 7px;
		text-align: center;
		margin: 5px auto;
	}
	
	.input_login {
		border: 0;
		height: 30px;
		width: 300px;
		padding: 5px 13px;
	}
	
	.login_search {
		margin: 0 auto;
		width:380px;
		padding-top: 15px;
		border-top: 1px solid;
	}
	
	.span_login_search {
		color: black;
		font-size: 17px;
		font-family: 'Jeju Gothic', serif;
	}
	
	.span_login {
		height: 50px;
		width: 360px;
		display: inline-block;
		border-radius: 5px;
		background-color: black;
		color: white;
		line-height: 50px;
		font-weight: bold;
		font-family: Jeju Gothic', serif;		
	}
	
	.login_confirm {
		display: none;
		color : red;
		font-size: 10px;
		font-family: Jeju Gothic', serif;
	}
	
	.login_confirm2 {
		display: none;
	}
	
	#login_title {
		font-size: 50px;
		padding-bottom: 50px;	
	}

	#btn_login {
		width: 364px;
		margin: 0 auto; 
		padding: 15px 0;
	}
	
	a {
		text-decoration: none;
	}
	
</style>
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	 window.onload = function() {
		var code = ${code};
		if(code == '2'){
			document.getElementById('login_confirm2').style.display ="block";
		} 
	 };
</script>

<script type="text/javascript">
	$(document).ready(function(){
		
		// 로그인 포커스 / 블러효과
		$("#input_id").focus(function(){
			$("#div_login_id").css("border", "2px solid #f94e3f");
		});
		
		$("#input_id").blur(function(){
			$("#div_login_id").css("border", "2px solid black");
		});
		
		$("#input_pw").focus(function(){
			$("#div_login_pw").css("border", "2px solid #f94e3f");
		});
		
		$("#input_pw").blur(function(){
			$("#div_login_pw").css("border", "2px solid black");
		});
		
		
		
		
		// 아이디, 비밀번호 입력여부 확인

		$("#input_id").blur(function(){
			if($("#input_id").val() == ""){
				$("#id_confirm").css("display", "block");
			}
			else{
				$("#id_confirm").css("display", "none");
			}
		});
		
		$("#input_pw").blur(function(){
			if($("#input_pw").val() == ""){
				$("#pw_confirm").css("display", "block");
			}
			else{
				$("#pw_confirm").css("display", "none");
			}
		}); 
	});
	
	
	
	$(document).on("click", "#span_login", function(){
		
		var
		form = $("#form_login"),
		id = $("#input_id"),
		pw = $("#input_pw");
		
		// 공백(스페이스)제거
		var
		sid = $.trim(id.val()),
		spw = $.trim(pw.val());
		
/* 		// 공백체크
		if(sid==""){
			id.focus();
			alert("아이디를 입력해주세요");
			return false;
		
		}else if(spw==""){
			pw.focus();
			alert("비밀번호를 입력해주세요");
			return false;
		} */

	 	form.submit();  
		
	});
	
</script>
<body>
<%@include file="header.jsp" %>
	<section>
	<div class="div_login">
		<div id = "login_title">Login</div>
		
	<form id = "form_login" action="MemberLogin" name = "MemberLogin" method="post">
		<div class="div_login2" id="div_login_id">
			<input type ="text" id ="input_id" name="input_id" class="input_login" placeholder="아이디입력">
		</div>
			<span class="login_confirm" id="id_confirm">아이디를 입력해주세요</span>
		
		<div class="div_login2" id="div_login_pw">
			<input type="password" id ="input_pw" name="input_pw" class="input_login" placeholder="비밀번호입력">
		</div>
			<span class="login_confirm" id="pw_confirm">비밀번호를 입력해주세요</span>
		  
		<div id="btn_login">
			<a href="#" ><span id="span_login" class="span_login">로그인</span></a>
		</div>
		<span class="login_confirm2" id ="login_confirm2">존재하지 않는 ID이거나, ID/PW 가 틀립니다.</span>
	</form>
		
		<div id= "btn_login">
			<a href="contract.jsp" ><span id="span_pw" class="span_login">회원가입</span></a>
		</div>
		
		<div class="login_search">	
			<a href="#" ><span class="span_login_search">아이디찾기</span></a>&nbsp
			<span>||</span>&nbsp
			<a href="#" ><span class="span_login_search">비밀번호찾기</span></a>
		</div>	
	</div>
	</section>
	
</body>
</html>