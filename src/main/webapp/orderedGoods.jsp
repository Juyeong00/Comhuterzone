<%@ page import="db.dto.GoodsDTO"%>
<%@ page import="db.dao.GoodsDAO"%>
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
	String id = request.getParameter("id"); //personInfo.jsp
	System.out.println(id);
	
	
	int intId = 0;
	try{
		intId = Integer.parseInt(id); //예외
	} catch (Exception e){
		e.printStackTrace(); //예외 발생 기록
		intId = 0;
	}
	
		
	
	%>

	GoodsDAO goodsDAO = new GoodsDAO(); 
	GoodsDTO goods = goodsDAO.findDeskDetailById(intId);
	


	<form method="post" action="totalOderd1_proc.jsp">


		<h2>주문하신 상품</h2>
		<table border="1" cellpadding="2">

			<tr>
				<td align="center">주문번호</td>


			</tr>

			<tr>
				<td align="center" width="80">주문날짜</td>
				<td><input type="text" name="name" id="name" size="20">
				</td>

			</tr>
			<tr>
				<td align="center">주문상품</td>
				
			</tr>
		</table>
	</form>



</body>
</html>