<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="db.dao.TotalOrderDAO"%>
<%@ page import="db.dto.TotalOrderDTO" %>
<!DOCTYPE html>
<html>
<head>
    
</head>
<body>
    <h2 class="title">주문 처리 상태 변경</h2>
	
	<%
      
	request.setCharacterEncoding("UTF-8");
	TotalOrderDAO totalOrderDAO = new TotalOrderDAO();
	
    %>
    <form id="orderIdForm" action="admin_processStatus_update.jsp" method="post" >
     	<input type= "hidden" id="orderId1" name="orderId" value="">
     	<input type= "hidden" id="newStatus1"name="newStatus" value="">
     	 
    </form>

    
        <label for="orderId">주문 ID: </label>
        <input type="text" name="orderId" id="orderId" value="" required>
        
        <label for="newStatus">새로운 처리 상태:</label>
        <select name="newStatus" id="newStatus2">
            <option value="배송준비중">배송준비중</option>
            <option value="배송중">배송중</option>
            <option value="배송완료">배송완료</option>
            <option value="구매확정">구매확정</option>
            
        </select>
			<input type="button" value="상태변경" onclick="button1()">
        
        
    
    
    <script>
	    function button1(){
		    let form = document.getElementById("orderIdForm");
			let orderId1 = document.getElementById("orderId1");
			let newStatus1 = document.getElementById("newStatus1");
	    	let orderId = document.getElementById("orderId").value;
	    	let newStatus2 = document.getElementById("newStatus2").value;
	    	newStatus1.value = newStatus2;
	    	orderId1.value = orderId;
	    	
			form.action = 'admin_processStatus_update.jsp'; //해당 경로로 페이지 이동
			form.submit();
	    }
		</script>

    
    
</body>
</html>