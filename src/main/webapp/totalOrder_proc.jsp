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
			intId = Integer.parseInt(id); //����
		} catch (Exception e){
			e.printStackTrace(); //���� �߻� ���
			intId = 0;
		}
		
		int intCount = 1;
		
		try {
			intCount = Integer.parseInt(count); //����
		} catch (Exception e) {
			e.printStackTrace(); //���� �߻� ���
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
	
	
		<h2>�ֹ�</h2>
			<hr>
			
			<form>
				<input type="radio" name="info" value="ȸ������" onClick="info_copy_chk(this.checked)" >
				<label for ="ȸ������">ȸ�������� ����</label>
				<input type="radio" id="info" name="info" value="���ο�" onClick="info_chk(this.checked)" >
				<label for ="���ο�">���ο� �����</label>
			</form>
		
		<table border="1" cellpadding="2">
			
			
			
			<tr>
				<td align="center">�ֹ���ǰ</td>
				
				<td><%=goods.getName() %></td>
				
			</tr>
			
			<tr>
				<td align="center">����</td>
			<td><%=intCount %></td>
			
			
			<tr>
				<td align="center">�̸�</td>
				<td><input type="text" id="ordername" name="orderName" size="30" value= "<%=loggedInMember.getName() %>"></td>
			</tr>
			
			<tr>
				<td align="center">��ۿ�û ����</td>
				<td><select name="Delivery" style="width: 200px;">
						<option>���� ��� ��Ź�帳�ϴ�.</option>
						<option>�� �տ� �����ּ���.</option>
						<option>���ǿ� �ð��ּ���.</option></td>
			</tr>

			<tr>
				<td align="center">�ڵ���</td>
				<td><select name="tel1" style="width: 60px;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
				</select> - <input type="text" name="tel2" size="5"> - 
				<input type="text" name="tel3" size="5"></td>
			</tr>
			<tr>
				<td align="center">�ּ�</td>
				<td><input type="text" id="zipcode" name="zipcode" size="5" value= "<%=loggedInMember.getZipcode() %>" >
					<input type="button"value="�����ȣ�˻�"><br> 
				 	<input type="text" id="address" name="address" size="50" value="<%=loggedInMember.getAddress() %>" ><br>
					<input type="text" id="address2"name="address2" size="50" value="<%=loggedInMember.getAddress2() %>"></td>
			</tr>
			<tr>
				<td align="center">����ī��</td>
				<td><select name="card" style="width: 60px;">
						<option value="�Ｚ">�Ｚ</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="����">����</option></td>
			</tr>

			<tr>
				<td align="center" width="100px">�� ���� �ݾ�
				<td><%=goods.getPrice() * intCount %></td>
				
			</tr>

			<tr>
				<td colspan="2" align="center">
					<!--  <button id="order" type="button">�ֹ��ϱ�</button>-->
					<input type="button" value="�ֹ��ϱ�" onclick="button1()">
					<input type="reset" value="���ư���" onclick="button2()">
				</td>
			</tr>

				
		</table>
	</form>
	
		<script>
			if(orderName == null){
				alert("�̸� �Է��� �ʼ��Դϴ�.")
			} else if (tel2 == null){
				alert("��ȭ��ȣ �Է��� �ʼ��Դϴ�.")
			} else if (zipcode == 0){
				alert("�����ȣ �Է��� �ʼ��Դϴ�.")
			} else if (addr1 == null){
				alert("�ּ� �Է��� �ʼ��Դϴ�.")
			} else if (addr2 ==null){
				alert("�ּ� �Է��� �ʼ��Դϴ�.")
			} else if (card == null){
				alert ("���� ī�带 �������ּ���.")
			} else{
			let form = document.getElementById('orderForm');
			alert("�ֹ��� �Ϸ�Ǿ����ϴ�.")		
							form.action = 'orderedGoods.jsp';	
							form.submit();
	
	<%}%>
	
	
	
	
	
	
	</script>




</body>
</html>