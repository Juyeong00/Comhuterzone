<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in</title>
<style>
    .ftbox {
	width: 100%;
	height: 150px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 145px;
	display: flex;
	cursor: pointer;
}
</style>
</head>
<body>
	<h1>로그인</h1>
	

    <form id="loginFrom" action="login_proc.jsp" method="post">
        <label for="id">ID: </label>
        <input type="text" id="id" name="id" required><br>

        <label for="password">Password: </label>
        <input type="password" id="password" name="password" required><br>

        <input type="submit" value="Login">
        <input id="signUpBtn" type="submit" value="SignUp">
    </form>

    <footer class="ftbox" onclick="location.href='main.jsp'"> </footer>
<script>
	document.getElementById('signUpBtn').addEventListener('click', ()=> {
    	if(confirm('회원가입으로 이동하시겠습니까?')){
    		let form = document.getElementById('loginFrom');
    		form.action = 'signUp.jsp';
    		form.submit();
    	}
	});
	</script>
	
</body>
</html>