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
}
a{
	text-decoration-line: none;
}

</style>
</head>
<body>
	<h2 class="title"><a href="admin.jsp" style="color:white;">제품 리스트</a></h2>
	
	<%
	GoodsDAO goodsDAO = new GoodsDAO();
	List<GoodsDTO> goodsList = goodsDAO.findGoodsList();
	%>
	<div class="container">
		<div class="pro-id"></div>
		<div class="pro-name"></div>
		<div class="pro-id"></div>
		<div class="pro-id"></div>
		<div class="pro-id"></div>
		<div class="pro-id"></div>
		<div class="pro-id"></div>
	</div>
	
</body>
</html>