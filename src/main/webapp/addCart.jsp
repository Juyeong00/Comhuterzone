<%@page import="db.dto.CartDTO"%>
<%@page import="db.dto.SignUpDTO"%>
<%@page import="db.dao.CartDAO"%>
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
	
	String goods_id = request.getParameter("id");
	String count = request.getParameter("count");
	System.out.println("제품id: " + goods_id);
	System.out.println("수량: " + count);
	System.out.println(loggedInMember.getId());
	
	int intId = 0;
	try {
		intId = Integer.parseInt(goods_id);
	} catch (Exception e) {
		e.printStackTrace();
		intId = 0;
	}
	
	int intCount = 1;
	try {
		intCount = Integer.parseInt(count);
	} catch (Exception e) {
		e.printStackTrace();
		intCount = 1;
	}
	System.out.println(loggedInMember.getName());
	CartDAO cartDAO = new CartDAO();
	CartDTO cart = new CartDTO(loggedInMember.getId(), intId, intCount);
	
	int result = cartDAO.saveCartInfo(cart);
	
	if(result > 0){
	%>
	<script>
		alert('장바구니에 담았습니다.');
		location.href = 'cartList.jsp'; //해당 경로로 페이지 이동
	</script>
	<%
	}else{
	%>
	<script>
		alert('장바구니에 담지 못하였습니다.');
		//location.href = 'addPerson.jsp'; //해당 경로로 이동
		history.back(); //뒤로가기
	</script>
	<%	
	}
	%>
</body>
</html>