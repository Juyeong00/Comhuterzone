<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.LoginMemberDAO" %>
<%@ page import="db.dto.SignUpDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); //문자인코딩 설정
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		LoginMemberDAO loginMemberDAO = new LoginMemberDAO();
		
		
		SignUpDTO signUpDTO = loginMemberDAO.login(id,password);
		
		if(signUpDTO != null) {
			//로그인 성공
			session.setAttribute("loggedInMember",signUpDTO);
			session.setMaxInactiveInterval(3600);
			response.sendRedirect("main.jsp");
		} else {
			//로그인실패
	%>
		<script>
			alert('로그인 실패');
			history.back();
		</script>
<%
			}
	%>
</body>
</html>