package com.nb.web.productlist.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.nb.web.productlist.dto.ProductImgDTO;
import com.nb.web.productlist.dto.ProductListDTO;
import com.nb.web.productlist.dto.ProductReviewDTO;
import com.nb.web.productlist.dto.ProductSizeStockDTO;

@Repository
public class ProductFilterDao implements IProductFilterDao{

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;
	
	@Override
	public ArrayList<ProductListDTO> productInfoAjax(String soldOutYn, String sizeCode, String feetWidth,
			String colorCode, String subCateIdx, String[][] priceRange, String sortProducts, String cateGrpCode,
			String cIdx) throws SQLException {

		String sql = 
				" SELECT DISTINCT(p.pd_code) pd_code,  substr(p.pd_code,9,2) color , p.category_code category_code"
				+ "					 , pd_name , pd_price "
			+ "                        , pd_memberonly , NVL(pd_mincount,0) pd_mincount  ,pd_feet ,  NVL(out_count, 0) out_count "
			+ "						,pd_release	"	
			+ " FROM product p JOIN product_detail pd ON p.pd_code = pd.pd_code "
			+ "            FULL OUTER JOIN product_out o on p.pd_code = o.pd_code "
			+ " WHERE p.pd_code IN ( "
			+ "        SELECT ps.pd_code "
			+ "        FROM product_stock ps JOIN product_detail pd ON ps.pd_code = pd.pd_code ";
			if(cateGrpCode.equals("K")) {//아동
				sql += " WHERE ( substr(ps.pd_code,1,1) = :cateGrpCode ";
			}else {//성인
				sql += " WHERE ( substr(ps.pd_code,1,1) = 'U' OR substr(ps.pd_code,1,1) = :cateGrpCode )";
			}
		
			if(sizeCode != "null") {//사이즈
				sql += 	" 			AND ps.size_code in ( " + sizeCode + " )  ";
			}else {
				sql += "";
			}
	
			if(feetWidth != "null") {//발볼
				sql += 	" 			AND pd_feet in ( " + feetWidth + " ) ";
			}
		
			if(colorCode!="null") {//컬러
				sql +=	" 			AND substr(ps.pd_code,9,2) in ( " + colorCode + " ) "; // 02, 20, 57
			}
	
			if(subCateIdx!= "null") {//카테고리들
				sql += 	" 			AND substr(ps.pd_code,2,3) in ( " + subCateIdx + " ) "; // "F01" , "F02"
			}
	
			if(priceRange != null) {//가격범위
				sql += 	" 			AND ( ";
				for (int i = 0; i < priceRange.length; i++) {
					sql += 	"				pd_price >= " + priceRange[i][0] + " AND pd_price < " + priceRange[i][1];
					sql += i != priceRange.length -1 ? " OR ": ")";
				}
			}
				sql += 	" 			GROUP BY ps.pd_code ";
			if(soldOutYn != null) {//품절상품 제외
				sql +=	" 			HAVING SUM(stock_count) > 0 ";
			}
				sql += 	" ) ";
			if(sortProducts != "null") {//정렬들(가격순, 신상품순....)
				if(sortProducts.equals("Q01")) {
					sql += " ORDER BY pd_release DESC NULLS LAST ";
				}else if(sortProducts.equals("Q02")) {
					sql += " ORDER BY out_count DESC NULLS LAST ";
				}else if(sortProducts.equals("Q03")) {
					sql += " ORDER BY pd_price DESC ";
				}else if(sortProducts.equals("Q04")) {
					sql += " ORDER BY pd_price ASC ";
				}
			}
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("cateGrpCode", cateGrpCode);
			
			ArrayList<ProductListDTO> arraylist = (ArrayList<ProductListDTO>) this.jdbcTemplate.query(sql, paramMap, new BeanPropertyRowMapper<ProductListDTO>(ProductListDTO.class) );
		
		return arraylist;
	}

	@Override
	public ProductListDTO productInfo(String pdCode) throws SQLException {
		String sql = 
				" SELECT DISTINCT(p.pd_code) pd_code,  substr(p.pd_code,9,2) color , p.category_code category_code"
				+ "					 , pd_name , pd_price "
			+ "                        , pd_memberonly , NVL(pd_mincount,0) pd_mincount  ,pd_feet ,  NVL(out_count, 0) out_count "
			+ "						,pd_release	"	
			+ " FROM product p JOIN product_detail pd ON p.pd_code = pd.pd_code "
			+ "            FULL OUTER JOIN product_out o on p.pd_code = o.pd_code "
			+ " WHERE p.pd_code = :pdCode ";
		
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("pdCode", pdCode);
		
		return this.jdbcTemplate.queryForObject(sql, paramSource, new BeanPropertyRowMapper<ProductListDTO>(ProductListDTO.class));

	}

	@Override
	public List<ProductImgDTO> productImg(String pdCode) throws SQLException {
		String sql = 
				" SELECT t.row_num imgRowNumber, t.pd_code pd_code, t.img_url img_url " 
			+ " FROM( "
			+ "    SELECT ROW_NUMBER() OVER(PARTITION BY pd_code ORDER BY pd_code) row_num, pd_code, img_url "
			+ "    FROM product_image " 
			+ "    WHERE pd_code = :pdCode " 
			+ " )t " 
			+ " WHERE t.row_num <= 5 "
			+ " ORDER BY imgRowNumber ASC ";
		
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("pdCode", pdCode);
		
		List<ProductImgDTO> list =  this.jdbcTemplate.query(sql, paramSource, new BeanPropertyRowMapper<ProductImgDTO>(ProductImgDTO.class));
		
		return list;
	}

	@Override
	public List<ProductSizeStockDTO> productSizeStock(String pdCode) throws SQLException {
		String sql = 
				" SELECT product_stock.pd_code pd_code, size_list.size_code size_code, stock_count , sz"
						+ " FROM product join product_stock on product.pd_code = product_stock.pd_code "
						+ "                    join size_list on product_stock.size_code = size_list.size_code "
						+ " WHERE product_stock.pd_code = :pdCode ";
		
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("pdCode", pdCode);
		
		List<ProductSizeStockDTO> list =  this.jdbcTemplate.query(sql, paramSource, new BeanPropertyRowMapper<ProductSizeStockDTO>(ProductSizeStockDTO.class));
		
		return list;
	}

	@Override
	public List<ProductReviewDTO> productReview(String pdCode) throws SQLException {
		
		String sql = 
				" SELECT product.pd_code pdCode, count(DISTINCT(product.pd_code)) countPOfReview , avg(rev_starscore) avgReview "
			+ " FROM product join order_info on product.pd_code = order_info.pd_code "
			+ "            join order_list on order_info.ord_code = order_list.ord_code "
			+ "            join user_info on user_info.user_code = order_list.user_code "
			+ "            join review on review.user_code = user_info.user_code "
			+ " WHERE product.pd_code = :pdCode "
			+ " GROUP BY product.pd_code ";
		
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("pdCode", pdCode);
		
		List<ProductReviewDTO> list =  this.jdbcTemplate.query(sql, paramSource, new BeanPropertyRowMapper<ProductReviewDTO>(ProductReviewDTO.class));
		
		return list;
	}

}
