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
#putBtn, #buyBtn{
	width:65px;
	height:25px;
	background: inherit;
	border:1px solid black;
	box-shadow:none;
	overflow:visible;
	cursor:pointer;
}
.container{
	display:flex;
	flex-direction: column;
	margin-left:20px;
	margin-right:20px;
}
.pro-name{
	margin-top:15px;
}
.pro-content{
	margin-top:15px;
}
.pro-info{
	margin-top:15px;
	display:flex;
}
.pro-price{
	width:150px;
}
</style>
</head>
<body>

	<%@ include file="homewrap.jsp" %>
	<%@ include file="navigation.jsp" %>
	<%
	String id = request.getParameter("id");
	System.out.println(id);
	int intId = 0;
	try {
		intId = Integer.parseInt(id);
	} catch (Exception e) {
		e.printStackTrace();
		intId = 0;
	}

	GoodsDAO goodsDAO = new GoodsDAO();
	GoodsDTO goods = goodsDAO.findDeskDetailById2(intId);
	GoodsDTO go = goodsDAO.findDeskDetailById2(intId);
	%>

	<div class="container">
		<div class="pro-name"><h2><%=goods.getName() %></h2></div>
		<div class="pro-content"><p><%=goods.getContent() %></p></div>
		
		<div class="pro-info">
		
		<div class="pro-price"><span><%=goods.getPrice() %>원 <%=go.getQuantity() %>개 남음</span></div>
		<form id="goodsForm" action="goodsList_proc.jsp" method="post">
			<input type="hidden" name="id" value="<%=goods.getId() %>">
			<input type="hidden" id="pdCnt" name="count1" value="<%=go.getQuantity() %>">
			<input style="width:40px; height:25px;" type="number" id="inputCnt" name="count" min="1" max="999" value="1">
			<button id="putBtn" type="button">장바구니</button>
			<button id="buyBtn" type="button">구매하기</button>
		</form>
		</div>
	</div>
	<script>
		document.getElementById('buyBtn').addEventListener('click', ()=>{
			
			let form = document.getElementById('goodsForm');
			let pdCnt = document.getElementById('pdCnt');
			let inputCnt = document.getElementById('inputCnt');
			
			
		
			if(pdCnt.value < inputCnt.value){
				console.log(pdCnt.value)
		  		alert('남아있는 수량보다 많이 선택하였습니다');
		  		event.preventDefault();
			} else{
			
				form.action='totalOrder1.jsp';
				form.submit();
			}
		  	
		});
		
		document.getElementById('putBtn').addEventListener('click', ()=>{
			
			let form = document.getElementById('goodsForm');
			let pdCnt = document.getElementById('pdCnt');
			let inputCnt = document.getElementById('inputCnt');
			
			
			if(pdCnt.value < inputCnt.value){
				console.log(pdCnt.value)
		  		alert('남아있는 수량보다 많이 선택하였습니다');
		  		event.preventDefault();
			} else{
			
				form.action='addCart.jsp';
				form.submit();
			}
		});
	</script>
</body>
</html>