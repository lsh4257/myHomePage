<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- prefix="c" 변수를 c로 선언하겠다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	body, div {
		width: 100%;
		border: 0px;
		margin: 0px;
		
	}
	
	table {
		width: 100%;
		border-collapse: collapse; 
		
	}
	
	p {
		text-align: center;
		color: teal;
		font-weight: bold;
		font-size: 25px;
		letter-spacing: 15px;
	}
	
	a {
	 	text-decoration: none;
	}
	
	hr {
		border-color: red;
	}
	
	#add_member {
		padding-left: 15px;
	}
	
	#add {
		padding-left: 15px;
	}
	
	.add_tr {
		height: 30px;
		width: 150px;
		display: table-row;
		
	}
	
	.add_th {
		text-align: left;
		width: 30px;
		vertical-align: top;
		background-color: #f8f8f9;
		border-top: 1px solid #eee;
		font: 15px 굴림 bold;
		padding: 5px 15px 5px 5px;
    	line-height: 50px;
		
	}
	
	.add_td {
		vertical-align: top;
		width: 300px;
		border-top: 1px solid #eee;
   		line-height: 50px;
	}
	
	.validity{
	   	display: none;
	  	font-size: 9px;
	   	color: red;
  	}
	
	#div_member_add {
		text-align: center;
		padding-top: 15px;
	}
	
	
	#span_memeber_add {
		padding: 7px 12px;
		display: inline-block;
		background-color: #3c3c3c;
		border-radius: 6px;
		color: #fff;
		letter-spacing: 1px;
		font-size: 15px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	#span_member_cancel {
		padding: 7px 12px;
		display: inline-block;
		background-color: #3c3c3c;
		border-radius: 6px;
		color: #fff;
		letter-spacing: 2px;
		font-size: 15px;
		font-family: 'Noto Sans KR', sans-serif;
	
	}
	
	#member_id {
		background-color: #FBFFB9;
	}
	
</style>
</head>
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	/* focus /blur 효과 */
	$("#member_name").blur(function(){
		if($("#member_name").val() == ""){
			$("#span_name").css("display", "block");	
		}
		else if($("#member_name").val() != ""){
			$("#span_name").css("display", "none");
		}
	});
	
	$("#member_pw").blur(function(){
		if($("#member_pw").val() == ""){
			$("#span_pw").css("display", "block");
			
		} else if($("#member_pw").val() != ""){
			$("#span_pw").css("display", "none");
		}
	});
	
	$("#member_pwconfirm").blur(function(){
		if($("#member_pwconfirm").val() == ""){
			$("#span_pwconfirm").css("display", "block");
		
		} else{
			$("#span_pwconfirm").css("display", "none");
		}
	});
	
	$("#member_addr1").blur(function(){
		if($("#member_addr1").val() == ""){
			$("#span_addr1").css("display", "block");
		} else{
			$("#span_addr1").css("display", "none");
		}
	});
	
	$("#member_addr2").blur(function(){
		if($("#member_addr2").val() == ""){
			$("#span_addr2").css("display", "block");
		} else {
			$("#span_addr2").css("display", "none");
		}
	});
	
	$("#member_phone").blur(function(){
		if($("#member_phone").val() == ""){
			$("#span_phone").css("display", "block");
		} else {
			$("#span_phone").css("display", "none");
		}
	});
	
	$("#member_email").blur(function(){
		if($("#member_email").val() == ""){
			$("#span_email").css("display", "block");
		} else {
			$("#span_email").css("display", "none");
		}
	});
	
});

	$(document).on("click", "#member_update", function(){
		/*정규식  */
		var re_id = /^[a-z0-9_-]{5,16}$/; // 아이디 검사식
		var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
		var re_email = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
		var re_url = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/; // URL 검사식
		var re_phone = /^[0-9]{8,11}$/; // 전화번호 검사식
		
		/*변수설정 */
		var 
		form = $("#form_update"),
		uname = $("#member_name"),
		upw1 = $("#member_pw"),
		upw2 = $("#member_pwconfirm"),
		uaddr1 = $("#member_addr1"),
		uaddr2 = $("#member_addr2"),
		uphone = $("#member_phone"),
		uemail = $("#member_email");
		
		/* 입력받은값 공백제거 */
		var
		name = $.trim(uname.val()),
		pw1 = $.trim(upw1.val()),
		pw2 = $.trim(upw2.val()),
		addr1 = $.trim(uaddr1.val()),
		addr2 = $.trim(uaddr2.val()),
		phone = $.trim(uphone.val()),
		email = $.trim(uemail.val());
		// ---- 비밀번호 체크 -----
		if(pw1==""){
			upw1.focus();
			alert("비밀번호를 입력해주세요");
			return false;
			
		} else if(!re_pw.test(pw1)){
			upw1.focus();
			alert("비밀번호 양식에 맞게 입력해주세요");
			return false;
			
		} else if(pw1 != pw2){
			upw2.focus();
			alert("비밀번호가 서로 맞지 않습니다.")
			return false;
		}
		
		// ----- 헨드폰 번호 체크 -----
		else if(phone==""){
			uphone.focus();
			alert("헨드폰번호를 입력해주세요");
			return false;
			
		} else if(!re_phone.test(phone)){
			uphone.focus();
			alert("헨드폰번호 양식에 맞게 입력해주세요");
			return false;
		}
		
		//----- 이메일 체크 -----
		else if(email=="") {
			uemail.focus();
			alert("이메일번호를 입력해주세요");
			return false;
		
		} else if(!re_email.test(email)){
			uemail.focus();
			alert("이메일 양식에 맞게 입력해주세요");
			return false;
		} 
		
		form.submit();
		
	});

