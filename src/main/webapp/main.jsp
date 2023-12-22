<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="db.dto.SignUpDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    }

    .title{
    width: 100%;
    height: 150px;
    background-color: #525d76;
    color: #ffffff;
    text-align: center;
    line-height : 145px;
    }
    .ftbox {
        width: 100%;
    height: 150px;
    background-color: #525d76;
    color: #ffffff;
    text-align: center;
    line-height : 145px;
    display: flex;
    
    }
     .containel{
        width: 100%;
        height: 300px;
    }
    .category{
       width: 25%;
       height: 200px;
       float:left;
       background-color: #525d76;
       border: 1px solid #ffffff;
       color: #ffffff;
       text-align: center;
       line-height: 190px;
       font-size: 50px;
    }
    
    .mainmenu{
        width: 100%;
        height: 200px;
    }
</style>
</head>
<body>

	<h2 class="title">2조 쇼핑몰</h2>
    <div class="mainmenu">
<%
    SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");
    if (loggedInMember != null) {
%>
        <a class="mypage" href="./mypage.jsp">내 정보</a>
        <a class="logout" href="./logOut.jsp">로그아웃</a>
<%
    } else {
%>
        <a class="login" href="./login.jsp">로그인</a>
        <a class="signup" href="./signUp.jsp">회원가입</a>
<%
    }
%>
    </div>
	<div class="containel">
    <div class="category">PC</div>
    <div class="category">노트북</div>
    <div class="category">조립PC</div>
    <div class="category">테블릿</div>
    </div>
    <footer class="ftbox">
    </footer>
    <script>

</script>
</body>
</html>