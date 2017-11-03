<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- prefix="c" 변수를 c로 선언하겠다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복체크 확인</title>
<style>
	.span_ck {
		display: none;
		font-size: 15px;
		color: red;
	}
	
	.id_check {
		width: 250px;
		margin: 0 auto;
	}

</style>

<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function closeOk(){
			opener.document.member_form.member_name.focus();
	 		opener.document.member_form.ckuid.value = "0"; /*아이디 중복체크를 hidden input 타입에 넣어서 체크한다.  */
			opener.document.member_form.reckid.value = "${message}"; 
			opener.document.member_form.member_id.value = "${message}"; 			
	 		self.close();
	}
	
	function closeNg() {
			opener.document.member_form.member_id.select();
			opener.document.member_form.ckuid.value = "1"; 
			self.close();
	}
	
	$(document).on("click", ".ck_btn", function(){
		var form = $("#idcheck"),
			reckid = $("#reckid"),
			id = $.trim(reckid.val()),
		 	re_id = /^[a-z0-9_-]{5,16}$/;
			
		if(id==""){
			reckid.focus();
			$("#span_id").text("ID를 입력해주세요").css("display", "block");
			return false;
		
		}else if(!re_id.test(id)){
			reckid.focus();
			$("#span_id").text("아이디 양식에 맞게 입력해주세요").css("display", "block");
			return false;
		}
		
			form.submit();
	});
</script>
</head>
<body>
	<c:choose>
		 <c:when test="${idCount=='0'}">
		 	<div class="id_check">
		 		${message}는 사용가능한 ID 입니다.
		 		<button onclick="closeOk()">확인</button>
		 	</div>
		 </c:when>
		 <c:otherwise>
	<form action="IdCheckAction" id="idcheck" name="idcheck" method="post">
		<div class="id_check">
		 	"${message}" 는 중복된 아이디 입니다.<br>
		 	다른 ID를 입력해주세요.<br>
		 	<!-- <button onclick="closeNg()">확인</button> -->
		 	ID : <input type="text" id="reckid" name="reckid" placeholder="${message}"><br>
		 	<input type="submit" class="ck_btn" value="중복체크"><br>
		 	<span id="span_id" class="span_ck">아이디를 입력해주세요</span>
		 </div>
	</form>
		 </c:otherwise>
	</c:choose>
</body>
</html>