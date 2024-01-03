
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
	width: 50%;
	height: 150px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 145px;
	cursor: pointer;
	margin: 0 auto;
	border: 0;
}

    .ftbox {
	width: 50%;
	height: 150px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 145px;
	cursor: pointer;
	margin: 0 auto;
	border: 0;
}

.mainmenu {
	width: 100%;
	height: 500px;
}

.menubar {
	list-style: none;
	width: 100%;
	height: 40px;
}

.libar{
	list-style: none;
	float: left;
	line-height: 32px;
	justify-content: space-evenly;
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

	<h2 class="title" onclick="location.href='main.jsp'">2조 쇼핑몰</h2>
	<div class="mainmenu">
		<ul class="menubar">
	<%
    SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");

    if (loggedInMember != null) {
    	 String memberId = loggedInMember.getId();
         if ("admin".equals(memberId)) {
	%>
			<li class="libar"><a class="mypage" href="./mypage.jsp">내 정보</a> </li>
			<li class="libar li-list"><a class="logout" href="./logOut.jsp">로그아웃</a> </li>
			<li class="libar li-list"><a class="admin" href="./admin.jsp">관리자</a> </li>
		</ul>
	</div>
	<%
    	} else {
   %>
   <div>
   		<ul>
   			<li class="libar"><a class="mypage" href="./mypage.jsp">내 정보</a> </li>
			<li class="libar li-list"><a class="logout" href="./logOut.jsp">로그아웃</a> </li>
   		</ul>
   </div>
	<%
    	}
    } else {
	%>
	<div>
			<ul>
				<li class="libar" ><a class="login" href="./login.jsp">로그인</a> </li>
				<li class="libar li-list" ><a class="signup" href="./signUp.jsp">회원가입</a> </li>

			</ul>
	</div>

	<%
    }
	%>
	</div>
	
	<%@ include file="navigation.jsp" %>
	
	<footer class="ftbox" onclick="location.href='main.jsp'"><h2>메인으로 돌아가기</h2></footer>
	<script>

</script>

</body>
</html>