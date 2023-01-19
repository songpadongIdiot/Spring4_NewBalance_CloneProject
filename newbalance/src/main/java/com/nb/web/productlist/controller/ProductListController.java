package com.nb.web.productlist.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nb.web.productlist.dao.ProductListDao;
import com.nb.web.productlist.dto.ProductCategoryDTO;
import com.nb.web.productlist.dto.ProductColorDTO;
import com.nb.web.productlist.dto.ProductImgDTO;
import com.nb.web.productlist.dto.ProductListDTO;
import com.nb.web.productlist.dto.ProductReviewDTO;
import com.nb.web.productlist.dto.ProductSizeStockDTO;

@Controller
@RequestMapping("/product/*")
public class ProductListController {

	//DAO 주입
	@Autowired
	private ProductListDao productListDao = null;

	//생성자
	public ProductListController(){}
	
	@RequestMapping("productList.action")
	public String productListAndCategory(
						HttpServletRequest request
						,HttpServletResponse response
						,@RequestParam(value="cateGrpCode") String gender
						,@RequestParam(value="cIdx") String category_code
						,Model model
																							)throws Exception {
		
		//1. 상품정보  product																						성별 M, F, K		   F02			검색어
		List<ProductListDTO> productList = this.productListDao.selectProductList(category_code, gender);
		
		//2. 상품이미지 조회(map) LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>>
		ArrayList<ProductImgDTO> pImgList = null;//1~5
		LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> pImgMap = new LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>>();
		
		for (int i = 0; i <  productList.size(); i++) {
			//상품정보 배열 pd_code 추출
			String pdCode = productList.get(i).getPd_code();
			//상품이미지 배열
			pImgList = this.productListDao.seletProductImg(pdCode);
			
			pImgMap.put(productList.get(i), pImgList);

		}

		//3. sizeStock (map) 사이즈별 상품재고
		ArrayList<ProductSizeStockDTO> pSizeStockList = null;
		LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> pSizeStockMap = new LinkedHashMap<String, ArrayList<ProductSizeStockDTO>>();

		for (int i = 0; i <  productList.size(); i++) {
			//상품정보 배열 pd_code 추출
			String pdCode = productList.get(i).getPd_code();
			//사이즈 배열
			pSizeStockList = this.productListDao.selectProductSizeStock(pdCode);
			
			pSizeStockMap.put(pdCode, pSizeStockList);

		}
		
		//4. 카테고리명
		List<ProductCategoryDTO> categoryList = this.productListDao.category( category_code, gender);
		//System.out.println(categoryList.toString());
		
		//5. 평점(map)
		ProductReviewDTO selectProductReview = null;//this.productListDao.selectProductReview(pdCode);
		LinkedHashMap<String,ProductReviewDTO> pReview = new LinkedHashMap<String,ProductReviewDTO>();
		for (int i = 0; i <  productList.size(); i++) {
			//상품정보 배열 pd_code 추출
			String pdCode = productList.get(i).getPd_code();
			//평점
			selectProductReview = this.productListDao.selectProductReview(pdCode);
			
			pReview.put(pdCode, selectProductReview);
		}
		
		//6. 카테고리에서 사이즈
		List<ProductSizeStockDTO> csizeList = this.productListDao.selectSizeCategory(category_code, gender);
		
		//7.발볼
		List<ProductListDTO> cfeetList = this.productListDao.selectFeet(category_code, gender);
		
		//8.카테고리 컬러
		List<ProductColorDTO> cColorlist = this.productListDao.selectColor( category_code, gender );
		
		model.addAttribute("productList", productList);//1.상품정보
		model.addAttribute("pImgMap", pImgMap);//2.상품이미지
		model.addAttribute("pSizeStockMap", pSizeStockMap);//3.sizeStock 재고
		model.addAttribute("categoryList", categoryList);//4.카테고리명
		model.addAttribute("pReview", pReview);//5.평점
		model.addAttribute("csizeList", csizeList);//6.카테고리에서 사이즈
		model.addAttribute("cfeetList", cfeetList);//7.발볼
		model.addAttribute("cColorlist", cColorlist);//8.카테고리 컬러
		
		model.addAttribute("userCode","M1");
		
		
		
		return "/WEB-INF/views/productList/itemListMain.jsp";
		//return "/productList/itemListMain.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
}
