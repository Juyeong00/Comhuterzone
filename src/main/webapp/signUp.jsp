<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	font-size: 14px;
	margin-bottom: 10px;
	border: none;
	border-radius: 5px;
	padding: 10px;
	width: 93%;
}

.signup-btn {
	color: #eeeff1;
	font-size: 14px;
	background-color: #525d76;
	margin-bottom: 30px;
	padding: 10px;
	border: none;
	border-radius: 5px;
	width: 100%;
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
	<h2 class="title" onclick="location.href='main.jsp'">회원가입</h2>
	<div class="loginContainel">
	<div class="login-form">
	 <form method="post" action="signUp_proc.jsp" onsubmit="return validateForm()" >
		<input class="text-field" type="text" name="id" required placeholder="아이디"><br>
		<input class="text-field" type="password" name="password" required placeholder="비밀번호"><br>
		<input class="text-field" type="text" name="name" required placeholder="이름"><br>
		<input class="text-field" type="email" name="email" required placeholder="이메일"><br>
		<input class="text-field" type="text" name="phone" required placeholder="전화번호"><br>
		<input class="text-field" type="text" name="zipcode" required placeholder="우편번호"><br>
		<input class="text-field" type="text" name="address" required placeholder="주소"><br>
		<input class="text-field" type="text" name="address2" required placeholder="상세주소"><br>
		<input class="text-field" type="text" name="birthday" required placeholder="생년월일"><br>
		<button class="signup-btn" id="submitBtn" type="submit">회원가입</button>
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
	 function validateForm() {
         var form = document.forms[0];
         var elements = form.elements;

         for (var i = 0; i < elements.length; i++) {
             if (elements[i].type !== 'submit' && elements[i].type !== 'button' && elements[i].type !== 'reset') {
                 if (elements[i].value.trim() === '') {
                     alert('빈칸을 입력해주세요');
                     return false;
                 }
             }
         }

         return true;
     }
	
		function history_go1(){
			history.go(-1);
		}
	
	</script>
</body>
</html>