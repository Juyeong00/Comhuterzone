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
	width: 50%;
	height: 100px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 100px;
	cursor: pointer;
	margin: 0 auto;
	border: 0;
	display: flex;
	align-content: center;
    flex-wrap: wrap;
    justify-content: center;
}


#topMenu {            
        height: 200px; 
        width: 50%; 
        margin: 0 auto;
 border: 0;
 border: solid 1px #525d76;
}
#topMenu ul li {                       
        list-style: none;          
        color: white;               
        background-color: #f6f8fa;                 
        vertical-align: middle;     
        text-align: center;  
        line-height: 50px;   
        font-size: 14px;
		margin-bottom: 10px;
		border: none;
		border-radius: 5px;
		padding: 10px;
 }
#topMenu .menuLink {                               
    text-decoration:none;                     
    color: #000000;                             
    display: block;                                                                                
    font-weight: bold;  
    margin: 0 auto;
	border: 0;                       
}
#topMenu .menuLink:hover {            
    color: #ffffff;                   
    background-color: #000000;    
}
 </style>


</head>
<body>

    <h2 class="title">관리자 페이지</h2>

<nav id="topMenu">
    <ul>
        <li><a class="menuLink" href="memberList.jsp">회원 목록</a></li>
        <li><a class="menuLink" href="admin_goodsList.jsp">제품 목록</a></li>
        <li><a class="menuLink" href="admin_processStatus.jsp">처리상태 수정</a></li>
    </ul>
</nav>
	<div class="ftbox">
            <div class="ftbox" onclick="history_go1()">
                <h2>이전 페이지</h2>
            </div>
            <div class="ftbox" onclick="location.href='main.jsp'">
                <h2>메인으로 돌아가기</h2>
            </div>
        </div>
<script>
	function history_go1(){
		history.go(-1);
	}
</script>
</body>
</html>