package db.dto;

public class CartDTO {

	String name;
	int price;
	String user_id;
	int goods_id;
	int quantity;
	String content;
	int cart_id;
	
	public CartDTO(int cart_id, String name, int price, int quantity, String content) {
		super();
		this.cart_id = cart_id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.content = content;
	}


	public int getCart_id() {
		return cart_id;
	}


	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public CartDTO() {}
	

	public CartDTO(String user_id, int goods_id, int quantity) {
		super();
		this.user_id = user_id;
		this.goods_id = goods_id;
		this.quantity = quantity;
	}
	
	
	

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
