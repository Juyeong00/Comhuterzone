<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dto.SignUpDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
</head> 
<body>

<%
		SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");

	if (loggedInMember != null) {
	%>
	  <h2><%= loggedInMember.getId() %>님의 정보</h2>
	  <form id="myPageForm" action="modifyMember_proc.jsp" method="post">
	  	<input type="hidden" id="input_id" name="id" value="<%= loggedInMember.getId() %>">
	  	<p>비밀번호: <input type="text" id="input_password" name="password" value="<%= loggedInMember.getPassword() %>"></p>
	  	<p>이름: <input type="text" id="input_name" name="name" value="<%= loggedInMember.getName() %>"></p>
        <p>이메일: <input type="text" id="input_email" name="email" value="<%= loggedInMember.getEmail() %>"></p>
        <p>전화번호: <input type="text" id="input_phone" name="phone" value="<%= loggedInMember.getPhone() %>"></p>
        <p>우편번호: <input type="text" id="input_zipcode" name="zipcode" value="<%= loggedInMember.getZipcode() %>"></p>
        <p>주소: <input type="text" id="input_address" name="address" value="<%= loggedInMember.getAddress() %>"></p>
        <p>상세주소: <input type="text" id="input_address2" name="address2" value="<%= loggedInMember.getAddress2() %>"></p>
        <input type="hidden" id="input_birthday" name="birthday" value="<%= loggedInMember.getBirthday() %>">
        <input type="hidden" id="input_indate" name="indate" value="<%= loggedInMember.getIndate() %>">
        <button id="modifyBtn" type="button">수정하기</button>
        <button id="logoutBtn" type="button">로그아웃</button>
       </form>
<%
    } else {
        // 로그인 상태가 아닌 경우 로그인 페이지로 이동
   %>
   <script>
   			alert('로그인 해주세요.');
   			location.href = 'login.jsp';
   </script>
   <% 
    }
%>
<script>
document.getElementById('logoutBtn').addEventListener('click', ()=> {

	if(confirm('로그아웃 하시겠습니까?')){
		let form = document.getElementById('myPageForm');
		form.action = 'logOut.jsp';
		form.submit();
	}
});
document.getElementById('modifyBtn').addEventListener('click', ()=> {
	//이름이 있는지 혹시 비어있는지!!!
	/*
	let input_name = document.getElementById('input_name');
	if(input_name.value.trim() == ''){
		alert('이름은 필수 입력입니다.');
		input_name.focus();
		return;
	}
	*/

	if(confirm('수정 하시겠습니까?')){
		let form = document.getElementById('myPageForm');
		form.action = 'modifyMember.jsp';
		form.submit();
	}
});
</script>
	</table>
</body>
</html>