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

	<%
	
	SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");
	
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
	<button class="deleteBtn" type="button" data-id="<%=cart.getCart_id()%>">삭제하기</button>
	<%
	}
	%>




</body>
</html>