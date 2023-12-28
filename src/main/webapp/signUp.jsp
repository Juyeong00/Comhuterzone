<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	
	<form method="post" id="signupForm" >
		<label>아이디:</label><input type="text" name="id" required ><br>
		<label>비밀번호:</label><input type="password" name="password" required ><br>
		<label>이름:</label><input type="text" name="name" required ><br>
		<label>이메일:</label><input type="email" name="email" required ><br>
		<label>전화번호:</label><input type="text" name="phone" required ><br>
		<label>우편번호:</label><input type="text" name="zipcode" required ><br>
		<label>주소:</label><input type="text" name="address" required ><br>
		<label>상세주소:</label><input type="text" name="address2" required ><br>
		<label>생년월일:</label><input type="text" name="birthday" required ><br>
		
		<button id="submitBtn" type="submit" onclick="validateForm()">회원가입</button>
	</form>
	
	<script>
		function validateForm(){
			var id = document.getElementsByName('id')[0].value;
			var password = document.getElementsByName('password')[0].value;
			var name = document.getElementsByName('name')[0].value;
			var email = document.getElementsByName('email')[0].value;
			var phone = document.getElementsByName('phone')[0].value;
			var zipcode = document.getElementsByName('zipcode')[0].value;
			var address = document.getElementsByName('address')[0].value;
			var address2 = document.getElementsByName('address2')[0].value;
			var birthday = document.getElementsByName('birthday')[0].value;
			
			if(id === "" || password === "" || name === "" || email === "" || phone === "" || zipcode === "" || address === "" || address2 === "" || birthday === "" ){
				
				alert('빈칸을 입력해주세요');
				
			} else {
				location.href = 'signUp_proc.jsp';
			}
		}
		
	</script>
</body>
</html>