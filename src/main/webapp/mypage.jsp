<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dto.SignUpDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<style>
body {
	margin: 0;
}

.title {
	width: 50%;
	height: 100px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 100px;
	cursor: pointer;
	margin: 0 auto;
	border: 0;
}

    .ftbox {
	width: 50%;
	height: 100px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 100px;
	cursor: pointer;
	margin: 0 auto;
	border: 0;
	display: flex;
	align-content: center;
    flex-wrap: wrap;
    justify-content: center;
}


.login-form {
	border: 0;
	border-radius: 5px;
	background-color: #eeeff1;
	padding: 20px;
	margin: 0 auto;
	height: 600px;
}

.text-field {

	border: none;
	border-radius: 5px;
	padding: 10px;
	width: 95%;
}

.modify-btn{
	color: #eeeff1;
	font-size: 14px;
	background-color: #525d76;
	margin-bottom: 30px;
	padding: 10px;
	border: none;
	border-radius: 5px;
	width: 32%;
	cursor: pointer;
}
.logout-btn{
	color: #eeeff1;
	font-size: 14px;
	background-color: #525d76;
	margin-bottom: 30px;
	padding: 10px;
	border: none;
	border-radius: 5px;
	width: 32%;
	cursor: pointer;
}
.delete-btn{
	color: #eeeff1;
	font-size: 14px;
	background-color: #525d76;
	margin-bottom: 30px;
	padding: 10px;
	border: none;
	border-radius: 5px;
	width: 32%;
	cursor: pointer;
}
.loginContainel {
	width: 50%;
	height: 600px;
	margin: 0 auto;
}
.subox {
	width: 100%;
	height: 50px;
}

.links {
	text-align: center;
}
.links a {
	font-size: 12px;
	color: #9b9b9b;
}
</style>
</head> 
<body>

<%
		SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");

	if (loggedInMember != null) {
	%>
<h2 class="title" onclick="location.href='main.jsp'">내 정보</h2>
<div class="loginContainel">
	<div class="login-form">
	  <form id="myPageForm" action="modifyMember_proc.jsp" method="post">
	  	<input type="hidden" id="input_id" name="id" value="<%= loggedInMember.getId() %>">
	  	<p>비밀번호: <input class="text-field" type="text" id="input_password" name="password" value="<%= loggedInMember.getPassword() %>"></p>
	  	<p>이름: <input class="text-field" type="text" id="input_name" name="name" value="<%= loggedInMember.getName() %>"></p>
        <p>이메일: <input class="text-field" type="text" id="input_email" name="email" value="<%= loggedInMember.getEmail() %>"></p>
        <p>전화번호: <input class="text-field" type="text" id="input_phone" name="phone" value="<%= loggedInMember.getPhone() %>"></p>
        <p>우편번호: <input class="text-field" type="text" id="input_zipcode" name="zipcode" value="<%= loggedInMember.getZipcode() %>"></p>
        <p>주소: <input class="text-field" type="text" id="input_address" name="address" value="<%= loggedInMember.getAddress() %>"></p>
        <p>상세주소: <input class="text-field" type="text" id="input_address2" name="address2" value="<%= loggedInMember.getAddress2() %>"></p>
        <input type="hidden" id="input_birthday" name="birthday" value="<%= loggedInMember.getBirthday() %>">
        <input type="hidden" id="input_indate" name="indate" value="<%= loggedInMember.getIndate() %>">
        <button class="modify-btn" id="modifyBtn" type="button">수정하기</button>
        <button class="logout-btn" id="logoutBtn" type="button">로그아웃</button>
        <button class="delete-btn" id="deleteBtn" type="button">탈퇴하기</button>
       </form>
       </div>
       </div>
       	<div class="ftbox">
            <div class="ftbox" onclick="history_go1()">
                <h2>이전 페이지</h2>
            </div>
            <div class="ftbox" onclick="location.href='main.jsp'">
                <h2>메인으로 돌아가기</h2>
            </div>
        </div>
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

	if(confirm('수정 하시겠습니까?')){
		let form = document.getElementById('myPageForm');
		form.action = 'modifyMember.jsp';
		form.submit();
	}
});
document.getElementById('deleteBtn').addEventListener('click', ()=> {

	if(confirm('탈퇴 하시겠습니까?')){
		let form = document.getElementById('myPageForm');
		form.action = 'deleteMember.jsp';
		form.submit();
	}
});

function history_go1(){
	history.go(-1);
}

</script>
	</table>
</body>
</html>