</script>
<body>
	<%@include file= "header.jsp" %>
	
	<div id = "add">
		<h3>회원정보수정</h3>
		<hr>
	</div>
	
<form action="MemberUpdate" id="form_update" name="form_update" method="post">	
  <%-- <c:forEach items="${mList}" var="mList"> --%>
	<div id = "add_member">
		<table>
			<tr class="add_tr">
				<th class="add_th">아이디</th>
				<td class="add_td"><input type = "text" id ="member_id" name="update_id" size="20" maxlength="20" value= "${sessionScope.loginUser.s_id}" readonly></td>
			</tr>
			
			<tr class="add_tr">
				<th class="add_th">이름</th>
				<td class="add_td"><input type = "text" id="member_name" name="update_name" size="20" maxlength="20" value="${sessionScope.loginUser.s_name}">
				<span id ="span_name" class="validity">이름을 입력해주세요</span></td>		
			</tr>
			
			<tr class="add_tr">
				<th class="add_th">수정비밀번호</th>
				<td class="add_td"><input type ="password" id="member_pw" name="update_pw" size="20" maxlength="20">
				<span id ="span_pw" class="validity">비밀번호를 입력해주세요</span></td>
			</tr>
			
			<tr class="add_tr">
				<th class="add_th">수정 비밀번호 확인</th>
				<td class="add_td"><input type = "password" id="member_pwconfirm" size="20" maxlength="20">
				<span id ="span_pwconfirm" class="validity">비밀번호 확인을 입력해주세요</span></td>
			</tr>
			
			<tr class="add_tr">
				<th class="add_th">주소</th>
				<td class="add_td"><input type = "text" id="member_addr1" name="update_addr" size="50" maxlength="15" placeholder="기본주소" value="${sessionScope.loginUser.s_addr}"><br>
				<span id ="span_addr1" class="validity">주소를 입력해주세요</span>
				<input type = "text" id="member_addr2" name="update_addr2" size="50" maxlength="15" placeholder="상세주소" value="${sessionScope.loginUser.s_addr2}">
				<span id ="span_addr2" class="validity">상세주소를 입력해주세요</span></td>
			</tr>
			
			<tr class="add_tr">
				<th class="add_th">핸드폰번호</th>
				<td class="add_td"><input type = "text" id="member_phone" name="update_phone" size="20" maxlength="20" placeholder=" '-' 제외 11자리로 입력" value="${sessionScope.loginUser.s_phone}">
				<span id ="span_phone" class="validity">핸드폰번호를 입력해주세요</span></td>
			</tr>
			
			<tr class="add_tr">
				<th class="add_th">이메일</th>
				<td class="add_td"><input type = "text" id="member_email" name="update_email" size="35" maxlength="35" value="${sessionScope.loginUser.s_email}">
				<span id ="span_email" class="validity">이메일을 입력해주세요</span></td>
			</tr>
		</table>
	</div>
	
	<div id ="div_member_add">
		<hr>
		<a href="#" id="member_update"><span id="span_memeber_add">수정</span></a>
		<a href="BrandIndex" id="member_cancel"><span id =span_member_cancel>취소</span></a>
	</div>
	<%-- </c:forEach> --%>
	</form>
</body>
</html>