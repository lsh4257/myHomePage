<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- prefix="c" 변수를 c로 선언하겠다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
<style>
	body, div {
		margin: 0px;
		padding: 0px;
	}
	
	tr, td {
		padding: 8px 0;
	}
	
	select {
		width: 200px;
		height: 25px;
	}
	
	img {
		border: none;
	}
	
	
	.nav {
		width: 100%;
	}
	
	.nav_ctn {
		width: 1200px;
		height: 1500px;
		border: 1px solid;
		margin: 0 auto;
		padding-top: 50px;
	}
	
	.img_area {
		border: 1px solid blue;
		margin-left: 48px;
		width: 500px;
		height: 500px;
		display: inline-block;
		float: left;
	 }
	
	.img_area > img {
		width: 400px;
		height: 400px;
		display: inline-block;
		margin: 50px 50px;
	}
	
	.d_info {
		border: 1px solid green;
		margin-left: 0px;
		width: 600px;
		height: 600px;
		float: left;
		position: relative;
	}
	
	.d_info > table {
		border: 1px solid red;
		width: 500px;
		text-align: left;		
		margin: 0 auto;
	}
	
	.d_info > div {
		width: 300px;
		margin: 0 auto;
		text-align: left;
	}
	
	.d_info > div > h3 {
		text-align: center;
	}
	
	.table_order >td {
		width: 50px;
	}
	
</style>

</head>
<body>
	<%@include file="header.jsp" %>
	<div class="nav">
<c:forEach items="${bestDetail}" var="bDetail">
		<div class="nav_ctn">
			<div class="img_area">
				<img src="img/${bDetail.p_img}">
			</div>
			
			<div class="d_info">
				<div>
					<h3>${bDetail.p_name}</h3>
				</div>
				<table>
					<tr>
						<th>소비자가</th>
						<td>32,000원</td>
					</tr>
					<tr>
						<th>판매가</th>
						<td>${bDetail.p_price2}원</td>
					</tr>
					<tr>
						<th>상품코드</th>
						<td>${bDetail.p_code}</td>
					</tr>
				</table>
				<table>
					<tr>
						<th>색상</th>
						<td>
							<select>
								<option value="">[필수] 옵션을 선택해주세요</option>
								<option value="">-------------------------------</option>
								<option value="">블랙</option>
								<option value="">브라운</option>
								<option value="">코발트블루</option>
								<option value="">아이보리</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>사이즈</th>
						<td>
							<select>
								<option value="">[필수] 옵션을 선택해주세요</option>
								<option value="">-------------------------------</option>
								<option value="">80</option>
								<option value="">85</option>
								<option value="">90</option>
								<option value="">95</option>
							</select>
						</td>
					</tr>	
				</table>
	
				<table class="table_order">
					<tr>
						<td><span>최소주문수량 1개</span></td>
					</tr>
					<tr>
						<td><span>색상 선택후 사이즈를 입력해주세요</span></td>
					</tr>
					<tr>
						<td>상품</td>
						<td>주문수량</td>
						<td></td>
					</tr>
					<tr>
						<td>${bDetail.p_name}</td>
						<td><input value="1" size="3"></td>
						<td><a href=""><img src="img/btn_count_up.gif" alt="업"></a><br>
						<a href=""><img src="img/btn_count_down.gif" alt="다운"></a>
						<a href=""><img src="img/btn_price_delete.gif" alt="삭제"></a></td>
					</tr>
					<tr>
						<td><span>총 상품금액(수량) : 0원(0개)</span></td>
					</tr>
				</table>
			</div>
		</div>		
</c:forEach>
	</div>
</body>
</html>