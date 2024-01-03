<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log in</title>
<style>

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
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
	width: 300px;
	border: 0;
	border-radius: 5px;
	background-color: #eeeff1;
	padding: 20px;
	margin: 0 auto;
	height: 130px;
}

.text-field {
	font-size: 14px;
	margin-bottom: 10px;
	border: none;
	border-radius: 5px;
	padding: 10px;
	width: 93%;
}

.login-btn {
	color: #eeeff1;
	font-size: 14px;
	background-color: #525d76;
	margin-bottom: 30px;
	padding: 10px;
	border: none;
	border-radius: 5px;
	width: 45%;
	cursor: pointer;
}

.signup-btn {
	color: #eeeff1;
	font-size: 14px;
	background-color: #525d76;
	margin-bottom: 30px;
	padding: 10px;
	border: none;
	border-radius: 5px;
	width: 45%;
	cursor: pointer;
}
.loginContainel {
	width: 50%;
	height: 400px;
	margin: 0 auto;
	background-color: #eeeff1;
}
.lgbox {
	width: 100%;
	height: 100px;
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
	<h2 class="title" onclick="location.href='main.jsp'">로그인</h2>

<div class="loginContainel">
	<div class="lgbox"></div>
		<div class="login-form">
			<form id="loginFrom" action="login_proc.jsp" method="post">

				<input class="text-field" type="text" id="id" name="id" required placeholder="아이디"><br>

				<input class="text-field" type="password" id="password" name="password" required placeholder="비밀번호"><br>

				<input class="login-btn" type="submit" value="로그인">
				<input class="signup-btn" id="signUpBtn" type="submit" value="회원가입">
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
	document.getElementById('signUpBtn').addEventListener('click', ()=> {
    	if(confirm('회원가입으로 이동하시겠습니까?')){
    		let form = document.getElementById('loginFrom');
    		form.action = 'signUp.jsp';
    		form.submit();
    	}
	});

	function history_go1(){
		history.go(-1);
	}

	</script>
	
</body>
</html>