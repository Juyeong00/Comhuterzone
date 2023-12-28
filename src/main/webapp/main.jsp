<%@page import="db.dto.SignUpDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.title {
	width: 100%;
	height: 150px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 145px;
}

.ftbox {
	width: 100%;
	height: 150px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 145px;
	display: flex;
}

.mainmenu {
	width: 235px;
	height: 500px;
}

.menubar {
	list-style: none;
	padding-left:0px;
}

.libar{
	list-style: none;
	float: left;
	line-height: 32px;
}

.li-list::before{
	content: '';
    display: inline-block;
    width: 1px;
    height: 10px;
    margin: 11px 8px 0 8px;
    background-color: #ddd;
    vertical-align: top;
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
	<ul class="menubar">
	<li class="libar"><a class="mypage" href="./mypage.jsp">내 정보</a> </li>
	<li class="libar li-list"><a class="logout" href="./logOut.jsp">로그아웃</a> </li>
	<%
    } else {
	%>
	<li class="libar" ><a class="login" href="./login.jsp">로그인</a> </li>
	<li class="libar li-list" ><a class="signup" href="./signUp.jsp">회원가입</a> </li>
	</ul>
	</div>
	<%
    }
	%>
	
	
	<%@ include file="navigation.jsp" %>
	
	<footer class="ftbox"> </footer>
	<script>

</script>
</body>
</html>