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
	
	<form action="signUp_proc.jsp" method="post">
		<label>아이디:</label><input type="text" name="id"><br>
		<label>비밀번호:</label><input type="password" name="password"><br>
		<label>이름:</label><input type="text" name="name"><br>
		<label>이메일:</label><input type="email" name="email"><br>
		<label>전화번호:</label><input type="text" name="phone"><br>
		<label>우편번호:</label><input type="text" name="zipcode"><br>
		<label>주소:</label><input type="text" name="address"><br>
		<label>상세주소:</label><input type="text" name="address2"><br>
		<label>생년월일:</label><input type="text" name="birthday"><br>
		
		<button id="susubmit" type="submit">회원가입</button>
	</form>
	
	<script>
	
	</script>
</body>
</html>