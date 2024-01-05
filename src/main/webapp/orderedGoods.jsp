<%@page import="db.dto.TotalOrderDTO"%>
<%@ page import="db.dto.GoodsDTO"%>
<%@ page import="db.dao.GoodsDAO"%>
<%@ page import="db.dao.TotalOrderDAO"%>
<%@ page import= "java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container{
	display: flex;
	flex-direction: column;
}
</style>
</head>
<body>
	<%@ include file="homewrap.jsp" %>
	<%@ include file="navigation.jsp" %>

	<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String count = request.getParameter("count");
	String totalAmountInput = request.getParameter("totalAmountInput");

	
	System.out.println(loggedInMember.getId());
	System.out.println(name);
	System.out.println(totalAmountInput);

	int intCount = 0;
	try{
		intCount = Integer.parseInt(count); //예외
	} catch (Exception e){
		e.printStackTrace(); //예외 발생 기록
		intCount = 0;
	}
	
	int inttotalAmountInput = Integer.parseInt(totalAmountInput);
	TotalOrderDAO totalOrderDAO = new TotalOrderDAO();
	TotalOrderDTO totalorder= totalOrderDAO.findTotalOrderList(loggedInMember.getId(),inttotalAmountInput );
	%>

	


	<form class="container" method="post" action="totalOderd1_proc.jsp">
	

		<h2>주문하신 상품</h2>
		<table border="1" cellpadding="2">

			<tr>
				<td align="center">주문번호</td>
				<td><%=totalorder.getOrderId() %></td>

			</tr>

			<tr>
				<td align="center" width="80">주문날짜</td>
				<td><%=totalorder.getOrderDate()%></td>

			</tr>
			<tr>
				<td align="center">주문상품</td>
				<td><%=name %></td>
			</tr>
			
			<tr>
				<td align="center">수량</td>
				<td><%=intCount%></td>
			</tr>
			
			<tr>
				<td align="center">결제금액</td>
				<td><%=totalAmountInput %></td>
			</tr>
			
			<tr>
				<td align="center">주문상태</td>
				<td><%=totalorder.getProcessing() %></td>
			</tr>
			
		</table>
	</form>



</body>
</html>