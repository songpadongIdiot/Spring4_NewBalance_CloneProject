package com.nb.web.productlist.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.nb.web.productlist.dto.ProductDTO;
import com.nb.web.productlist.dto.ProductImgDTO;
import com.nb.web.productlist.dto.ProductModalColor;
import com.nb.web.productlist.dto.ProductSizeStockDTO;


public interface ProductModalDao {

	// 상품 정보
	ProductDTO selectProduct(String pdCode) throws SQLException; 
	
	// 상품별 이미지 리스트
	ArrayList<ProductImgDTO> selectImage(String pdCode) throws SQLException;
	
	// 상품별 사이즈 리스트
	ArrayList<ProductSizeStockDTO> selectSize(String pdCode) throws SQLException;
	
	// 상품명이 같고 컬러만 다른 상품 리스트
	ArrayList<ProductModalColor> diffColorProduct(String pdCode) throws SQLException;

	
}
