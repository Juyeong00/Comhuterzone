<%@page import="java.util.List"%>
<%@page import="db.dto.GoodsDTO"%>
<%@page import="db.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.title{
	width: 100%;
	height: 150px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 145px;
	display:flex;
	justify-content:center;
}
a{
	text-decoration-line: none;
}
.setbtn{
	width:75px;
	heihgth:30px;
	color:black;
	text-decoration-line: none;
	border:1px solid black;
	margin:5px;
}
.container{
	display:flex;
	flex-direction:column;
	text-align:center;
}
.pro-header{
	display:flex;
	width:100%;
	height:30px;
	border-bottom: 1px solid black;
}
.pro-content{
	display:flex;
	width:100%;
	height:auto;
	margin:5px;
	border-bottom: 1px solid black;
}

.pro-id{
	width:50px;
}
.pro-name{
	width:200px;
}
.pro-price{
	width:100px;
}
.pro-quan{
	width:50px;
}
.pro-con{
	width:700px;
}
.pro-date{
	width:90px;
}
.pro-caId{
	width:150px;
}
.pro-setting{
	width:120px;
}
.set{
	display:flex;
	flex-direction:column;
}
.addbox{
	width:100px;
	height:100px;
	cursor:pointer;
}
.bold{
	font-weight:bold;
	font-size:25px;
	margin-left:80px;
}
</style>
</head>
<body>
	<%
	GoodsDAO goodsDAO = new GoodsDAO();
	List<GoodsDTO> goodsList = goodsDAO.findGoodsList();
	%>
	<div class="title">
		<a class="bold" href="admin.jsp" style="color:white;">제품 리스트</a>
		<span class="addbox"><a style="color:#525d76; user-select: none;"href="admin_addGoods.jsp">제품추가하기</a></span>
	</div>
	<div class="container">
		<div class="pro-header">
			<div class="pro-id">ID</div>
			<div class="pro-name">이름</div>
			<div class="pro-price">가격</div>
			<div class="pro-quan">수량</div>
			<div class="pro-con">내용</div>
			<div class="pro-date">등록일자</div>
			<div class="pro-caId">카테고리ID</div>
			<div class="pro-setting">설정</div>
		</div>
	
	<% 
	for(GoodsDTO goods : goodsList){		
	%>
	<div class="pro-content">
		<div class="pro-id"><%=goods.getId()%></div>
		<div class="pro-name"><%=goods.getName()%></div>
		<div class="pro-price"><%=goods.getPrice()%></div>
		<div class="pro-quan"><%=goods.getQuantity()%></div>
		<div class="pro-con"><%=goods.getContent()%></div>
		<div class="pro-date"><%=goods.getRegist_date()%></div>
		<div class="pro-caId"><%=goods.getCa_id()%></div>
		<div class="pro-setting">
		<div class="set">
		<a class="setbtn" href="./admin_modifyGoods.jsp?id=<%=goods.getId()%>">수정</a>
		<a class="setbtn" href="./admin_deleteGoods.jsp?id=<%=goods.getId()%>">삭제</a>
		</div>
		</div>
	</div>
	<%
	}
	%>
	
	</div>
</body>
</html>