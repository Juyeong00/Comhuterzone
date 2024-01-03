<%@page import="db.dto.SignUpDTO"%>
<%@page import="db.dto.GoodsDTO"%>
<%@page import="db.dao.GoodsDAO"%>
<%@ page import="db.dao.TotalOrderDAO" %>
<%@ page import="db.dto.TotalOrderDTO" %>
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
	request.setCharacterEncoding("UTF-8");
    // 전달된 파라미터 받기
	String id = request.getParameter("id"); // personInfo.jsp
	String orderName = request.getParameter("orderName");
	String name = request.getParameter("name");
	String userId = request.getParameter("userId");
	String tel2 = request.getParameter("tel2");
	String count = request.getParameter("count");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String address2 = request.getParameter("address2");
	String card = request.getParameter("card");
	String totalAmountInput = request.getParameter("totalAmountInput");
	String delivery = request.getParameter("delivery");
	String changeTest = request.getParameter("changeTest");
	
	int intCount = Integer.parseInt(count);
	int zipcode1 = Integer.parseInt(zipcode);
	int totalAmountInput1 = Integer.parseInt(totalAmountInput);
	// 입력값을 저장할 DTO 생성

	
	// GoodsDAO를 사용하여 상품 정보 조회
	int intId = 0;
	try{
		intId = Integer.parseInt(id);
	} catch (Exception e){
		e.printStackTrace();
		intId = 0;
	}
	
	// 세션에서 로그인된 회원 정보 조회
	SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");
	
	// TotalOrderDAO를 사용하여 주문 정보 저장
	TotalOrderDAO totalOrderDAO = new TotalOrderDAO();
	GoodsDAO goodsDAO = new GoodsDAO();
	
	int result = totalOrderDAO.saveTotalOrder(orderName, userId, delivery, tel2, zipcode1, address, address2, card, totalAmountInput1 );
	int updateQuantity = goodsDAO.modifyGoodsQuantity(intCount, intId);
	
	if (result > 0) {
		System.out.println(result);
		System.out.println(updateQuantity);
	%>
	
	<form id="orderGoodsForm" action="orderedGoods.jsp" method="post">
	<input type= "hidden" name="name" value="<%=name%>">
	<input type= "hidden" name="count" value="<%=count%>">
	<input type= "hidden" name="totalAmountInput" value=<%=totalAmountInput%>>
	</form>
	
	
	<script>
		let changeTest = document.getElementById("changeTest");
		let form = document.getElementById("orderGoodsForm");
			alert('주문이 성공적으로 저장되었습니다.');
			location.href = 'orderedGoods.jsp'; //해당 경로로 페이지 이동
			form.submit();
			
			
			
		</script>
	<%
		} else {
	%>
		<script>	
			alert('수정 실패');
			//location.href = 'addPerson.jsp'; //해당 경로로 이동
			history.back(); //뒤로가기
		</script>
				
	<% 	
		}
	%>
</body>
</html>
