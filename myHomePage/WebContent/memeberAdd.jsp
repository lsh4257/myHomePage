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
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	body, div {
		width: 100%;
		border: 0px;
		margin: 0px;
		
	}
	
	table {
		margin: 0 auto;
		width: 900px;
		border-collapse: collapse; 
		
	}
	
	a {
	 	text-decoration: none;
	}
	
	p {
		text-align: center;
		color: teal;
		font-weight: bold;
		font-size: 25px;
		letter-spacing: 15px;
	}
	
	hr {
		border-color: red;
	}
	
	label {
		font-family: 'Jeju Hallasan', serif;
	}
	
	#add_member {
		padding-left: 15px;
	}
	
	#add {
		padding-left: 15px;
	}
	
	.add_th {
		width: 150px;
		background-color: #f8f8f9;
		font-family: 'Nanum Gothic', serif;
	}
	
	.add_td {
		vertical-align: top;
		width: 300px;
	}
  
  .validity {
		display: none;
		font-size: 9px;
		color: red;
		margin: 0 auto;
		width: 200px;
		
  }
  
  .div_input {
  		margin: 10px auto;
  		border: 1px solid;
  		border-radius: 10px;
  		width: 474px;
  		height: 50px;
  		line-height: 45px;
  }
  
  .div_span {
  		width: 150px;
  		margin-left: 220px;
  }
  
  .div_label {
  		width: 150px;
  		margin-left: 220px;
  }
  
  .add_input {
  		border: 0;
  		margin: 0 22px;;
  		width: 430px;
  		height: 30px; 
  }
  
  .add_input2 {
  		border: 0;
  		margin: 0 22px;;
  		width: 300px;
  		height: 30px;
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
	
	#id_btn {
		background-color: #353866;
		color: white;
		border-radius: 12px;
		height: 30px;
		width: 124px;
	}
	
	#post_btn {
	
		background-color: #353866;
		color: white;
		border-radius: 12px;
		height: 30px;
		width: 124px;
	}
	

	
	
</style>
</head>
<script src="js/jquery-3.2.1.js"></script>
<!-- DAUM 우편번호 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">

$(document).ready(function() {
	/* input 태그에 공백값일때 span 태그 경고문 생성 */
	$("#member_id").blur(function(){
		if($("#member_id").val() == ""){
			$("#span_id").css("display", "block");
		}
		else{
			$("#span_id").css("display", "none");
		}
	});
	
	$("#member_name").blur(function(){
		if($("#member_name").val() == ""){
			$("#span_name").css("display", "block");
		}
		else{
			$("#span_name").css("display", "none");
		}
	});
	
	$("#member_pw").blur(function(){
		if($("#member_pw").val() == ""){
			$("#span_pw").css("display", "block");
		}
		else{
			$("#span_pw").css("display", "none");
		}
	});
	
	$("#member_pwconfirm").blur(function(){
		if($("#member_pwconfirm").val() == ""){
			$("#span_pwconfirm").css("display", "block");
		}
		else{
			$("#span_pwconfirm").css("display", "none");
		}
	});
	
	$("#sample6_address2").blur(function(){
		if($("#sample6_address2").val() == ""){
			$("#span_addr2").css("display", "block");
		}
		else {
			$("#span_addr2").css("display", "none");
		}
	});
	
	$("#member_phone").blur(function(){
		if($("#member_phone").val() == ""){
			$("#span_phone").css("display", "block");
		}
		else {
			$("#span_phone").css("display", "none");
		}
	});
	
	$("#member_email").blur(function(){
		if($("#member_email").val() == ""){
			$("#span_email").css("display", "block");
		}
		else {
			$("#span_email").css("display", "none");
		}
	});
});


