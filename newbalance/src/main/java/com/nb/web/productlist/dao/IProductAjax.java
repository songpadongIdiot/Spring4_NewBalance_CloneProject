package com.nb.web.productlist.dao;

import java.sql.SQLException;


import com.nb.web.productlist.dto.WishlistDTO;

public interface IProductAjax {

	// 관심상품 추가
	int addWishlist(WishlistDTO dto) throws SQLException;

	// 장바구니 추가
	//int addCartList(BuyProductDTO cartDto, String userCode) throws SQLException;

	// 상품문의 등록 
	// int addProductQna(ProductQnaDTO dto) throws SQLException; 
}