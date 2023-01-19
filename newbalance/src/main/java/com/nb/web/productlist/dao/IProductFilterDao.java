package com.nb.web.productlist.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nb.web.productlist.dto.ProductImgDTO;
import com.nb.web.productlist.dto.ProductListDTO;
import com.nb.web.productlist.dto.ProductReviewDTO;
import com.nb.web.productlist.dto.ProductSizeStockDTO;

public interface IProductFilterDao {
	//0. 상품 정보리스트 -> key 뽑아내기 용도
	//LinkedHashMap< String, ProductListDTO> 
	ArrayList<ProductListDTO> productInfoAjax(						  	 
			String soldOutYn
			, String sizeCode
			, String feetWidth
			, String colorCode
			, String subCateIdx
			, String[][] priceRange
			, String sortProducts
			, String cateGrpCode
			, String cIdx				
			) throws SQLException;
	
	//1. 상품 정보
	ProductListDTO productInfo( String pdCode) throws SQLException;
	
	//2. 상품 이미지 필터
	//LinkedHashMap< String, ArrayList<ProductImgDTO>> 
	List<ProductImgDTO>	productImg(	String pdCode	) throws SQLException;
	
	//3. 재고
	List<ProductSizeStockDTO>	productSizeStock( String pdCode) throws SQLException;				 
	
	//4. 평점
	List<ProductReviewDTO> productReview(	String pdCode) throws SQLException;		
	
/*	
	//1. 상품 이미지 필터
	//LinkedHashMap< String, ArrayList<ProductImgDTO>> 
	ArrayList<ProductImgDTO>	productImgAjax(							 
			String soldOutYn
			, String sizeCode
			, String feetWidth
			, String colorCode
			, String subCateIdx
			, String[][] priceRange
			, String sortProducts
			, String cateGrpCode
			, String cIdx				
			) throws SQLException;
	
	//2. 상품 사이즈 재고들
	//LinkedHashMap< String, ArrayList<ProductSizeStockDTO>> 
	ArrayList<ProductSizeStockDTO>	productSizeStockAjax(					 
			String soldOutYn
			, String sizeCode
			, String feetWidth
			, String colorCode
			, String subCateIdx
			, String[][] priceRange
			, String sortProducts
			, String cateGrpCode
			, String cIdx				
			) throws SQLException;
	
	//3. 상품 평점
	//LinkedHashMap< String, ArrayList<ProductReviewDTO>> 
	ArrayList<ProductReviewDTO> productReviewAjax(						  
			String soldOutYn
			, String sizeCode
			, String feetWidth
			, String colorCode
			, String subCateIdx
			, String[][] priceRange
			, String sortProducts
			, String cateGrpCode
			, String cIdx				
			) throws SQLException;
											
*/
}
