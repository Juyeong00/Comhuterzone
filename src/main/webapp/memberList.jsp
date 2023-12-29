<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dao.SignUpDAO" %>
<%@ page import="db.dto.SignUpDTO" %>
<%@ page import="java.util.List" %>
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

.theads {
    display: table-header-group;
    vertical-align: middle;
}

.thead__th {
    padding: 0;
    border-bottom: 1px solid #dee0e2;
    background-color: #f8f9fc;
    color: #00256c;
    font-weight: 400;
    font-size: 1.4rem;
    line-height: 1.58;
    width: 400px;
}

.tbody__th {
    border-top: 1px solid #dee0e2;
    background-color: #ffffff;
    color: #00256c;
    text-align: left;
    line-height: 1.58;
    width: 400px;
}

.nm_table{
    margin: 1.4rem 0;
    border-top: 1px solid #00256c;
    border-bottom: 1px solid #dee0e2;
    
}

.nm_table table {
    table-layout: fixed;
    border-collapse: collapse;
    border-spacing: 0;
    empty-cells: show;
}

*[class]._center {
    text-align: center !important;
}
*[class]._left {
    border-left: 1px solid #dee0e2;
}

.tb_th {
    background-color: #f8f9fc ;
    width: 400px;
}

.thead__th {
        padding: 0.5rem;
    }

.tbody__th {
        padding: 0.5rem;
        word-break: break-all;
    }

</style>
</head>
<body>
    <h2 class="title">회원 리스트</h2>
	<%
		SignUpDAO signUpDAO = new SignUpDAO();
	
		List<SignUpDTO> SignUpList = signUpDAO.findMemberList();
	%>


    <div class="nm_table">
		<table>
        <thead>
            <tr>
                <th class="thead__th _center">아이디</th>
                <th class="thead__th _center _left">비밀번호</th>
                <th class="thead__th _center _left">이름</th>
                <th class="thead__th _center _left">이메일</th>
                <th class="thead__th _center _left">전화번호</th>
                <th class="thead__th _center _left">우편번호</th>
                <th class="thead__th _center _left">주소</th>
                <th class="thead__th _center _left">상세주소</th>
                <th class="thead__th _center _left">생년월일</th>
                <th class="thead__th _center _left">가입일</th>
                <th class="thead__th _center _left">설정</th>
            </tr>
        </thead>
        <% 
		for(SignUpDTO SignUpInfo : SignUpList){		
	%>
        <tbody>
		<tr>
		<td class="tbody__th _center _left"><%=SignUpInfo.getId()%></td>
		<td class="tbody__th _center _left"><%=SignUpInfo.getPassword()%></td>
		<td class="tbody__th _center _left"><%=SignUpInfo.getName()%></td>
		<td class="tbody__th _center _left"><%=SignUpInfo.getEmail()%></td>
		<td class="tbody__th _center _left"><%=SignUpInfo.getPhone()%></td>
		<td class="tbody__th _center _left"><%=SignUpInfo.getZipcode()%></td>
		<td class="tbody__th _center _left"><%=SignUpInfo.getAddress()%></td>
		<td class="tbody__th _center _left"><%=SignUpInfo.getAddress2()%></td>
		<td class="tbody__th _center _left"><%=SignUpInfo.getBirthday()%></td>
		<td class="tbody__th _center _left"><%=SignUpInfo.getIndate()%></td>
        <td class="tbody__th _center _left"><input type="button" value="정보 수정"></td>
		</tr>
        </tbody>
        
	<%
		}
	%>
	</table>
    </div>
</body>
</html>