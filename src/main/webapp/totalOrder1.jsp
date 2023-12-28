<%@ page import="db.dto.GoodsDTO" %>
<%@ page import="db.dao.GoodsDAO" %>

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
	String id = request.getParameter("id"); // id값을 불러오겠다 
	String count = request.getParameter("count");
	
	System.out.println(id);
	System.out.println(count);
	
	int intId = 0; //
	try{
		intId = Integer.parseInt(id); //예외
	} catch (Exception e){
		e.printStackTrace(); //예외 발생 기록
		intId = 0;
	}
	
	int intCount = 1;
	
	try {
		intCount = Integer.parseInt(count); //예외
	} catch (Exception e) {
		e.printStackTrace(); //예외 발생 기록
		intCount = 1;	
	}
	
	GoodsDAO goodsDAO = new GoodsDAO();
	GoodsDTO goods = goodsDAO.findDeskDetailById(intId);
	
	
	GoodsDTO go = goodsDAO.findDeskDetailById2(intId);
	
	
	%>
	
 	<input type= "hidden" name="id" value=""><%=goods.getId() %> 
	<input type= "hidden" name="name" value=""><%=go.getName() %>
	

	<form action="main_proc.jsp" id = "order" method="post" >
		<h2>주문</h2>
		<hr>
		<table border="1" cellpadding="2">

			<tr>
				<td align="center">주문상품</td>
				
				<td><%=goods.getName() %></td>
				
			</tr>
			
			<tr>
				<td align="center">수량</td>
			<td><%=intCount %></td>
				
			</tr>
			
			
			<tr>
				<td align="center">이름</td>
				<td><input type="text" name="orderedName" size="30"></td>
			</tr>
			
			<tr>
				<td align="center">배송요청 사항</td>
				<td><select name="Delivery" style="width: 200px;">
						<option>빠른 배송 부탁드립니다.</option>
						<option>문 앞에 놓아주세요.</option>
						<option>경비실에 맡겨주세요.</option></td>
			</tr>

			<tr>
				<td align="center">핸드폰</td>
				<td><select name="tel1" style="width: 60px;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
				</select> - <input type="text" name="tel2" size="5"> - <input
					type="text" name="tel3" size="5"></td>
			</tr>
			<tr>
				<td align="center">주소</td>
				<td><input type="text" id="postcode" name="zipcode" size="5"
					readonly> <input type="button" value="우편번호검색"
					onclick="checkPost()"><br> <input type="text"
					id="address" name="addr1" size="50" placeholder="주소" readonly><br>
					<input type="text" id="detailAddress" name="addr2" size="50"
					placeholder="상세주소"></td>
			</tr>
			<tr>
				<td align="center">결제카드</td>
				<td><input type="email" list="email2" name="email2"> <datalist
						id="email2">
						<option value="삼성">
						<option value="농협">
						<option value="국민">
						<option value="신한">
					</datalist></td>
			</tr>

			<tr>
				<td align="center" width="100px">총 결제 금액
				<td><%=goods.getPrice() * intCount %></td></td>
				
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="button"value="주문하기" onclick="button1()"> 
					<input type="reset" value="돌아가기" onclick="button2()">
				</td>
			</tr>

				
		</table>
	</form>

	<script>
	function button1() {
		if (confirm('주문하시겠습니까?')) {
			
			let form = document.getElementById('order');
				form.action = 'orderedGoods.jsp';	
				form.submit();	
			
		}
	}

		function button2() {
			if (confirm('이전 상품 상품 페이지로 이동하시겠습니까?')) {
				
				location.href = 'goodsList.jsp?id=<%=goods.getId()%>';
				
			}
		}
	</script>






</body>
</html>