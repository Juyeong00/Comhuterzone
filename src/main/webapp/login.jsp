<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in</title>
</head>
<body>
	<h1>로그인</h1>
	

    <form action="login_proc.jsp" method="post">
        <label for="id">ID: </label>
        <input type="text" id="id" name="id" required><br>

        <label for="password">Password: </label>
        <input type="password" id="password" name="password" required><br>

        <input type="submit" value="Login">
    </form>

	
</body>
</html>