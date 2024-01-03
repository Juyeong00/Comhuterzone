<%@page import="db.dto.SignUpDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");
	
	String goods_id = request.getParameter("id");
	String count = request.getParameter("count");
	System.out.println("제품id: " + goods_id);
	System.out.println("수량: " + count);
	
	int intId = 0;
	try {
		intId = Integer.parseInt(goods_id);
	} catch (Exception e) {
		e.printStackTrace();
		intId = 0;
	}
	
	int intCount = 1;
	try {
		intCount = Integer.parseInt(count);
	} catch (Exception e) {
		e.printStackTrace();
		intCount = 1;
	}
	
	%>
	<form id="goodsForm" action="goods_proc.jsp" method="post">
	<input type="hidden" id="goodsId" name="id" value="<%=intId%>">
	<input type="hidden" id="goodsCnt" name="count" value="<%=intCount%>">
	</form>
	
	<script>
	
   	let loggedInMember = <%= (loggedInMember != null) ? "true" : "false" %>;

    console.log(loggedInMember);

    let form = document.getElementById('goodsForm');
    if (loggedInMember> 0) {
        form.action = 'totalOrder1.jsp';
        location.href = 'totalOrder1.jsp';
        form.submit();
    } else {
        alert('로그인 후 이용가능합니다');
        history.back();
    }
     
	</script>

</body>
</html>