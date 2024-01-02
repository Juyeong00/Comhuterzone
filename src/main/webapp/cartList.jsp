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
</head>
<body>
	<%@ include file="homewrap.jsp" %>
	<%

	System.out.println(loggedInMember.getId());
	
	CartDAO cartDAO = new CartDAO();
	List<CartDTO> cartList = cartDAO.findCartList(loggedInMember.getId());
	
	%>
	
	<%@ include file="navigation.jsp" %>
	<h2>장바구니</h2>
	<%
	for (CartDTO cart : cartList) {
	%>

	<p>
	<a href="./goodsList_proc.jsp?id=<%=cart.getGoods_id()%>"><%=cart.getName()%> <%=cart.getQuantity()%> <%=cart.getPrice()%></a>
	</p>
	<button class="delBtn" type="button" data-id="<%=cart.getCart_id()%>">삭제하기</button>
	<%
	}
	%>

	<form id="goodsForm" action="goods_proc.jsp" method="post">
	<input type="hidden" id="goodsId" name="id" value="">
	</form>
	
	<script>

	let delArray = Array.from(document.getElementsByClassName('delBtn'));

	delArray.forEach((delBtn) => {
		delBtn.addEventListener('click', () => {
			let form = document.getElementById('goodsForm');
  			let inputId = document.getElementById('goodsId');
		  
		  	let valueid = delBtn.dataset['id'];
		  	
		  	inputId.value = valueid;
		  	
		  	form.action = 'deleteCart_proc.jsp';
		  	form.submit();
		  	
		});
	});
		
  
	</script>

</body>
</html>