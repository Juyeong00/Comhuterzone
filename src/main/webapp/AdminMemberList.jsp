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
	width: 49%;
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
	width: 49%;
	cursor: pointer;
}
.loginContainel {
	width: 50%;
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
		String id = request.getParameter("id");
		SignUpDAO signUpDAO = new SignUpDAO();
		
		SignUpDTO signUpDTO = signUpDAO.findMemberInfoById(id);
		%>
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
			<h2 class="title" onclick="location.href='main.jsp'"><%= signUpDTO.getId() %>님의 정보</h2>
<div class="loginContainel">
	<div class="login-form">
			<form id="adminMemberForm" action="modifyMember_proc.jsp" method="post">
	  	<input type="hidden" id="input_id" name="id" value="<%= signUpDTO.getId() %>">
	  	<p>비밀번호: <input class="text-field" type="text" id="input_password" name="password" value="<%= signUpDTO.getPassword() %>"></p>
	  	<p>이름: <input class="text-field" type="text" id="input_name" name="name" value="<%= signUpDTO.getName() %>"></p>
        <p>이메일: <input class="text-field" type="text" id="input_email" name="email" value="<%= signUpDTO.getEmail() %>"></p>
        <p>전화번호: <input class="text-field" type="text" id="input_phone" name="phone" value="<%= signUpDTO.getPhone() %>"></p>
        <p>우편번호: <input class="text-field" type="text" id="input_zipcode" name="zipcode" value="<%= signUpDTO.getZipcode() %>"></p>
        <p>주소: <input class="text-field" type="text" id="input_address" name="address" value="<%= signUpDTO.getAddress() %>"></p>
        <p>상세주소: <input class="text-field" type="text" id="input_address2" name="address2" value="<%= signUpDTO.getAddress2() %>"></p>
        <p>생년월일: <input class="text-field" type="text" id="input_birthday" name="birthday" value="<%= signUpDTO.getBirthday() %>"></p>
        <p>가입날짜: <input class="text-field" type="text" id="input_indate" name="indate" value="<%= signUpDTO.getIndate() %>"></p>
        <button class="modify-btn" id="modifyBtn" type="button">수정하기</button>
        <button class="delete-btn" id="deleteBtn" type="button">삭제하기</button>
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
	function history_go1(){
		history.go(-1);
	}
</script>
<% 
		}
	%>
</body>
</html>