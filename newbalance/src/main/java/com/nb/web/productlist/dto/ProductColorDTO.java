package com.nb.web.productlist.dto;


public class ProductColorDTO {
	//이미지 1~5에 대한 컬로코드, 컬러 url -> 왼쪽 카테고리에서 사용하는건가?
	private int imgRowNumber;//이미지 seq
	private String color_code;//컬로 코드
	private String color_url;//컬러 url
	
	public ProductColorDTO(String color_code, String color_url) {
		super();
		this.color_code = color_code;
		this.color_url = color_url;
	}
	
	public ProductColorDTO(int imgRowNumber, String color_code, String color_url) {
		super();
		this.imgRowNumber = imgRowNumber;
		this.color_code = color_code;
		this.color_url = color_url;
	}
	
	public int getImgRowNumber() {
		return imgRowNumber;
	}
	public void setImgRowNumber(int imgRowNumber) {
		this.imgRowNumber = imgRowNumber;
	}
	public String getColor_code() {
		return color_code;
	}
	public void setColor_code(String color_code) {
		this.color_code = color_code;
	}
	public String getColor_url() {
		return color_url;
	}
	public void setColor_url(String color_url) {
		this.color_url = color_url;
	}
	
}
