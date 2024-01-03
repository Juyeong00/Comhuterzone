package db.dto;

import java.time.LocalDateTime;

public class GoodsDTO {

	int ca_id;
	int ca_ref;
	String ca_name;
	int id;
	String name;
	int price;
	String content;
	LocalDateTime regist_date;
	int quantity;


	public GoodsDTO(String name, int price, int quantity, String content, int ca_id, int id) {
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.content = content;
		this.ca_id = ca_id;
		this.id = id;
	}


	public GoodsDTO(int id, String name, int price, String content, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.content = content;
		this.quantity = quantity;
	}


	public GoodsDTO(int id, String name, int price, int quantity, String content, LocalDateTime regist_date, int ca_id) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.content = content;
		this.regist_date = regist_date;
		this.ca_id = ca_id;
	}

	public GoodsDTO() {}

	public String getContent() {
		return content;
	}

	public GoodsDTO(int id, String name, String content, int price) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.content = content;
	}

	public GoodsDTO(int id, String name, int price, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getRegist_date() {
		return regist_date;
	}

	public void setRegist_date(LocalDateTime regist_date) {
		this.regist_date = regist_date;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public GoodsDTO(int id, String name, String content) {
		super();
		this.id = id;
		this.name = name;
		this.content = content;
	}

	public GoodsDTO(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public GoodsDTO(int ca_id, int ca_ref, String ca_name, int id, String name, int price) {
		super();
		this.ca_id = ca_id;
		this.ca_ref = ca_ref;
		this.ca_name = ca_name;
		this.id = id;
		this.name = name;
		this.price = price;
	}

	public GoodsDTO(String name) {
		super();
		this.name = name;
	}

	public GoodsDTO(int id) {
		super();
		this.id = id;
	}

	public GoodsDTO(int id, String name, int price) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
	}

	public int getCa_id() {
		return ca_id;
	}

	public void setCa_id(int ca_id) {
		this.ca_id = ca_id;
	}

	public int getCa_ref() {
		return ca_ref;
	}

	public void setCa_ref(int ca_ref) {
		this.ca_ref = ca_ref;
	}

	public String getCa_name() {
		return ca_name;
	}

	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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


	public GoodsDTO(String name, int price, int quantity, String content, int ca_id) {
		super();
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.content = content;
		this.ca_id = ca_id;
	}

	

}
