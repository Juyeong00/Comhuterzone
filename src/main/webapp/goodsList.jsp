<%@page import="db.dto.CartDTO"%>
<%@page import="db.dao.CartDAO"%>
<%@page import="java.util.List"%>
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
.container{
	display:flex;
	flex-direction: column;
	align-items:center;
}
.product{
	display:flex;
	margin:5px;
	margin-top:15px;
	border-bottom: 1px solid;	
}
.pro-content{
	width:500px;
	height:50px;
}
.pro-info{
	margin-left:15px;
}
.putBtn, .buyBtn{
	width:65px;
	height:25px;
	background: inherit;
	border:1px solid black;
	box-shadow:none;
	overflow:visible;
	cursor:pointer;
}
</style>
</head>
<body>
	<%@ include file="homewrap.jsp" %>
	<%@ include file="navigation.jsp" %>

	<%
	
	String id = request.getParameter("id");
	System.out.println(id);
	int intId = 0;
	try {
		intId = Integer.parseInt(id);
	} catch (Exception e) {
		e.printStackTrace();
		intId = 0;
	}
	GoodsDAO goodsDAO = new GoodsDAO();
	List<GoodsDTO> goodsList = goodsDAO.findDesktopList(intId);
	GoodsDTO goods = goodsDAO.findCategoryById(intId);
	%>
	
	<div class="container">
	
	<h1 style="margin-top:10px;"><%=goods.getName() %></h1>
	
	<%
	for (GoodsDTO good : goodsList) {
	%>
	
	<div class="product">
		<div class="pro-content">
		<span>
		<a href="./goodsList_proc.jsp?id=<%=good.getId()%>"><%=good.getName()%> <%=good.getPrice() %>원 <%=good.getQuantity() %>개 남음</a>
		</span>
		</div>

		<div class="pro-info">
		<input style="width:40px; height:25px;" type="number" data-id="<%=good.getId()%>" min="1" max="999" value="1">
		<button class="putBtn" type="button" data-id="<%=good.getId()%>">장바구니</button>
		<button class="buyBtn" type="button" data-id="<%=good.getId()%>">구매하기</button>
		
		</div>
		
	</div>
	<input type="hidden" class="pdQuan" data-id="<%=good.getId()%>" data-value="<%=good.getQuantity() %>">
	<%
	}
	%>
	<form id="goodsForm" action="goods_proc.jsp" method="post">
	
	<input type="hidden" id="goodsId" name="id" value="">
	<input type="hidden" id="goodsCnt" name="count" value="">
	
	</form>
	</div>
	<script>

  		let btnArray = Array.from(document.getElementsByClassName('buyBtn'));
  		let cartArray = Array.from(document.getElementsByClassName('putBtn'));
		let pdQuan = document.getElementsByClassName('pdQuan');

		btnArray.forEach((buyBtn) => {
			buyBtn.addEventListener('click', () => {
				let form = document.getElementById('goodsForm');
	  			let inputId = document.getElementById('goodsId');
			  
			  	let valueid = buyBtn.dataset['id'];
			    for (let i=0; i<pdQuan.length; i++) {
					if(pdQuan[i].dataset['id'] === valueid) {
		                quanVal = pdQuan[i].dataset['value'];
		                break;
		            }
		        }
		        console.log(quanVal);
			  	
			  	inputId.value = valueid;
			  	
			  	let inputCnt = document.getElementById('goodsCnt');
			  	let gcnt = document.querySelector('input[data-id="'+ valueid + '"]');
			  	
			  	let valuecnt = gcnt.value;
			  	
			  	inputCnt.value = valuecnt;
			  	
		  		if(inputCnt.value > quanVal){
			  		console.log(quanVal);
			  		alert('남아있는 수량보다 많이 선택하였습니다');
			  		event.preventDefault();
			  	}else{
				  	form.action = 'buyGoods.jsp';
				  	form.submit();  	
			  	}
			  	
			});
		});
		
		cartArray.forEach((putBtn) => {
			putBtn.addEventListener('click', () => {
				let form = document.getElementById('goodsForm');
	  			let inputId = document.getElementById('goodsId');
			  
			  	let valueid = putBtn.dataset['id'];
			    for (let i=0; i<pdQuan.length; i++) {
		            if (pdQuan[i].dataset['id'] === valueid) {
		                quanVal = pdQuan[i].dataset['value'];
		                break;
		            }
		        }
		        console.log(quanVal);
			  	
			  	inputId.value = valueid;
			  	
			  	let inputCnt = document.getElementById('goodsCnt');
			  	let gcnt = document.querySelector('input[data-id="'+ valueid + '"]');
			  	
			  	let valuecnt = gcnt.value;
			  	
			  	inputCnt.value = valuecnt;
			  	
			  	
		  		if(inputCnt.value > quanVal){
			  		console.log(quanVal);
			  		alert('남아있는 수량보다 많이 선택하였습니다');
			  		event.preventDefault();
			  	}else{
				  	form.action = 'addCart.jsp';
				  	form.submit();
			  	}
			  	
			});
		});
  
	</script>


</body>
</html>