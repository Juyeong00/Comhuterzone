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
	width: 100%;
	height: 100px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 100px;
	cursor: pointer;
	margin: 0 auto;
	border: 0;
}


.mainmenu {
	width: 100%;
	height: auto;	
}
.menubar {
	list-style: none;
	width: 100%;
	height: 40px;
	display:flex;
	justify-content: end;
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
.container{
	width:100%;
	height:450px;
	text-align: center;
}

.mypage, .logout, .cart, .admin, .mypage, .logout, .login, .signup{
	font-weight : bold;
}
</style>
</head>
<body>


	

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
			<li class="libar li-list"><a class="cart" href="./cartList.jsp">장바구니</a> </li>
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
			<li class="libar li-list"><a class="cart" href="./cartList.jsp">장바구니</a> </li>
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

	
	
	<script>

</script>

</body>
</html>