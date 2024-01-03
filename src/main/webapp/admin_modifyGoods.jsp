<%@page import="db.dto.GoodsDTO"%>
<%@page import="db.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.title{
	width: 100%;
	height: 150px;
	background-color: #525d76;
	color: #ffffff;
	text-align: center;
	line-height: 145px;
}
a{
	text-decoration-line: none;
}
#input_name,
#input_price,
#input_quantity,
#input_content,
#input_caId{
	border-width: 0 0 1px;
}
.container{
	display:flex;
	justify-content: center;
}
.content{
	display:flex;
	width:100%;
	
}
.laname{
	width:150px;
	font-size: 20px;
	margin:30px;
}
.inputcss{
	width:400px;
	font-size: 20px;
}
.modibtn{
	display:flex;
	margin-top: 30px;
	margin-left: 220px;
}

#modifyBtn{
	width:200px;
	height:50px;
	background: inherit;
	border:1px solid black;
	box-shadow:none;
	overflow:visible;
	cursor:pointer;
}
</style>
</head>
<body>
	<%
	String id = request.getParameter("id");  //personInfo.jsp
	System.out.println(id);
	int intId = 0;
	try {
		intId = Integer.parseInt(id); //예외
	} catch (Exception e) {
		e.printStackTrace(); //예외 발생 기록
		intId = 0;
	}
	System.out.println(intId);
	GoodsDAO goodsDAO = new GoodsDAO();
	GoodsDTO goodsInfo = goodsDAO.findGoodsById(intId);
	%>
	
	<h2 class="title"><a href="admin_goodsList.jsp" style="color:white;">제품 수정</a></h2>
	<div class="container">
	<form id="modigoodsForm" action="admin_modifyGoods_proc.jsp" method="post">
		<input type="hidden" name="id" value="<%=goodsInfo.getId() %>">
		<div class="content">
		<label class="laname">이름</label><input class="inputcss" type="text" id="input_name" name="name"
			value="<%=goodsInfo.getName() %>">
		</div>
		<div class="content">
		<label class="laname">가격</label><input class="inputcss" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="input_price" name="price"
			value="<%=goodsInfo.getPrice() %>">
		</div>
		<div class="content">
		<label class="laname">수량</label><input class="inputcss" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="input_quantity" name="quantity"
			value="<%=goodsInfo.getQuantity() %>">
		</div>
		<div class="content">
		<label class="laname">내용</label><input class="inputcss" type="text" id="input_content" name="content"
			value="<%=goodsInfo.getContent() %>">
		</div>
		<div class="content">
		<label class="laname">카테고리ID</label><input class="inputcss" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="input_caId" name="ca_id"
			value="<%=goodsInfo.getCa_id() %>">
		</div>
		<div class="modibtn">
		<button id="modifyBtn" type="button">수정하기</button>
		</div>
	</form>
	</div>
	
	<script>
	document.getElementById('modifyBtn').addEventListener('click', ()=> {
    	if(confirm('수정 하시겠습니까?')){
		
    		let form = document.getElementById('modigoodsForm');
    		form.action = 'admin_modifyGoods_proc.jsp';
    		form.submit();
    	}
	});
	</script>
</body>
</html>