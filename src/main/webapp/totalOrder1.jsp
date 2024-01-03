<%@ page import="db.dto.GoodsDTO" %>
<%@ page import="db.dao.GoodsDAO" %>

<%@ page import="db.dao.TotalOrderDAO" %>
<%@ page import="db.dto.TotalOrderDTO" %>

<%@ page import="db.dao.LoginMemberDAO" %>
<%@ page import="db.dto.SignUpDTO" %>

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
	String id = request.getParameter("id"); //personInfo.jsp
	String count = request.getParameter("count");
	String orderName = request.getParameter("orderName");
	String tel2 = request.getParameter("tel2");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String address2 = request.getParameter("address2");
	String card = request.getParameter("card");
	
	
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
	
	
// 	TotalOrderDAO totalOrderDAO = new TotalOrderDAO();
// 	TotalOrderDTO totalOrder = totalOrderDAO.saveTotalOrder()
	
	
	
	
	GoodsDAO goodsDAO = new GoodsDAO();
	GoodsDTO goods = goodsDAO.findDeskDetailById(intId);
	GoodsDTO go = goodsDAO.findDeskDetailById2(intId);
	
	SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");
	
	%>
	
	
	
	<form id="orderForm" action="orderedGoods.jsp" method="post" >
	<input type= "hidden" name="id" value="<%= goods.getId() %>">
	<input type= "hidden" name="name" value="<%= go.getName() %>">
	<input type= "hidden" name="userId" value="<%= loggedInMember.getId() %>">
	<input type= "hidden" name="tel2" value="<%= loggedInMember.getPhone() %>">
	<input type= "hidden" name="count" value="<%=intCount %>">
	<input type= "hidden" name="orderName" value="<%=loggedInMember.getName() %>">
	<input type= "hidden" name="zipcode" value="<%=loggedInMember.getZipcode() %>">
	<input type= "hidden" name="address" value="<%=loggedInMember.getAddress() %>">
	<input type= "hidden" name="address2" value="<%=loggedInMember.getAddress2() %>">
	<input type= "hidden" name="card" id="cardType" value="">
	<input type= "hidden" name="totalAmountInput" value="<%=goods.getPrice() * intCount %>">
	 
	 
	</form>
	
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
				<td><select name="delivery" style="width: 200px;">
						<option>빠른 배송 부탁드립니다.</option>
						<option>문 앞에 놓아주세요.</option>
						<option>경비실에 맡겨주세요.</option></td>
			</tr>

			<tr>
				<td align="center">핸드폰</td>
				<td><select name="tel1" style="width: 60px;">
						<option>010</option>
						<option>011</option>
						<option>017</option>
				</select> - <input type="text" name="tel2" size="5" value= "<%=loggedInMember.getPhone() %>"> - 
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
				<td><select name="cardType" id="card" style="width: 60px;">
					    <option value="삼성">삼성</option>
					    <option value="농협">농협</option>
					    <option value="국민">국민</option>
					    <option value="신한">신한</option>
					</select></td>
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
	
	
	function info_chk(chk) {
		 if (chk) {
		  document.getElementById("ordername").value = "";
		  document.getElementById("zipcode").value = "";
		  document.getElementById("address").value = "";
		  document.getElementById("address2").value = "";
		 }
		 
	}
	
	function info_copy_chk(chk){
		if(chk){
			document.getElementById("ordername").value="<%=loggedInMember.getName() %>"
			document.getElementById("zipcode").value = "<%=loggedInMember.getZipcode() %>";
			document.getElementById("address").value = "<%=loggedInMember.getAddress() %>";
			document.getElementById("address2").value = "<%=loggedInMember.getAddress2() %>";
		}
	}
	
	
	
	
	
		function button1() {
			if (confirm("주문하시겠습니까?")) {
				
				let form = document.getElementById('orderForm');		
				let name = document.getElementById('ordername');
				let zipcode = document.getElementById('zipcode');
				let address = document.getElementById('address');
				let address2 = document.getElementById('address2');
				let cardType = document.getElementById('cartType');
				
				let select = document.getElementById('card').value;
				cardType.value = select;
				
				if( name.value== ""){
					alert("이름 입력은 필수입니다.")
				} else if (zipcode.value == ""){
					alert("우편번호 입력은 필수입니다.")
				} else if (address.value == ""){
					alert("주소 입력은 필수입니다.")
				} else if (address2.value == ""){
					alert("상세주소 입력은 필수입니다.")
				} else {
					let form = document.getElementById('orderForm');
					alert("주문이 완료되었습니다.")		
							form.action = 'totalOrder_proc1.jsp';	
							form.submit();
				}
							
			}
				
		}

		function button2() {
			if (confirm("이전 상품 상품 페이지로 이동하시겠습니까?")) {
				
				location.href = 'goodsList.jsp?id=1';
				
			}
		}
		
		
		
		
		
		
	</script>






</body>
</html>