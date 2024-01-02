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
	height: 150px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 145px;
}

#topMenu {            
    height: 30px; 
    width: 850px; 
}
#topMenu ul li {                       
    list-style: none;          
    color: white;               
    background-color: #525d76;  
    float: left;                
    line-height: 30px;          
    vertical-align: middle;     
    text-align: center;        
}
#topMenu .menuLink {                               
    text-decoration:none;                     
    color: white;                             
    display: block;                            
    width: 150px;                              
    font-size: 12px;                           
    font-weight: bold;                         
    font-family: "Trebuchet MS", Dotum, Arial; 
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
    </ul>
</nav>

</body>
</html>