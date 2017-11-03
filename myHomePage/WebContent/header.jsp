<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- prefix="c" 변수를 c로 선언하겠다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Wendy+One');
@import url('https://fonts.googleapis.com/css?family=Indie+Flower');
/* header_css  */
	body, ul {
		margin: 0px;
		padding: 0px; 		
	}
	
	a {
		text-decoration: none;
	
	}
	
	#h{
		background-color: #353866;
		height: 30px;
		width: 100%;
		line-height: 30px;
	}
	
	#h_inner {
		width: 570px;
		float: right;
		
	}
	
	#h_ul {
		list-style-type: none;
		margin-right: 20px;
		float: right;
	}
	
	#login_user {
		margin-right: 7px;
		color: white;
	}
	
	
	.h_li {
		float: left;
		text-align: center;
		position: relative;
	}
	
	.h_li2 {
		float: left;
		text-align: center;
		position: relative;
	}
	
	.h_a {
		color: #EFFFE9;
		text-decoration: none;
		font-size: 13px;
		line-height: 30px;
		padding: 0 10px;
		
	}
	
	.h_li:HOVER {
		background-color: #CBA6C3;
}

	.h_li .h_a:HOVER {
		color: #E71D36;
		font-weight: bold;
}

	#bookmark {
		color: white;
		font-size: 13px;
		font-weight: bold;
		line-height: 30px;
		margin-left: 70px;
	}
	
	#h_dropdown {
		width: 75px;
		line-height: 15px;
		padding: 5px;
		display: none;
		position: absolute;
		background-color: #CBA6C3;
	}
	
	.h_dropdown_a {
		width: 75px;
		display: block;
		color: #EFFFE9;
		text-decoration: none;
		font-size: 11px;
		padding-bottom: 5px;
		
	}
	
	.h_dropdown_a:HOVER {
		text-decoration: underline;
		color: #c03546;
		font-weight: bold;
	}
	
	.h_li:HOVER #h_dropdown {
		display: block;
	}


/* nav_css */
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
 
 	#nav {
 		text-align: center;
 		padding-left: 20px;
 		background-color: #AAABD3;
 		height: 50px;
 		line-height: 50px;

 	}
 	
 	#nav_ul {
 		list-style-type: none;
 	}
 	
 	.nav_li {
 		padding: 0 30px;
 		float: left;
 		text-align: center;
 	}
 	
 	#nav_li_best {
 	 width: 35px;
 	}
 	
 	#login
 	
 	
 	.nav_li > a {
 		text-decoration: none;
 		color: white;
 		line-height: 50px;
 		color: white;
 	}
 	
 	.nav_li > a:HOVER {
		color: red;
		font-weight: bold;
}
 
	
</style>
<body>
	<!-- header -->

	<div id = "h">
		<span id = "bookmark">BOOKMARK+</span>
		
	<!-- 로그인, 회원가입이 담겨있는 div -->
		<div id = "h_inner">
			<ul id = "h_ul">

			<c:choose>
				<c:when test="${empty sessionScope.loginUser}">
					<li class = "h_li"><a class = "h_a"href = "loginPage.jsp">로그인</a></li>
					<li class = "h_li"><a class = "h_a"href = "contract.jsp">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li class = "h_li2" id="login_user" class="h_a">${sessionScope.loginUser.s_name}(${sessionScope.loginUser.s_id})님 환영합니다.</li>
					<li class = "h_li"><a class ="h_a" id = "logout_user" href = "MemberLogout">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
				<li class = "h_li"><a class = "h_a"href = "#">마이페이지</a>
					<div id = "h_dropdown">
						<a class = "h_dropdown_a" href ="#">주문/배송조회</a>
						<a class = "h_dropdown_a" href ="#">장바구니</a>
						<a class = "h_dropdown_a" href ="#">위시리스트</a>
						<a class = "h_dropdown_a" href ="#">쿠폰조회</a>
						<a class = "h_dropdown_a" href ="MemberUpdate">회원정보</a>
					</div>
				</li>
				<li class = "h_li"><a class = "h_a"href = "#">고객센터</a></li>
				<li class = "h_li"><a class = "h_a"href = "#">자주하는 질문</a></li>
			</ul>
		</div>
	</div>
	
	<div id = "logo">
		<a href="BrandIndex">
			<div id = "main_logo">
				<span class="logo_span">★LOL COLOR ★</span>
			</div>
		</a>
	</div>
	
	<!-- navigation -->
	<div id="nav">
		<ul id = "nav_ul">
			<li class = "nav_li" id = "nav_li_best"><a href = "#">BEST</a></li>
			<li class = "nav_li"><a href = "#">신상품</a></li>
			<li class = "nav_li"><a href = "#">아우터</a></li>
			<li class = "nav_li"><a href = "#">티셔츠</a></li>
			<li class = "nav_li"><a href = "#">셔츠</a></li>
			<li class = "nav_li"><a href = "#">바지</a></li>
			<li class = "nav_li"><a href = "#">악세사리</a></li>
		</ul>
	</div>
	
</body>
</html>