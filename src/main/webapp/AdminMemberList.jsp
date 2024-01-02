<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.SignUpDAO" %>
<%@ page import="db.dto.SignUpDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String id = request.getParameter("id");
		SignUpDAO signUpDAO = new SignUpDAO();
		
		SignUpDTO signUpDTO = signUpDAO.findMemberInfoById(id);
		%>
		<h1>멤버 정보 페이지</h1>
	<%
		if(signUpDTO == null){
	%>
			<!-- <h2>해당 사용자 정보가 없습니다.</h2> -->
			<script>
				alert('잘못된 접근입니다.');
				location.href = 'memberList.jsp';
			</script>
	<%
		} else {
	%>
			<h3><%=signUpDTO.getName() %>님의 정보</h3>
			
			<form id="adminMemberForm" action="modifyMember_proc.jsp" method="post">
	  	<input type="hidden" id="input_id" name="id" value="<%= signUpDTO.getId() %>">
	  	<p>비밀번호: <input type="text" id="input_password" name="password" value="<%= signUpDTO.getPassword() %>"></p>
	  	<p>이름: <input type="text" id="input_name" name="name" value="<%= signUpDTO.getName() %>"></p>
        <p>이메일: <input type="text" id="input_email" name="email" value="<%= signUpDTO.getEmail() %>"></p>
        <p>전화번호: <input type="text" id="input_phone" name="phone" value="<%= signUpDTO.getPhone() %>"></p>
        <p>우편번호: <input type="text" id="input_zipcode" name="zipcode" value="<%= signUpDTO.getZipcode() %>"></p>
        <p>주소: <input type="text" id="input_address" name="address" value="<%= signUpDTO.getAddress() %>"></p>
        <p>상세주소: <input type="text" id="input_address2" name="address2" value="<%= signUpDTO.getAddress2() %>"></p>
        <input type="hidden" id="input_birthday" name="birthday" value="<%= signUpDTO.getBirthday() %>">
        <input type="hidden" id="input_indate" name="indate" value="<%= signUpDTO.getIndate() %>">
        <button id="modifyBtn" type="button">수정하기</button>
        <button id="deleteBtn" type="button">삭제하기</button>
       </form>

	
	<script>
	document.getElementById('modifyBtn').addEventListener('click', ()=> {
    	if(confirm('수정 하시겠습니까?')){
    		let form = document.getElementById('adminMemberForm');
    		form.action = 'modifyAdminMember.jsp';
    		form.submit();
    	}
	});
	
document.getElementById('deleteBtn').addEventListener('click', ()=> {
		//alert('삭제버튼눌림');
		if(confirm('삭제 하시겠습니까?')){
			//확인 -> true -> 여기가 실행 -> 삭제쪽으로 연결!
			
			//get 방식으로 id 값 전달
			location.href = 'adminMemberDelete.jsp?id=<%= signUpDTO.getId() %>';
			
			//form submit 을 발생시켜서, post 바익으로 id 값 전달
			let form = document.getElementById('adminMemberForm');
    		form.action = 'adminMemberDelete.jsp';
			form.submit();
		}
	});
	
</script>
<% 
		}
	%>
</body>
</html>