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
	String id = request.getParameter("id"); //personInfo.jsp
	String name = request.getParameter("name");
	String count = request.getParameter("count");
	String totalAmountInput = request.getParameter("totalAmountInput");
	

	int intId = 0;
	try{
		intId = Integer.parseInt(id); //예외
	} catch (Exception e){
		e.printStackTrace(); //예외 발생 기록
		intId = 0;
	}
	
	int intCount = 0;
	try{
		intCount = Integer.parseInt(count); //예외
	} catch (Exception e){
		e.printStackTrace(); //예외 발생 기록
		intCount = 0;
	}
	
	GoodsDAO goodsDAO = new GoodsDAO(); 
	GoodsDTO goods = goodsDAO.findDeskDetailById(intId);
	GoodsDTO go = goodsDAO.findDeskDetailById2(intId);
	
	
	
	
	TotalOrderDAO totalOrderDAO = new TotalOrderDAO();
	String orderNumber = totalOrderDAO.generateOrderNumber();
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
	String orderDate = dateFormat.format(new Date());
	
	%>

	


	<form class="container" method="post" action="totalOderd1_proc.jsp">
	

		<h2>주문하신 상품</h2>
		<table border="1" cellpadding="2">

			<tr>
				<td align="center">주문번호</td>
				<td><%=orderNumber %></td>

			</tr>

			<tr>
				<td align="center" width="80">주문날짜</td>
				<td><%=orderDate %></td>

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
			
			
		</table>
	</form>



</body>
</html>