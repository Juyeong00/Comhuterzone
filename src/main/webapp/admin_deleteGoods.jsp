<%@page import="db.dao.GoodsDAO"%>
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
	
	String id = request.getParameter("id");
	System.out.println("삭제할 제품 id : " + id);
	int intId = Integer.parseInt(id);
	
	GoodsDAO goodsDAO = new GoodsDAO();
	int result = goodsDAO.removeGoodsById(intId);
	
	if(result > 0){
	%>
	<script>
		alert('삭제하였습니다');
		location.href = 'admin_goodsList.jsp';
	</script>
	<%
	} else {
	%>
	<script>
		alert('삭제에 실패하였습니다');
		history.back();
	</script>
	<%	
	}
	%>
</body>
</html>