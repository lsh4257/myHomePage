<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- prefix="c" 변수를 c로 선언하겠다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Refresh" content="3; url = BrandIndex"> <!--3초후에 페이지 이동 -->
<title>환영합니다.</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
@import url('https://fonts.googleapis.com/css?family=Wendy+One');
@import url('https://fonts.googleapis.com/css?family=Indie+Flower');
	
	body, div {
		margin: 0px;
		padding: 0px;
	}
	
	.welcome {
		margin: 0 auto;
		margin-top: 80px;
		width: 700px;
		height: 250px;
		border: 1px solid;
		border-radius: 12px;
		line-height: 250px;
		text-align: center;
		font-size: 30px;
		font-family: 'Jeju Hallasan', serif;
	}
	
	.p_welcome {
		width: 250px;
		margin: 0 auto;
		margin-top: 30px;
	}
	
	
	
	.logo_span {
		color: black;
		font-size: 35px;
	}	
	
	#logo > a {
		font-family: 'Wendy One', sans-serif;
		text-decoration: none;
	}
 
 	#main_logo {
 		width: 300px; /* 가운데로 정렬하기 위해 width 값을 꼭 줘야한다.  */
 		text-align: center;
 		margin: 0 auto; /* DIV 태그가 가운데로 온다. 외우기~~!! */
 		padding: 20px 0;
 	}
 	
 	#logo {
 		margin-top: 150px;
 	}

</style>
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript"></script>
</head>
<body>

	<div>
		<div id = "logo">
			<a href="BrandIndex">
				<div id = "main_logo">
					<span class="logo_span">★LOL COLOR ★</span>
				</div>
			</a>
		</div>
		<c:forEach items="${mName}" var="mName">
			<div class="welcome">${mName}회원님 가입을 환영합니다.</div>
		</c:forEach>
		<p class="p_welcome">3초뒤 메인페이지로 이동합니다.</p>
	</div>
</body>
</html>