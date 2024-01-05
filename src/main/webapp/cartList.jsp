<%@page import="db.dto.GoodsDTO"%>
<%@page import="db.dao.GoodsDAO"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.CartDTO"%>
<%@page import="db.dao.CartDAO"%>
<%@page import="db.dto.SignUpDTO"%>
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
	width:650px;
	height:50px;
}
.delbtn{
	margin-left:8px;
}
.delBtn{
	width:65px;
	height:25px;
	background: inherit;
	border:1px solid black;
	box-shadow:none;
	overflow:visible;
	cursor:pointer;
}
.buyBtn{
	width:65px;
	height:25px;
	background: inherit;
	border:1px solid black;
	box-shadow:none;
	overflow:visible;
	cursor:pointer;
}
.empcart{
	font-size: 25px;
	margin-top: 130px;
}
</style>

</head>
<body>
	<%@ include file="homewrap.jsp" %>
	<%@ include file="navigation.jsp" %>
	<%
	if(loggedInMember == null){
	%>
	<script>
		alert('로그인 후 이용가능합니다');
		location.href="main.jsp";
		</script>
	<%
	}else{
	%>
	<%

	System.out.println(loggedInMember.getId());
	
	CartDAO cartDAO = new CartDAO();
	GoodsDAO goodsDAO = new GoodsDAO();
	List<CartDTO> cartList = cartDAO.findCartList(loggedInMember.getId());
	%>

	<div class="container">
	<h1 style="margin-top:10px;">장바구니</h1>
	<% 
	if(cartList.isEmpty()){
	%>
    <div class="empcart">장바구니가 비었습니다</div>
    <%
    }else{
    %>
	
	<%
	for (CartDTO cart : cartList) {
	%>
	<div class="product">
		<div class="pro-content">
		<a href="./goodsList_proc.jsp?id=<%=cart.getGoods_id()%>"><%=cart.getName()%> <%=cart.getQuantity()%> <%=cart.getPrice()%></a>
		</div>
		<div class="buybtn">
		<button class="buyBtn" type="button" data-id="<%=cart.getGoods_id()%>">구매하기</button>
		</div>
		<div class="delbtn">
		<button class="delBtn" type="button" data-id="<%=cart.getGoods_id()%>">삭제하기</button>
		</div>
	</div>
	<input type="hidden" class="pdQuan" data-id="<%=cart.getGoods_id()%>" data-value="<%=cart.getQuantity() %>">
	<input type="hidden" class="gdQuan" data-id="<%=cart.getGoods_id()%>" data-value="<%=cart.getGoodsQuan() %>">
	<%
	}
	%>
	
	<form id="goodsForm" action="goods_proc.jsp" method="post">
	<input type="hidden" id="goodsId" name="id" value="">
	<input type="hidden" id="goodsCnt" name="count" value="">
	</form>
	</div>
	<script>

	let delArray = Array.from(document.getElementsByClassName('delBtn'));
	let buyArray = Array.from(document.getElementsByClassName('buyBtn'));
	let pdQuan = document.getElementsByClassName('pdQuan');
	
	delArray.forEach((delBtn) => {
		delBtn.addEventListener('click', () => {
			let form = document.getElementById('goodsForm');
  			let inputId = document.getElementById('goodsId');
		  
		  	let valueid = delBtn.dataset['id'];
		  	
		  	inputId.value = valueid;
		  	
		  	form.action = 'deleteCart_proc.jsp';
		  	form.submit();
		  	
		});
	});
	

	buyArray.forEach((buyBtn) => {
	    buyBtn.addEventListener('click', () => {
	        let form = document.getElementById('goodsForm');
	        let inputId = document.getElementById('goodsId');
	        let inputCnt = document.getElementById('goodsCnt');
	        let valueid = buyBtn.dataset['id'];

	        let pdQuanInput = document.querySelector('input[data-id="' + valueid + '"]');
	        let quanVal = pdQuanInput.dataset['value'];

	        let gdQuanInput = document.querySelector('.gdQuan[data-id="' + valueid + '"]');
	        let gdQuan = gdQuanInput.dataset['value'];

	        console.log("사용자가 선택한 수량: " + quanVal);
	        console.log("제품의 재고 수량: " + gdQuan);

	        if (quanVal > gdQuan) {
	            alert('남아있는 수량보다 많이 선택하였습니다');
	        } else {
	            inputId.value = valueid;
	            inputCnt.value = quanVal;
	            
	            form.action = 'totalOrder1.jsp';
	            form.submit();
	        }
	    });
	});
	</script>
	<%
	}
	%>
	<%
	}
	%>
</body>
</html>