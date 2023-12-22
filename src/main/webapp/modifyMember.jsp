<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.ModifyMemberDAO" %>
<%@ page import="db.dto.SignUpDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String birthday = request.getParameter("birthday");
		String indate = request.getParameter("indate");
		if( name == null ){
			//이름이 안넘어왔는데??
		}
		
		ModifyMemberDAO modifyMemberDAO = new ModifyMemberDAO();
		SignUpDTO signUpDTO = new SignUpDTO(id,password,name,email,phone,zipcode,address,address2,birthday,indate);
		
		int result = modifyMemberDAO.modifyMember(signUpDTO);
		
		if(result > 0){
	%>		
		<script>
			alert('수정 성공');
			location.href = 'mypage.jsp'; //해당 경로로 페이지 이동
		</script>
	<%
		} else {
	%>
		<script>	
			alert('수정 실패');
			//location.href = 'addPerson.jsp'; //해당 경로로 이동
			history.back(); //뒤로가기
		</script>
				
	<% 	
		}
	%>
</body>
</html>