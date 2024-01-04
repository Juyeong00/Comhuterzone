<%@page import="db.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container{
	display:flex;
	flex-direction:column;
	align-items:center;
}

.product{
	display:flex;
	margin:5px;
	margin-top:15px;
	border-bottom: 1px solid;	
}
.pro-content{
	width:500px;
	height:50px;
}
.pro-info{
	margin-left:15px;
}
.putBtn, .buyBtn{
	width:65px;
	height:25px;
	background: inherit;
	border:1px solid black;
	box-shadow:none;
	overflow:visible;
	cursor:pointer;
}
.empty{
	font-size: 28px;
	margin-top: 130px;
}
</style>
</head>
<body>
	<%@ include file="homewrap.jsp" %>
	<%@ include file="navigation.jsp" %>
	<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	
	System.out.println(name);
	
	GoodsDAO goodsDAO = new GoodsDAO();
	List<GoodsDTO> goodsList = goodsDAO.findGoodsListByName(name);
	
	%>
	<div class="container">
	<h1 style="margin-top:10px;">검색어: <%=name %></h1>
	<% 
	if(goodsList.isEmpty()){
	%>
    <div class="empty">검색 결과가 없습니다</div>
    <%
    }else{
    %>
	<%
	for (GoodsDTO good : goodsList) {
	%>
	
	<div class="product">
		<div class="pro-content">
		<span>
		<a href="./goodsList_proc.jsp?id=<%=good.getId()%>"><%=good.getName()%> <%=good.getPrice() %>원 <%=good.getQuantity() %>개 남음</a>
		</span>
		</div>

		<div class="pro-info">
		<input style="width:40px; height:25px;" type="number" data-id="<%=good.getId()%>" min="1" max="999" value="1">
		<button class="putBtn" type="button" data-id="<%=good.getId()%>">장바구니</button>
		<button class="buyBtn" type="button" data-id="<%=good.getId()%>">구매하기</button>
		
		</div>
		
	</div>
	<input type="hidden" class="pdQuan" data-id="<%=good.getId()%>" data-value="<%=good.getQuantity() %>">
	<%
	}
	%>
	<%
	}
	%>
	</div>
</body>
</html>