<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
a{
	text-decoration-line: none;
	color: black;
}
.header{
	
}
.logo{
	width:100%;
	height:70px;
	font-size:45px;
	font-weight : bold;
	display:flex;
	justify-content: center;
}
.nav {
	height: 50px;
	display: flex;
	background-color: black;
}

.category {
	display: flex;
	width: 100%;
	height: auto;
	list-style-type: none;
	flex-grow: 1;
	justify-content: space-evenly;
	margin-left: 50px;
	margin-right: 50px;
}

.category>li {
	float: left;
	width: 100px;
	line-height: 50px;
	text-align: center;
	position: relative;
	
}

.category>li:hover .category2 {
	left: 0;
	border: 1px solid black;
}

.category>li a {
	display: block;
}

.category>li a:hover {
	background: #BDBDBD;
	color: white;
	font-weight: bold;
}

.category2 {
	position: absolute;
	top: 50px;
	left: -9999px;
	background: white;
	width: 120%;
	list-style-type: none;
	padding-left: 0;
}

.category2>li {
	position: relative;
}

.category2>li:hover .category3 {
	left: 100%;
	width: 160px;
	border: 1px solid black;
}

.category2>li a, .category3>li a {
	border-radius: 10px;
	margin: 10px;
}

.category3 {
	position: absolute;
	top: 0;
	background: white;
	width: 80%;
	left: -9999px;
	list-style-type: none;
	padding-left: 0;
	/*left: 100%;*/
	/*display: none;*/
}

.category3>li a:hover {
	background: #BDBDBD;
	color: #fff;
}

</style>
</head>
<body>
 
	<div class="header">
		<div class="logo"><a href="./main.jsp">COMHUTERZONE</a></div>
		
	</div>
	<div class="nav">
		<ul class="category">

			<li><a href="./goodsList.jsp?id=1" style="color:white;">데스크탑</a>
				<ul class="category2">
					<li><a href="./goodsList.jsp?id=101">프리미엄PC</a>
						<ul class="category3">
							<li><a href="./goodsList.jsp?id=1001">프리미엄5</a></li>
							<li><a href="./goodsList.jsp?id=1002">프리미엄7</a></li>
							<li><a href="./goodsList.jsp?id=1003">프리미엄9</a></li>
						</ul></li>
					<li><a href="./goodsList.jsp?id=102">추천조립PC</a>
						<ul class="category3">
							<li><a href="./goodsList.jsp?id=1004">사무용추천PC</a></li>
							<li><a href="./goodsList.jsp?id=1005">게이밍추천PC</a></li>
							<li><a href="./goodsList.jsp?id=1006">이미지/영상편집</a></li>
						</ul></li>
					<li><a href="./goodsList.jsp?id=103">미니PC</a>
						<ul class="category3">
							<li><a href="./goodsList.jsp?id=1007">베어본/미니PC</a></li>
							<li><a href="./goodsList.jsp?id=1008">산업용PC</a></li>
							<li><a href="./goodsList.jsp?id=1009">스틱PC/기타</a></li>
						</ul></li>
				</ul></li>
			<li><a href="./goodsList.jsp?id=2" style="color:white;">노트북</a>
				<ul class="category2">

					<li><a href="./goodsList.jsp?id=104">삼성</a></li>
					<li><a href="./goodsList.jsp?id=105">LG</a></li>
					<li><a href="./goodsList.jsp?id=106">HP</a></li>
					<li><a href="./goodsList.jsp?id=107">레노버</a></li>
				</ul></li>
			<li><a href="./goodsList.jsp?id=3" style="color:white;">컴퓨터 부품</a>
				<ul class="category2">
					<li><a href="./goodsList.jsp?id=108">CPU</a>
						<ul class="category3">
							<li><a href="./goodsList.jsp?id=1010">AMD CPU</a></li>
							<li><a href="./goodsList.jsp?id=1011">인텔정품</a></li>
							<li><a href="./goodsList.jsp?id=1012">서버 CPU</a></li>
						</ul></li>
					<li><a href="./goodsList.jsp?id=109">메인보드</a>
						<ul class="category3">
							<li><a href="./goodsList.jsp?id=1013">AMD 소켓</a></li>
							<li><a href="./goodsList.jsp?id=1014">인텔 소켓</a></li>
							<li><a href="./goodsList.jsp?id=1015">산업용 메인보드</a></li>
						</ul></li>
					<li><a href="./goodsList.jsp?id=110">메모리</a>
						<ul class="category3">
							<li><a href="./goodsList.jsp?id=1016">PC용</a></li>
							<li><a href="./goodsList.jsp?id=1017">노트북용</a></li>
							<li><a href="./goodsList.jsp?id=1018">서버용</a></li>
							<li><a href="./goodsList.jsp?id=1019">고성능 게임용 메모리</a></li>
						</ul></li>
					<li><a href="./goodsList.jsp?id=111">그래픽카드</a>
						<ul class="category3">
							<li><a href="./goodsList.jsp?id=1020">NVDIA 그래픽카드</a></li>
							<li><a href="./goodsList.jsp?id=1021">AMD 그래픽카드</a></li>
							<li><a href="./goodsList.jsp?id=1022">INTEL 그래픽카드</a></li>
						</ul></li>
				</ul></li>

		</ul>
	</div>
	
	

</body>
</html>