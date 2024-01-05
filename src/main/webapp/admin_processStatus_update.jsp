<!-- admin_processStatus_update.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="db.dao.TotalOrderDAO"%>
<%@page import="db.dto.SignUpDTO"%>
<!DOCTYPE html>
<html>
<head>
    <!-- head 부분 생략 -->
</head>
<body>
    <%-- 주문 처리 상태 업데이트를 수행하는 부분 --%>
    <%
    	request.setCharacterEncoding("UTF-8");
    
        String orderId = request.getParameter("orderId");
        String newStatus = request.getParameter("newStatus");
        
        
        TotalOrderDAO totalOrderDAO = new TotalOrderDAO();
        String name = request.getParameter("name");
    	String count = request.getParameter("count");
    	String totalAmountInput = request.getParameter("totalAmountInput");
    	String date = request.getParameter("date");
    	
    	SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");
    	int inttotalAmountInput = Integer.parseInt(totalAmountInput);
    	
        int orderId1 = Integer.parseInt(orderId);
        int result = totalOrderDAO.modifyState(newStatus, orderId1);
       	
        
        
        if(result > 0){
        	%>
        	<script>
        		alert('저장 성공');
        		location.href = 'orderedGoods.jsp';
        	</script>
        	<%
        	}else{
        	%>
        	<script>
        		alert('저장 실패');
        		history.back();
        	</script>
        	<%	
        	}
        	%>
        	
		
		<script>
		
			let orderIdForm = document.getElementById("orderIdForm1");
			
			orderIdForm.action = 'orderGoods.jsp'; //해당 경로로 페이지 이동
			orderIdForm.submit();
		</script>
   
</body>
</html>