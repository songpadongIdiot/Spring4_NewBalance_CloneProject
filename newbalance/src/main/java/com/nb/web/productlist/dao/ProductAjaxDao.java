package com.nb.web.productlist.dao;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nb.web.productlist.dto.WishlistDTO;

@Repository
public class ProductAjaxDao implements IProductAjax {

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate; 

	// 관심상품 추가
	public int addWishlist(WishlistDTO dto) throws SQLException {

		int rowCount = 0;
		System.out.println("WishList dao 호출됨");

		String sql = "SELECT count(*) count "
				+ "FROM wishlist "
				+ "WHERE user_code = :userCode  and pd_code  in ( :wishlist ) ";
		
		
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("userCode", dto.getUserCode());
		paramSource.addValue("wishlist", dto.getPdCode());
		
		
		String[] wishList = dto.getPdCode().split(",");
		
		int count = jdbcTemplate.queryForObject(sql, paramSource, Integer.class);

		if(count == 0) {
			for(int j = 0; j < wishList.length; j++) {
				String sql2 = "INSERT INTO wishlist VALUES ( "
						+ " wish_code.nextval, :pdCode, :userCode, SYSDATE, ADD_MONTHS(SYSDATE, 1)) ";

				MapSqlParameterSource paramSource2 = new MapSqlParameterSource();
				paramSource2.addValue("pdCode", wishList[j]);
				paramSource2.addValue("userCode", dto.getUserCode());

				rowCount = jdbcTemplate.update(sql2, paramSource2);
			}
		} else {
			rowCount = 0;
		}
		return rowCount;
	}



}

