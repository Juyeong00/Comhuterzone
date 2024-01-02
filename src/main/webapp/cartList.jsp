<%@page import="java.util.List"%>
<%@page import="db.dto.CartDTO"%>
<%@page import="db.dao.CartDAO"%>
<%@page import="db.dto.SignUpDTO"%>
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
	flex-direction: column;
	align-items:center;
}
.product{
	display:flex;
	margin:5px;
	margin-top:15px;
	border-bottom: 1px solid;	
}
.pro-content{
	width:650px;
	height:50px;
}
.delBtn{
	width:65px;
	height:25px;
	background: inherit;
	border:1px solid black;
	box-shadow:none;
	overflow:visible;
	cursor:pointer;
}
</style>

</head>
<body>
	<%@ include file="homewrap.jsp" %>
	<%@ include file="navigation.jsp" %>
	<%

	System.out.println(loggedInMember.getId());
	
	CartDAO cartDAO = new CartDAO();
	List<CartDTO> cartList = cartDAO.findCartList(loggedInMember.getId());
	
	%>
	<div class="container">
	<h1 style="margin-top:10px;">장바구니</h1>
	<%
	for (CartDTO cart : cartList) {
	%>
	<div class="product">
		<div class="pro-content">
		<a href="./goodsList_proc.jsp?id=<%=cart.getGoods_id()%>"><%=cart.getName()%> <%=cart.getQuantity()%> <%=cart.getPrice()%></a>
		</div>
		
		<div class="delbtn">
		<button class="delBtn" type="button" data-id="<%=cart.getGoods_id()%>">삭제하기</button>
		</div>
	</div>
	<%
	}
	%>

	<form id="goodsForm" action="goods_proc.jsp" method="post">
	<input type="hidden" id="cartId" name="id" value="">
	<input type="hidden" id="goodsId" name="id" value="">
	</form>
	</div>
	<script>

	let delArray = Array.from(document.getElementsByClassName('delBtn'));

	delArray.forEach((delBtn) => {
		delBtn.addEventListener('click', () => {
			let form = document.getElementById('goodsForm');
  			let inputId = document.getElementById('cartId');
		  
		  	let valueid = delBtn.dataset['id'];
		  	
		  	inputId.value = valueid;
		  	
		  	form.action = 'deleteCart_proc.jsp';
		  	form.submit();
		  	
		});
	});
		
  
	</script>

</body>
</html>