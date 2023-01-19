package com.nb.web.productlist.dto;

import java.math.BigDecimal;

public class ProductReviewDTO {

	private String pdCode;//상품코드
	private int countPOfReview;//리뷰개수
	private Double avgReview;//리뷰평균
	
	@Override
	public String toString() {
		return "ProductReviewDTO [pdCode=" + pdCode + ", countPOfReview=" + countPOfReview + ", avgReview=" + avgReview
				+ "]";
	}

	public ProductReviewDTO(String pdCode, BigDecimal countPOfReview, BigDecimal avgReview) {
		super();
		this.pdCode = pdCode;
		this.countPOfReview = countPOfReview.intValue();
		this.avgReview = avgReview.doubleValue();
	}

	public ProductReviewDTO(String pdCode, int countPOfReview, Double avgReview) {
		super();
		this.pdCode = pdCode;
		this.countPOfReview = countPOfReview;
		this.avgReview = avgReview;
	}
	
	
	
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public int getCountPOfReview() {
		return countPOfReview;
	}
	public void setCountPOfReview(int countPOfReview) {
		this.countPOfReview = countPOfReview;
	}
	public Double getAvgReview() {
		return avgReview;
	}
	public void setAvgReview(Double avgReview) {
		this.avgReview = avgReview;
	}
	
	
	
}
