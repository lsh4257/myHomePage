<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body, h1, ul, p, h3{
		margin: 0px;
		padding: 0px;
	}
	
	body {
		background-color: #f5f6f7;
	}
	
	#contract_header {
		width: 768px;
		margin: 0 auto;
		box-sizing: border-box;
		/* border: 1px solid red; */
		
		height: 169px;
		padding-top: 62px;
		position: relative;
	}
	
	.n_logo {
		display: block;
		width: 240px;
		height: 44px;
		background: url('img/pc_sp_join.png') 0-106px;
		margin: 0 auto;
		box-sizing: border-box; /*가로 세로 길이를 고정하는것이다   */
		/* border: 1px solid blue; */
	}
	
	.lang {
		position: absolute;
		top: 14px;
		right: 0px;
	}
	
	#langselect {
		font-size: 12px;
		font-weight: 400;
		height: 30px;
		padding: 6px 8px 5px 7px;
		min-width: 98px;
		color: #333;
		border: 1px solid #ccc;
		line-height: 17px;
	}
	
	.lang > select {
		background: url('img/sel_arr.gif') 100% 50% no-repeat;
		width: 98px;
		height: 30px;
		background-color: white;
		-webkit-appearance: none; /*웹에 이미 등록되있는걸 안쓰겠다 */
	}
	
	
	



	#contract_container {
		width: 768px;
		margin: 0 auto;
		box-sizing: border-box;
		position: relative;
		/* border: 1px solid blue; */
	}
	
	#join_content {
		width: 460px!important;
		margin: 0 auto!important;
	}
	
	.terms {
		margin-bottom: 20px;
		background-color: white;
		border: 1px solid #dadada;
	}
	
	.terms_p {
		display: block;
		padding: 15px;
		margin: 0px;
		position: relative;
	}
	
	.terms_span {
		position: relative;
		display: block;
		height: 58px;
	}
	
	.terms_span >input {
		position: absolute;
		right: 1px;
		top: 50%;
		width: 22px;
		height: 22px;
		margin-top: -11px;
		visibility: hidden; 
	}
	
	.terms_span >label {
		background: url('img/check_off.png') 100% 50% no-repeat;
		display: block;
		line-height: 20px;
		height: 58px;
		top: -1px;
		font-size: 14px;
		font-weight: 700;
	}
	
	.terms_span >input:checked + label {  /*checked--> 체크가 됐으면 true 를 반환  */
		background-image: url('img/check_on.gif');
	}
	
	#terms_ul {
		padding-bottom: 7px;
		list-style: none;
	}
	
	#terms_ul_li1 {
		border-top: 1px solid #f0f0f0;
	}
	
	#terms_ul >li {
		display: block;
		padding: 13px 15px 7px;
		 
	}
	
	.ul_li_span {
		position: relative;
		display: block;
		height: 24px;
	}
	
	.label1 {
		height: 24px;
		font-size: 14px;
		font-weight: 700;
		line-height: 24px;
		position: absolute;
		color: #333;
		top: 0px;
		left: 0px;
		width: 100%;
	}
	
	.span_only {
		color: #0d9900;
		font-size: 12px;
		font-weight: 400;
	}
	
	.ul_li_span > input {
		visibility: hidden;
		position: absolute;
		right: 1px;
		width: 22px;
		height: 22px;
		top: 50%;
		margin-top: -11px;
	}
	
	.ul_li_span > label{
		background: url('img/check_off.png') 100% 50% no-repeat;
		display: block;
	}
	
	.ul_li_span > input:checked + label {
		background-image: url('img/check_on.gif');
	}
	
	.terms_box {
		position: relative;
		box-sizing: border-box;
		height: 88px;
		margin-top: 11px;
		padding: 8px 10px;
		border: 1px solid #f0f0f0;
		background-color: #f7f7f7;
		overflow: auto;
	}
	
	.article {
		margin-top: 0px;
	}
	
	.article_title {
		font-size: 12px;
		font-weight: 700;
		line-height: 15px;
		color: #666;
	}
	
	.article >p {
		display: block;
		font-size: 12px;
		line-height: 16px;
		color: #666;
	}
	
	.span_select{
		color: #969696;
		font-size: 12px;
		font-weight: 400;
	}
	
	.btn_double_area {
		margin: 30px -5px 0px;
		overflow: hidden;
		
	}
	
	.btn_double_area >span {
		display: block;
		float: left;
		width: 50%;
	}
	
	.btn_type {
		width: auto;
		margin: 0px 5px;
		font-size: 20px;
		font-weight: 600;
		line-height: 61px;
		display: block;
		box-sizing: border-box;
		height: 61px;
		padding-top: 1px;
		text-align: center;
	
	}
	
	a {
		text-decoration: none;
		color: inherit; /* 바로 위에있는태그 색깔을 그대로 가져와라  */
	}
	
	.btn_default {
		color: #333;
		border: 1px solid #e7e7e7;
		background-color: #fff;
	}
	
	.btn_agree {
		color: #fff;
		border: 1px solid #1fbc02;
		background-color: #1fbc02;
	}
	
	.group_join {
		margin: 20px 0px 65px;
		text-align: center;
		color: #666;
		font-size: 12px;
	}
	
	.group_join >a {
		text-decoration: underline;
		color: #333;
	}
	
	.error {
		display: none;
		font-size: 12px;
		color: red;
		margin: 1px 0 3px 0;
	}
	
	
	/*footer  */
	#footer {
		padding: 15px 0;
	}
	
	#footer * {
		font-size: 11px;
		line-height: normal;
		list-style: none;
		color: #333;
	}
	#footer > ul {
		margin: 0 auto 9px;
		text-align: center;
	}
	
	#footer > ul > li {
		display: inline; /*또는 float: left  */
		border-left: 1px solid #DADADA;
		padding: 0 5px 0 7px;
	}
	
	#footer > ul > li:FIRST-CHILD { /* footer의 ul의 li의 첫번째 li를 없애준다 */
		border-left: 0px!important;	
}
	#footer > ul > li a:HOVER {
		color: #1fbc02;
		text-decoration: underline;
}	

	#addr_logo {
		width: 63px;
		height: 11px;
	}
	
	#address {
		margin: 0px auto;
		text-align: center;
	}
	
	#address * {
		font: 9px verdana;
	}
	
	#address a{
		font-weight: bold;
	}
	
	#address a:HOVER {
		color: #1fbc02;
		text-decoration: underline;
	}..
	
	
