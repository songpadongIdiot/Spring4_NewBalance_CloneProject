package com.nb.web.productlist.dto;

public class ProductListDTO {

	private String pd_code;//상품코드
	private String color;//상품 컬러
	private String category_code;//카테고리코드
	private String pd_name;//상품이름
	private int pd_price;//상품 가격
	private int pd_memberonly;//맴버전용임?
	private int pd_mincount;//맴버전용일 때 최소 구매개수
	private String pd_feet;//발볼
	private int out_count;//판매개수->베스트 상품 매길 때 사용
	

	
	@Override
	public String toString() {
		return "ProductListDTO [pd_code=" + pd_code + ", color=" + color + ", category_code=" + category_code
				+ ", pd_name=" + pd_name + ", pd_price=" + pd_price + ", pd_memberonly=" + pd_memberonly
				+ ", pd_mincount=" + pd_mincount + ", pd_feet=" + pd_feet + ", out_count=" + out_count + "]";
	}
	
	
	
	public ProductListDTO() {
		super();
	}



	public ProductListDTO(String pd_code, String color, String category_code, String pd_name, int pd_price,
			int pd_memberonly, int pd_mincount, String pd_feet, int out_count) {
		super();
		this.pd_code = pd_code;
		this.color = color;
		this.category_code = category_code;
		this.pd_name = pd_name;
		this.pd_price = pd_price;
		this.pd_memberonly = pd_memberonly;
		this.pd_mincount = pd_mincount;
		this.pd_feet = pd_feet;
		this.out_count = out_count;
	}
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public int getPd_memberonly() {
		return pd_memberonly;
	}
	public void setPd_memberonly(int pd_memberonly) {
		this.pd_memberonly = pd_memberonly;
	}
	public int getPd_mincount() {
		return pd_mincount;
	}
	public void setPd_mincount(int pd_mincount) {
		this.pd_mincount = pd_mincount;
	}
	public String getPd_feet() {
		return pd_feet;
	}
	public void setPd_feet(String pd_feet) {
		this.pd_feet = pd_feet;
	}
	public int getOut_count() {
		return out_count;
	}
	public void setOut_count(int out_count) {
		this.out_count = out_count;
	}
	
	
}
