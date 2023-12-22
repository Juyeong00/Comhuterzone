package db.dto;

public class SignUpDTO {
	
	//int id;				//회원고유번호
	String id;	//아이디
	String password;	//비밀번호
	String name;		//이름
	String email;		//이메일
	String phone;		//전화번호
	String zipcode;		//우편번호
	String address;		//주소
	String address2;	//주소2
	String birthday;	//생년월
	String indate;		//생성일자
	
	public SignUpDTO(String id, String password, String name, String email, String phone, String zipcode,
			String address, String address2, String birthday, String indate) {
		super();
		//this.id = id;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address = address;
		this.address2 = address2;
		this.birthday = birthday;
		this.indate = indate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}
	
	
	
}
