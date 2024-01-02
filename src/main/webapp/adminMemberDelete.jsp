<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.SignUpDAO" %>
<%@ page import="db.dto.SignUpDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
		String id = request.getParameter("id");
		System.out.println("deletePerson_proc 파라미터 : " + id);
		
		SignUpDAO signUpDAO = new SignUpDAO();
		int result = signUpDAO.removeSignUpInfoById(id);
		
		if(result > 0){
	%>		
				<script>
					alert('삭제 성공');
					location.href = 'AdminMemberList.jsp'; //해당 경로로 페이지 이동
				</script>
	<%
				} else {
	%>
				<script>	
					alert('삭제 실패');
					//location.href = 'addPerson.jsp'; //해당 경로로 이동
					history.back(); //뒤로가기
				</script>
				
	<% 	
				}
	%>
</body>
</html>