<%@page import="db.dto.CategoryDTO"%>
<%@page import="db.dao.CategoryDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>

	<%
	CategoryDAO cateDAO = new CategoryDAO();
	List<CategoryDTO> cateList = cateDAO.findCategoryList();
	
	%>

	<%
	for(CategoryDTO cate : cateList){
	%>
	<div class="wrapper">
		 <ul>
		 	<li><a href="./deskCategory.jsp?id=<%=cate.getCa_id()%>"><%=cate.getCa_name()%></a></li>
		 </ul>

          
	<%
	}
	%>

</body>
</html>