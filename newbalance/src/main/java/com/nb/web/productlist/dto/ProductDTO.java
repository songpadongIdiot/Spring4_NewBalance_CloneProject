package com.nb.web.productlist.dto;

import lombok.Data;

@Data
public class ProductDTO {

	private String pdCode;
	private String categoryCode;
	private String pdName;
	private int pdPrice;
	private int pdMemberonly;
	private int pdMincount;
	private String pdCountry;
	private String pdFrom;
	private String pdDate;
	private String pdMaterial;
	private String pdFeet;
	private String pdRelease;
	private String pdFeature;
	private String imgUrl;  // 첫 번째 이미지 저장
/*		
	
	// 생성자
	public ProductDTO() {
		super();
	}
	
	
	
	public ProductDTO(String pdCode, String categoryCode, String pdName, int pdPrice, int pdMemberonly, int pdMincount,
			String pdCountry, String pdFrom, String pdDate, String pdMaterial, String pdFeet, String pdRelease,
			String pdFeature, String imgUrl) {
		super();
		this.pdCode = pdCode;
		this.categoryCode = categoryCode;
		this.pdName = pdName;
		this.pdPrice = pdPrice;
		this.pdMemberonly = pdMemberonly;
		this.pdMincount = pdMincount;
		this.pdCountry = pdCountry;
		this.pdFrom = pdFrom;
		this.pdDate = pdDate;
		this.pdMaterial = pdMaterial;
		this.pdFeet = pdFeet;
		this.pdRelease = pdRelease;
		this.pdFeature = pdFeature;
		this.imgUrl = imgUrl;
	}



	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
	public int getPdMemberonly() {
		return pdMemberonly;
	}
	public void setPdMemberonly(int pdMemberonly) {
		this.pdMemberonly = pdMemberonly;
	}
	public int getPdMincount() {
		return pdMincount;
	}
	public void setPdMincount(int pdMincount) {
		this.pdMincount = pdMincount;
	}
	public String getPdCountry() {
		return pdCountry;
	}
	public void setPdCountry(String pdCountry) {
		this.pdCountry = pdCountry;
	}
	public String getPdFrom() {
		return pdFrom;
	}
	public void setPdFrom(String pdFrom) {
		this.pdFrom = pdFrom;
	}
	public String getPdDate() {
		return pdDate;
	}
	public void setPdDate(String pdDate) {
		this.pdDate = pdDate;
	}
	public String getPdMaterial() {
		return pdMaterial;
	}
	public void setPdMaterial(String pdMaterial) {
		this.pdMaterial = pdMaterial;
	}
	public String getPdFeet() {
		return pdFeet;
	}
	public void setPdFeet(String pdFeet) {
		this.pdFeet = pdFeet;
	}
	public String getPdRelease() {
		return pdRelease;
	}
	public void setPdRelease(String pdRelease) {
		this.pdRelease = pdRelease;
	}
	public String getPdFeature() {
		return pdFeature;
	}
	public void setPdFeature(String pdFeature) {
		this.pdFeature = pdFeature;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	@Override
	public String toString() {
		return "ProductDTO [pdCode=" + pdCode + ", categoryCode=" + categoryCode + ", pdName=" + pdName + ", pdPrice="
				+ pdPrice + ", pdMemberonly=" + pdMemberonly + ", pdMincount=" + pdMincount + ", pdCountry=" + pdCountry
				+ ", pdFrom=" + pdFrom + ", pdDate=" + pdDate + ", pdMaterial=" + pdMaterial + ", pdFeet=" + pdFeet
				+ ", pdRelease=" + pdRelease + ", pdFeature=" + pdFeature + ", imgUrl=" + imgUrl + "]";
	}
	*/
}