</style>
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
/* javascript 방법  */
/* function allChecked(){
	var cVal = document.getElementById("cbox").checked;
	
	if(cVal == true){
		document.getElementById("li1box").checked=true;
		document.getElementById("li2box").checked=true;
		document.getElementById("li3box").checked=true;
		document.getElementById("li4box").checked=true;
	
	} else if(cVal== false){
		document.getElementById("li1box").checked=false;
		document.getElementById("li2box").checked=false;
		document.getElementById("li3box").checked=false;
		document.getElementById("li4box").checked=false;
	}
} */

/*javascript checked 초기화 메서드 */
	function ckeckClean(){
		document.getElementById("cbox").checked=false;
		document.getElementById("li1box").checked=false;
		document.getElementById("li2box").checked=false;
		document.getElementById("li3box").checked=false;
		document.getElementById("li4box").checked=false;
	};

	/* 체크박스 전체 동의 및 해제 */
		$(document).ready(function(){
		$("#cbox").click(function(){
			var cVal = $('input:checkbox[id="cbox"]').is(":checked");
			if(cVal == true){
			$('input:checkbox[id="li1box"]').prop("checked", true);
			$('input:checkbox[id="li2box"]').prop("checked", true);
			$('input:checkbox[id="li3box"]').prop("checked", true);
			$('input:checkbox[id="li4box"]').prop("checked", true);
		
			} else if(cVal == false){
			$('input:checkbox[id="li1box"]').prop("checked", false);
			$('input:checkbox[id="li2box"]').prop("checked", false);
			$('input:checkbox[id="li3box"]').prop("checked", false);
			$('input:checkbox[id="li4box"]').prop("checked", false);
		
		}
		
	});

	/* 필수 동의 체크여부  */
	$(document).on("click", "#btn_agree", function(){
		var form = $("#join_content");
			ckbox1 = $('input:checkbox[id="li1box"]').is(":checked"),
			ckbox2 = $('input:checkbox[id="li2box"]').is(":checked");
		
			if(ckbox1 == false || ckbox2 == false){ 
			$(".error").css("display", "block");
				return false;		
		/* 	}else if(ckbox1 != false && ckbox2 != false){
				$(".error").css("display", "none");
			 */
			}
			
			
	 	ckeckClean(); /* 전에 체크했던 값을 제거  */
		form.submit();
	});

});
	

