<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
<div>
	<div>
			<span>아이디 : </span>
			<input value = "${sessionScope.loginUser.s_id}"><br>
			<span>비밀번호 : </span>
			<input type="password">
	</div>
	
	<div>
		<a href="#"><span>확인</span></a>
		<a href="BrandIndex"><span>취소</span></a>
	</div>
</div>
</body>
</html>