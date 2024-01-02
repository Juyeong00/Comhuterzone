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
	
	CartDAO cartDAO = new CartDAO();
    int result = 0;
	
	 if (loggedInMember != null) {
         CartDTO cart = new CartDTO(loggedInMember.getId(), intId, intCount);
         result = cartDAO.saveCartInfo(cart);
     }
	 
	 request.setAttribute("result", result);
	%>
	
	
	 <script>
	
     var loggedInMember = <%= (loggedInMember != null) ? "true" : "false" %>;
     var result = <%= request.getAttribute("result") %>;

     console.log(loggedInMember);
     console.log(result);

     if (loggedInMember && result > 0) {
         alert('장바구니에 담았습니다');
         location.href = 'cartList.jsp';
     } else if (loggedInMember && result <= 0) {
         alert('장바구니에 담지 못하였습니다');
         history.back();
     } else {
         alert('로그인 후 이용가능합니다');
         history.back();
     }
     
        
    </script>
</body>
</html>