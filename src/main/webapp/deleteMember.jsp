<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.DeleteMemberDAO" %>
<%@ page import="db.dto.SignUpDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
		SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");
		if(loggedInMember != null){
		String id = loggedInMember.getId();
		DeleteMemberDAO deleteMemberDAO = new DeleteMemberDAO();
		
		int result = deleteMemberDAO.deleteMemberInfoById(id);
		
		if(result > 0){
			session.invalidate();
	%>		
				<script>
					alert('삭제 성공');
					location.href = 'main.jsp'; //해당 경로로 페이지 이동
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
		}
	%>
</body>
</html>