</script>
</head>
<body>
	<div id = "contract_header">
		<h1 id="naver_logo"><a href="http://www.naver.com" class="n_logo"></a></h1>
		<div class="lang">
			<select id="langselect">
				<option>한국어</option>
				<option>English</option>
				<option>中文(简体)</option>
				<option>中文(台灣)</option>
			</select>
		</div>
	</div>
	
	
	
	
	<div id="contract_container">
		<form id="join_content" name="join_content" action = "memeberAdd.jsp"  method = "post">
			<div class="terms">
				<p class="terms_p">
					<span class="terms_span">
						<input type="checkbox" id="cbox" onclick="allChecked()">
						<label for="cbox">
						이용약관, 개인정보 수집 및 이용,<br>
						위치정보 이용약관(선택), 프로모션 안내<br>
						메일 수신(선택)에 모두 동의합니다.
						</label>
					</span>
				</p>
				
				<ul id="terms_ul">
					<li id="terms_ul_li1">
						<span class="ul_li_span">
							<input type="checkbox" id="li1box">
							<label for="li1box" class="label1">
							네이버 이용약관 동의<span class="span_only">(필수)</span>
							</label>
						</span>
						
						<div class="terms_box">
							<div class="article">
							<h3 class="article_title">제 1조 (목적)</h3>
							<p>이 약관은 네이버 주식회사 ("회사" 또는 "네이버")가 제공하는 네이버<br> 
							및 네이버 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, <br>
							의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
							
							<h3 class="article_title">제 2 조 (정의)</h3>
							<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
							①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선
							 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 네이버 및 네이버 관련 제반 서비스를 의미합니다.</p>
							</div>
						</div>
					</li>
					
					
					<li id="terms_ul_li2">
						<span class="ul_li_span">
							<input type="checkbox" id="li2box">
							<label for="li2box" class="label1">
							네이버 이용약관 동의<span class="span_only">(필수)</span>
							</label>
						</span>
						
						<div class="terms_box">
							<div class="article">
							<p>정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하<br>
							는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및<br>
							이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
							
							<h3 class="article_title">1. 수집하는 개인정보</h3>
							<p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네<br>
							이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘<br>
							린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위<br>
							해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의<br>
							 개인정보를 수집합니다.</p>
							</div>
						</div>
					</li>
					
					
					
					<li id="terms_ul_li3">
						<span class="ul_li_span">
							<input type="checkbox" id="li3box">
							<label for="li3box" class="label1">
							네이버 이용약관 동의<span class="span_select">(선택)</span>
							</label>
						</span>
						
						<div class="terms_box">
							<div class="article">
							<p>위치정보 이용약관에 동의하시면,<strong>위치를 활용한 광고 정보 수신</strong> 등을
							 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.</p>
							
							<h3 class="article_title">제 1 조 (목적)</h3>
							<p>이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 
							위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리,
							의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
							</div>
						</div>
					</li>
					
					
					<li id="terms_ul_li4">
						<span class="ul_li_span">
							<input type="checkbox" id="li4box">
							<label for="li4box" class="label1">
							이벤트 등 프로모션 알림 메일 수신<span class="span_select">(선택)</span>
							</label>
						</span>			
					</li>			
				</ul>
					<span class="terms_p error" >네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요</span>
			</div>
		
			<div class="btn_double_area">
				<span><a href="BrandIndex" class="btn_type btn_default">비동의</a></span>
				<span><a href="#" class="btn_type btn_agree" id="btn_agree">동의</a></span>
			</div>
		</form>
		
		<div class="group_join">
		회사, 동아리 등 단체에서 사용할 ID가 필요하세요?<a href="#">단체 회원 가입</a>
		</div>
	</div>
	
	
	<footer>
		<div id ="footer">
			<ul>
				<li><a href="#">이용약관</a></li>
				<li><strong><a href="#">개인정보처리방침</a></strong></li>
				<li><a href="#">책임의 한계와 법적고지</a></li>
				<li><a href="#">회원정보 고객센터</a></li>
			</ul>
			
			<div id = "address">
				<span><a href = "https://www.naver.com">
					<img id = "addr_logo" src = "img/naver_logo.png" alt = "네이버 로고"></span>
				</a>
				
				<span>Copyright</span>
				<span><strong><a href="#">©NAVER Corp.</a></strong></span>
				<span>All Rights Reserved.</span>
			</div>
			
		</div>
	</footer>

</body>
</html>