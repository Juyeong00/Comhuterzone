<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.dto.SignUpDTO" %> 
<%@ page import="db.dto.GoodsDTO" %>

<%@ page import="db.dao.LoginMemberDAO" %>
<%@ page import="db.dao.GoodsDAO" %>
<%@ page import="db.dao.TotalOrderDAO" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id"); //personInfo.jsp
		String count = request.getParameter("count");
		
		String phone = request.getParameter("phone");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		
		//System.out.println(id);
		//System.out.println(count);
		
		int intId = 0;
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
		
		
		
		
		
		SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");
		
		GoodsDAO goodsDAO = new GoodsDAO();
		GoodsDTO goods = goodsDAO.findDeskDetailById(intId);
		GoodsDTO go = goodsDAO.findDeskDetailById2(intId);
		
		if (loggedInMember == null) {
	%>
	
	<form id="orderForm" action="orderedGoods.jsp" method="post" >
	<input type= "hidden" name="id" value="<%= goods.getId() %>">
	<input type= "hidden" name="name" value="<%= go.getName() %>">
	<input type= "hidden" name="count" value="<%=intCount %>">
	
	
		<h2>주문</h2>
			<hr>
			
			<form>
				<input type="radio" name="info" value="회원정보" onClick="info_copy_chk(this.checked)" >
				<label for ="회원정보">회원정보와 동일</label>
				<input type="radio" id="info" name="info" value="새로운" onClick="info_chk(this.checked)" >
				<label for ="새로운">새로운 배송지</label>
			</form>
		
		<table border="1" cellpadding="2">
			
			
			
			<tr>
				<td align="center">주문상품</td>
				
				<td><%=goods.getName() %></td>
				
			</tr>
			
			<tr>
				<td align="center">수량</td>
			<td><%=intCount %></td>
			
			
			<tr>
				<td align="center">이름</td>
				<td><input type="text" id="ordername" name="orderName" size="30" value= "<%=loggedInMember.getName() %>"></td>
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
				</select> - <input type="text" name="tel2" size="5"> - 
				<input type="text" name="tel3" size="5"></td>
			</tr>
			<tr>
				<td align="center">주소</td>
				<td><input type="text" id="zipcode" name="zipcode" size="5" value= "<%=loggedInMember.getZipcode() %>" >
					<input type="button"value="우편번호검색"><br> 
				 	<input type="text" id="address" name="address" size="50" value="<%=loggedInMember.getAddress() %>" ><br>
					<input type="text" id="address2"name="address2" size="50" value="<%=loggedInMember.getAddress2() %>"></td>
			</tr>
			<tr>
				<td align="center">결제카드</td>
				<td><select name="card" style="width: 60px;">
						<option value="삼성">삼성</option>
						<option value="농협">농협</option>
						<option value="국민">국민</option>
						<option value="신한">신한</option></td>
			</tr>

			<tr>
				<td align="center" width="100px">총 결제 금액
				<td><%=goods.getPrice() * intCount %></td>
				
			</tr>

			<tr>
				<td colspan="2" align="center">
					<!--  <button id="order" type="button">주문하기</button>-->
					<input type="button" value="주문하기" onclick="button1()">
					<input type="reset" value="돌아가기" onclick="button2()">
				</td>
			</tr>

				
		</table>
	</form>
	
		<script>
			if(orderName == null){
				alert("이름 입력은 필수입니다.")
			} else if (tel2 == null){
				alert("전화번호 입력은 필수입니다.")
			} else if (zipcode == 0){
				alert("우편번호 입력은 필수입니다.")
			} else if (addr1 == null){
				alert("주소 입력은 필수입니다.")
			} else if (addr2 ==null){
				alert("주소 입력은 필수입니다.")
			} else if (card == null){
				alert ("결제 카드를 선택해주세요.")
			} else{
			let form = document.getElementById('orderForm');
			alert("주문이 완료되었습니다.")		
							form.action = 'orderedGoods.jsp';	
							form.submit();
	
	<%}%>
	
	
	
	
	
	
	</script>




</body>
</html>