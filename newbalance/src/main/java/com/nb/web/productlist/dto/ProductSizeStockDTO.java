package com.nb.web.productlist.dto;

import java.math.BigDecimal;

public class ProductSizeStockDTO {

	private String pd_code;
	private int size_code;
	private int stock_count;
	private String sz;

	
	@Override
	public String toString() {
		return "ProductSizeStockDTO [pd_code=" + pd_code + ", size_code=" + size_code + ", stock_count=" + stock_count
				+ ", sz=" + sz + "]";
	}
	

	public ProductSizeStockDTO() {
		super();
	}


	public ProductSizeStockDTO(String pd_code, BigDecimal size_code, BigDecimal stock_count, String sz) {
		super();
		this.pd_code = pd_code;
		this.size_code = size_code.intValue();
		this.stock_count = stock_count.intValue();
		this.sz = sz;
	}
	
	public ProductSizeStockDTO(String pd_code, int size_code, int stock_count, String sz) {
		super();
		this.pd_code = pd_code;
		this.size_code = size_code;
		this.stock_count = stock_count;
		this.sz = sz;
	}
	
	
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	public int getSize_code() {
		return size_code;
	}
	public void setSize_code(int size_code) {
		this.size_code = size_code;
	}
	public int getStock_count() {
		return stock_count;
	}
	public void setStock_count(int stock_count) {
		this.stock_count = stock_count;
	}
	public String getSz() {
		return sz;
	}
	public void setSz(String sz) {
		this.sz = sz;
	}
	
}
