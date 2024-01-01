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
	
	String id = request.getParameter("id");
	System.out.println("삭제할 제품 id : " + id);
	int intId = Integer.parseInt(id);
	
	CartDAO cartDAO = new CartDAO();
	int result = cartDAO.removeCartById(intId);
	
	if(result > 0){
	%>
	<script>
		alert('삭제 성공');
		location.href = 'cartList.jsp';
	</script>
	<%
	} else {
	%>
	<script>
		alert('삭제 실패');
		history.back();
	</script>
	<%	
	}
	%>
</body>
</html>