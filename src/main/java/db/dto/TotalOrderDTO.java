package db.dto;

public class TotalOrderDTO {

	String orderDate;
	int orderId;
	String userName;
	String userId;
	String deliveryRequest;
	String PhoneNum;
	int memberAdd1;
	String memberAdd2;
	String memberAdd3;
	String paymentCard;
	int totalAmount;
	String processing;
	
	
	
	
	
	public TotalOrderDTO( int orderId, String orderDate, String userName, String userId, String deliveryRequest,
			String phoneNum, int memberAdd1, String memberAdd2, String memberAdd3, String paymentCard, int totalAmount,
			String processing) {
		super();
		this.orderDate = orderDate;
		this.orderId = orderId;
		this.userName = userName;
		this.userId = userId;
		this.deliveryRequest = deliveryRequest;
		PhoneNum = phoneNum;
		this.memberAdd1 = memberAdd1;
		this.memberAdd2 = memberAdd2;
		this.memberAdd3 = memberAdd3;
		this.paymentCard = paymentCard;
		this.totalAmount = totalAmount;
		this.processing = processing;
	}


	public TotalOrderDTO(int orderId) {
		super();
		this.orderId = orderId;
	}


	public TotalOrderDTO(String orderDate, int orderId, String userName, String userId, String deliveryRequest,
			String phoneNum, int memberAdd1, String memberAdd2, String memberAdd3, String paymentCard, int totalAmount,
			String processing) {
		super();
		this.orderDate = orderDate;
		this.orderId = orderId;
		this.userName = userName;
		this.userId = userId;
		this.deliveryRequest = deliveryRequest;
		PhoneNum = phoneNum;
		this.memberAdd1 = memberAdd1;
		this.memberAdd2 = memberAdd2;
		this.memberAdd3 = memberAdd3;
		this.paymentCard = paymentCard;
		this.totalAmount = totalAmount;
		this.processing = processing;
	}
	public TotalOrderDTO(String string) {
		// TODO Auto-generated constructor stub
		this.processing = string;
	}


	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDeliveryRequest() {
		return deliveryRequest;
	}
	public void setDeliveryRequest(String deliveryRequest) {
		this.deliveryRequest = deliveryRequest;
	}
	public String getPhoneNum() {
		return PhoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		PhoneNum = phoneNum;
	}
	public int getMemberAdd1() {
		return memberAdd1;
	}
	public void setMemberAdd1(int memberAdd1) {
		this.memberAdd1 = memberAdd1;
	}
	public String getMemberAdd2() {
		return memberAdd2;
	}
	public void setMemberAdd2(String memberAdd2) {
		this.memberAdd2 = memberAdd2;
	}
	public String getMemberAdd3() {
		return memberAdd3;
	}
	public void setMemberAdd3(String memberAdd3) {
		this.memberAdd3 = memberAdd3;
	}
	public String getPaymentCard() {
		return paymentCard;
	}
	public void setPaymentCard(String paymentCard) {
		this.paymentCard = paymentCard;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getProcessing() {
		return processing;
	}
	public void setProcessing(String processing) {
		this.processing = processing;
	}
	
}

