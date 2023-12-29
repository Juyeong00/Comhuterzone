<%@page import="db.dto.GoodsDTO"%>
<%@page import="db.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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

	<%@ include file="navigation.jsp" %>
	<h2><%=goods.getName() %></h2>
	<p><%=goods.getContent() %></p>
	<p><%=goods.getPrice() %>원</p>
	<p><%=go.getQuantity() %>개 남음</p>
	<form id="goodsForm" action="goodsList_proc.jsp" method="post">
		<input type="hidden" name="id" value="<%=goods.getId() %>">
		<input type="hidden" id="pdCnt" name="count1" value="<%=go.getQuantity() %>">
		<input type="number" id="inputCnt" name="count" min="1" max="999" value="1">
		<button id="putBtn" type="button">장바구니</button>
		<button id="buyBtn" type="button">구매하기</button>
	</form>
	
	<script>
		document.getElementById('buyBtn').addEventListener('click', ()=>{
			
			let form = document.getElementById('goodsForm');
			let pdCnt = document.getElementById('pdCnt');
			let inputCnt = document.getElementById('inputCnt');
			
			if(pdCnt.value < inputCnt.value){
				console.log(pdCnt.value)
		  		alert('수량부족')
		  		event.preventDefault();
			} else{
			
				form.action='totalOrder1.jsp';
				form.submit();
			}
		});
		
	</script>
</body>
</html>