/* 우편번호,주소 input 클릭시 대신 우편번호 버튼 클릭  */
  	$(document).on("click", "#sample6_postcode", function(){
  		$("#post_btn").trigger("click");
  	});
  	
  	$(document).on("click", "#sample6_address", function(){
  		$("#post_btn").trigger("click");
  	});
  	
  	
  
 /* 아이디 중복체크  */
 	$(document).on("click", "#id_btn", function(){
 		//새창의 크기
 		cw=550;
 		ch=300;
 		
 		//스크린의 크기
 		sw=screen.availWidth;
 		sh=screen.availHeight;
 		
 		// 열창의 포지션
 		px=(sw-cw)/2;
 		py=(sh-ch)/2;
 		
 		
 		
 		//검색할 ID 값
 		var ckid = $("#member_id"),
 			re_id = /^[a-z0-9_-]{5,16}$/,
 			id = $.trim(ckid.val());
 			
 		if(id == ""){
 			$("#span_id").css("display","block");
			return false;
			
 		}else if(!re_id.test(id)){
			ckid.focus();
			$("#span_id").text("유효하지않는 아이디입니다.").css("display","block");
			return false;
 		}
 		
 		var url = "IdCheckAction?ckid=" + id;
 		window.open(url, "_blank_1", 
 					"toolbar=no, menubar=no, status=no, scrollbars=no, resizable=no, left=" + px + ", top=" + py + ", width=" + cw + ", height=" + ch);
 		
 		});
 

 /* 정규식  */
	$(document).on("click", "#a_member_add", function(){
		var re_id = /^[a-z0-9_-]{5,16}$/; // 아이디 검사식
		var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
		var re_email = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
		var re_phone = /^[0-9]{8,11}$/; // 전화번호 검사식
		
		var 
		form = $("#member_from"),
		m_id = $("#member_id"),
		m_name = $("#member_name"),
		m_pw1 = $("#member_pw"),
		m_pw2 = $("#member_pwconfirm"),
		m_post = $("#sample6_postcode"),
		m_addr1 = $("#sample6_address"),
		m_addr2 = $("#sample6_address2"),
		m_phone = $("#member_phone"),
		m_email = $("#member_email"),
		m_ckuid = $("#ckuid"),
		m_reckid = $("#reckid");
		
		var
		id = $.trim(m_id.val()),
		name = $.trim(m_name.val()),
		pw1 = $.trim(m_pw1.val()),
		pw2 = $.trim(m_pw2.val()),
		post = $.trim(m_post.val()),
		addr1 = $.trim(m_addr1.val()),
		addr2 = $.trim(m_addr2.val()),
		phone = $.trim(m_phone.val()),
		email = $.trim(m_email.val()),
		ckuid = $.trim(m_ckuid.val()),
		reckid = $.trim(m_reckid.val());
		
		
		//----- 아이디 체크 -----
		if(id==""){
			m_id.focus();
			$("#span_id").text("ID를 입력해주세요").css("display", "block");
			return false;
			
		} else if(!re_id.test(id)){
			m_id.focus();
			$("#span_id").text("ID 양식에 맞게 입력해주세요").css("display", "block");
			return false;
		
		// ---- 이름 공백체크 -----
		} else if(name=""){
			m_name.focus();
			$("#span_id").text("이름을 입력해주세요").css("display", "block");
			return false;
		}
		
		// ---- 비밀번호 체크 -----
		else if(pw1==""){
			m_pw.focus();
			$("#span_pw").text("비밀번호를 입력해주세요").css("display", "block");
			return false;
			
		} else if(!re_pw.test(pw1)){
			m_pw1.focus();
			$("#span_pw").text("비밀번호 양식에 맞게 입력해주세요").css("display", "block");
			return false;
			
		}else if(pw1 != pw2){
			m_pw2.focus();
			$("#span_pwconfirm").text("비밀번호가 맞지 않습니다.").css("display", "block");
			return false;
		}
		
		// ----- 헨드폰 번호 체크 -----
		else if(phone==""){
			m_phone.focus();
			$("#span_phone").text("헨드폰번호를 입력해주세요").css("display", "block");
			return false;
			
		} else if(!re_phone.test(phone)){
			m_phone.focus();
			$("#span_phone").text("헨드폰번호 양식에 맞게 입력해주세요").css("display", "block");
			return false;
		}	
		
		//---- 주소 체크 -----
		else if(post==""){
			m_post.focus();
			$("#span_post").text("우편번호를 입력해주세요").css("display", "block");
			$("#span_addr1").text("주소를 입력해주세요").css("display", "block");
			return false;
		
		} else if(addr2==""){
			m_addr2.focus();
			$("#span_addr2").text("상세주소를 입력해주세요").css("display", "block");
			return false;
		}
		
		//----- 이메일 체크 -----
		else if(email=="") {
			m_email.focus();
			$("#span_phone").text("이메일번호를 입력해주세요").css("display", "block");
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
		<h3>기본회원정보</h3>
		<hr>
	</div>
	
	<form id="member_from" name="member_form" action="MemberAdd" method="post">
	<div id = "add_member">
		<table>
			<tr class="add_tr">
				<td class="add_td">
					<div class="div_label">
						<label for="member_id">아이디</label>
					</div>
					<div class="div_input">
						<input type="text" class="add_input2" id="member_id" name="member_id">
						<input type="button" id="id_btn" value="ID 중복확인">
						<input type="hidden" id = ckuid name ="ckuid" class="ckuid" >
						<input type="hidden" id = reckid name ="reckid" class="ckuid" >
					</div>
					<div class="div_span">
						<span id ="span_id" class="validity">아이디를 입력해주세요</span>
					</div>	
				</td>
			</tr>
      
			<tr class="add_tr">
				<td class="add_td">
				<div class="div_label">
						<label for="span_name">이름</label>
					</div>
					<div class="div_input">
						<input type="text" class="add_input" id="member_name" name="member_name">
					</div>
					<div class="div_span">
        				<span id ="span_name" class="validity">이름를 입력해주세요</span>
        			</div>
        		</td>
			</tr>
      
			<tr class="add_tr">
				<td class="add_td">
				<div class="div_label">
						<label for="span_pw">비밀번호</label>
					</div>
					<div class="div_input">
						<input type="password" class="add_input" id="member_pw" name ="member_pw">
					</div>
					<div class="div_span">
       			 		<span id ="span_pw" class="validity">비밀번호를 입력해주세요</span>
       			 	</div>
       			 </td>
			</tr>
      
			<tr class="add_tr">
				<td class="add_td">
				<div class="div_label">
						<label for="span_pwconfirm">비밀번호 확인</label>
					</div>
					<div class="div_input">
						<input  type="password" class="add_input" id="member_pwconfirm">
					</div>
					<div class="div_span">
        				<span id ="span_pwconfirm" class="validity">비밀번호 확인을 입력해주세요</span>
        			</div>
        			
        		</td>
			</tr>
      
			<tr class="add_tr">
				<td class="add_td">
				<div class="div_label">
						<label for="sample6_postcode">주소</label>
					</div>
					<div class="div_input">
						<input type="text" class="add_input2" id="sample6_postcode" name="member_zipnum" placeholder="우편번호" readonly>
						<input type="button" id="post_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</div>
					<div class="div_span">
	       			 		<span id ="span_post" class="validity"></span>
	       			 </div>
	       			 
					<div class="div_input">
						<input type="text" class="add_input" id="sample6_address" name="member_addr" placeholder="주소" readonly>
					</div>
					<div class="div_span">
	       			 	<span id ="span_addr1" class="validity"></span>
	       			 </div>
	       			 
					<div class="div_input">
						<input type="text" class="add_input" id="sample6_address2" name="member_addr2" placeholder="상세주소">
					</div>
					<div class="div_span">
          				<span id ="span_addr2" class="validity">상세주소를 입력해주세요</span>
          			</div>
          		</td>
			</tr>
      
			<tr class="add_tr">
				<td class="add_td">
				<div class="div_label">
						<label for="member_id">핸드폰번호</label>
					</div>
					<div class="div_input">
						<input type="text" class="add_input" id="member_phone" name ="member_phone" maxlength="11" placeholder=" '-' 제외 11자리로 입력">
					</div>
					<div class="div_span">
        				<span id ="span_phone" class="validity">핸드폰번호를 입력해주세요</span>
        			</div>
        		</td>
			</tr>
      
			<tr class="add_tr">
				<td class="add_td">
				<div class="div_label">
						<label for="member_id">이메일</label>
					</div>
					<div class="div_input">
						<input type="text" class="add_input" id="member_email" name="member_email" maxlength="50">
					</div>
					<div class="div_span">
	       				<span id ="span_email" class="validity">이메일을 입력해주세요</span>
	       			</div>
	       		</td>
			</tr>			
		</table>
	</div>
	
		<div id ="div_member_add">
			<hr>
			<a href="#" id="a_member_add"><span id="span_memeber_add">회원가입</span></a>
			<a href="BrandIndex" id="a_member_cancel"><span id =span_member_cancel>취소</span></a>
		</div>
	</form>
</body>
</html>