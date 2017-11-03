<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- prefix="c" 변수를 c로 선언하겠다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	body, div{
		margin: 0px;
		padding: 0px;
	}
	
	h3 {
		margin: 0px;
	}
	img {
		width: 225px;
		height: 225px;
	}
	
	a {
		text-decoration: none;
	}
	
 	.pdt_item {
		margin: 0px 10px;
		float: left;
	} 
	
	.item_list {
		clear: both;
	}
	
	.bp_info {
		
	}
	
	.bp_info:HOVER {
		
	}
	
	.np_info {
		
	}
	
	.np_info:HOVER {
		
	}
	
</style>
<body>
<%@include file="header.jsp" %>
	<div class="item_list">
			<h3>Best Item</h3>
			<hr>
		<c:forEach items="${bestList}" var="bestProduct">
			<div class="pdt_item">
				<a href="ProductDetail?bestCode=${bestProduct.p_code}">
				<!-- p_code 값을 받아서 상세정보페이지로 가기위함   -->
					<img src="img/${bestProduct.p_img}" alt="베스트상품">
					<div class= "wrap_info">
						<span class="bp_info">${bestProduct.p_name}</span><br>
						<span class="bp_info">
							<fmt:setLocale value="ko_kr"/> <!-- ko_kr, en_us, ja_jp   -->
							<fmt:formatNumber value="${bestProduct.p_price2}" type="currency" />
						</span>
						<%-- <span class="bp_info">${bestProduct.p_price2}</span> --%>
					</div>
				</a>
		</div>
		</c:forEach>
	</div>

	<div class="item_list">
		<h3>New Item</h3>
		<hr>
		<c:forEach items="${newList}" var="newProduct">
			<div class="pdt_item">
				<a href="ProductDetail?newCode=${newProduct.p_code}">
				<!-- p_code 값을 받아서 상세정보페이지로 가기위함   -->
					<input type="hidden" name="newCode" value="${newProduct.p_code}"> 
					<img src="img/${newProduct.p_img}" alt="신상품">
					<div class= "wrap_info">
						<span class="np_info">${newProduct.p_name}</span><br>
						<span class="np_info">
							<fmt:setLocale value="ko_kr"/>
							<fmt:formatNumber value="${newProduct.p_price2}" type="currency" />
						</span>
					</div>
				</a>
		</div>
		</c:forEach>
	</div>
</body>
</html>