package com.nb.web.productlist.dto;

public class ProductCategoryDTO {
	//왼쪽 카테고리에서 사용
	
	private String category_code;//카테고리 코드
	private String minor_sort;//카테고리 이름
	
	
	
	@Override
	public String toString() {
		return "ProductCategoryDTO [category_code=" + category_code + ", minor_sort=" + minor_sort + "]";
	}

	public ProductCategoryDTO(String category_code, String minor_sort) {
		super();
		this.category_code = category_code;
		this.minor_sort = minor_sort;
	}
	
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getMinor_sort() {
		return minor_sort;
	}
	public void setMinor_sort(String minor_sort) {
		this.minor_sort = minor_sort;
	}
}
