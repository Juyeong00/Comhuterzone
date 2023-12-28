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
	
	 <form method="post" action="signUp_proc.jsp" onsubmit="return validateForm()" >
		<label>아이디:</label><input type="text" name="id" required><br>
		<label>비밀번호:</label><input type="password" name="password" required ><br>
		<label>이름:</label><input type="text" name="name" required ><br>
		<label>이메일:</label><input type="email" name="email" required ><br>
		<label>전화번호:</label><input type="text" name="phone" required ><br>
		<label>우편번호:</label><input type="text" name="zipcode" required ><br>
		<label>주소:</label><input type="text" name="address" required ><br>
		<label>상세주소:</label><input type="text" name="address2" required ><br>
		<label>생년월일:</label><input type="text" name="birthday" required ><br>
		
		<button id="submitBtn" type="submit">회원가입</button>
	</form>
	
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
	</script>
</body>
</html>