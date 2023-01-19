package com.nb.web.productlist.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.nb.web.productlist.dto.ProductCategoryDTO;
import com.nb.web.productlist.dto.ProductColorDTO;
import com.nb.web.productlist.dto.ProductImgDTO;
import com.nb.web.productlist.dto.ProductListDTO;
import com.nb.web.productlist.dto.ProductReviewDTO;
import com.nb.web.productlist.dto.ProductSizeStockDTO;

public interface ProductListDao {

		//1. 상품테이블 조회
		List<ProductListDTO> selectProductList(String category_code, String gender) throws SQLException;
		
		//2. 상품이미지 조회
		ArrayList<ProductImgDTO> seletProductImg(String pdCode) throws SQLException;
		
		//3. 상품 사이즈에 대한 재고
		ArrayList<ProductSizeStockDTO> selectProductSizeStock(String pdCode) throws SQLException;
		
		//4. 카테고리 코드
		List<ProductCategoryDTO> category( String category_code, String gender) throws SQLException;
		
		//5. 평점
		ProductReviewDTO selectProductReview(String pdCode) throws SQLException;
		
		//6. 카테고리에서 사이즈
		List<ProductSizeStockDTO> selectSizeCategory(String category_code, String gender) throws SQLException;
		
		//7. 카테고리에서 발볼
		List<ProductListDTO>selectFeet(String category_code, String gender) throws SQLException;
		
		//8. 카테고리 컬러
		List<ProductColorDTO>selectColor(String category_code, String gender) throws SQLException;
		
	
	
	
	
	
	
	
	
}
