<%@ page import="db.dao.TotalOrderDAO" %>
<%@ page import="db.dto.SignUpDTO" %>
<%@ page import="db.dto.GoodsDTO" %>
<%@ page import="db.dao.GoodsDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보 저장</title>
</head>
<body>

<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id"); //personInfo.jsp
		String count = request.getParameter("count");
		String orderName = request.getParameter("orderName");
		String tel2 = request.getParameter("tel2");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String card = request.getParameter("card");
		
		
		//System.out.println(id);
		//System.out.println(count);
		
		int intId = 0;
		try{
			intId = Integer.parseInt(id); //예외
		} catch (Exception e){
			e.printStackTrace(); //예외 발생 기록
			intId = 0;
		}
		
		int intCount = 1;
		
		try {
			intCount = Integer.parseInt(count); //예외
		} catch (Exception e) {
			e.printStackTrace(); //예외 발생 기록
			intCount = 1;	
		}
    
	SignUpDTO loggedInMember = (SignUpDTO)session.getAttribute("loggedInMember");
	GoodsDAO goodsDAO = new GoodsDAO();
	GoodsDTO goods = goodsDAO.findDeskDetailById(intId);
	GoodsDTO go = goodsDAO.findDeskDetailById2(intId);	
    // TotalOrderDAO 객체 생성
    TotalOrderDAO totalOrderDAO = new TotalOrderDAO();

	

    // 새로운 주문 정보 저장
    int result = totalOrderDAO.saveTotalOrder(
        loggedInMember.getName(),
        loggedInMember.getId(),
        loggedInMember.getPhone(),
        Integer.parseInt(loggedInMember.getZipcode()),
        loggedInMember.getAddress(),
        loggedInMember.getAddress2(),
        "카드 종류",  // 여기에 카드 정보를 어떻게 받아올지에 대한 코드가 필요합니다.
        goods.getPrice() * intCount
    );

    if (result > 0) {
        // 주문이 성공적으로 저장된 경우
%>
        <script>
            alert('주문이 성공적으로 저장되었습니다.');
            location.href = 'orderedGoods.jsp';
        </script>
<%
    } else {
        // 주문 저장 실패 시
%>
        <script>
            alert('주문 저장 실패');
            history.back(); // 뒤로가기
        </script>
<%
    }
%>

</body>
</html>