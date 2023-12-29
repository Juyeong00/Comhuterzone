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
</head>
<body>

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
	
	<h1><%=goods.getName() %></h1>
	
	<%@ include file="navigation.jsp" %>

	<%
	for (GoodsDTO good : goodsList) {
	%>
	<p>
	<a href="./goodsList_proc.jsp?id=<%=good.getId()%>"><%=good.getName()%> <%=good.getPrice() %>원 <%=good.getQuantity() %>개 남음</a>
	</p>
	<input type="number" data-id="<%=good.getId()%>" min="1" max="999" value="1">
	<button class="putBtn" type="button" data-id="<%=good.getId()%>">장바구니</button>
	<button class="buyBtn" type="button" data-id="<%=good.getId()%>">구매하기</button>
	<input type="hidden" class="pdQuan" data-id="<%=good.getId()%>" data-value="<%=good.getQuantity() %>">
	<%
	}
	%>
	<form id="goodsForm" action="goods_proc.jsp" method="post">
	
	<input type="hidden" id="goodsId" name="id" value="">
	<input type="hidden" id="goodsCnt" name="count" value="">
	
	</form>
	
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
			  		alert('수량부족');
			  		event.preventDefault();
			  	}else{
				  	form.action = 'totalOrder1.jsp';
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
			  		alert('수량부족');
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