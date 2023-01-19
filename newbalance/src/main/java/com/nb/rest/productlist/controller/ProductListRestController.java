package com.nb.rest.productlist.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nb.web.productlist.dao.IProductFilterDao;
import com.nb.web.productlist.dao.ProductAjaxDao;
import com.nb.web.productlist.dao.ProductModalDao;
import com.nb.web.productlist.dto.ProductDTO;
import com.nb.web.productlist.dto.ProductImgDTO;
import com.nb.web.productlist.dto.ProductListDTO;
import com.nb.web.productlist.dto.ProductModalColor;
import com.nb.web.productlist.dto.ProductReviewDTO;
import com.nb.web.productlist.dto.ProductSizeStockDTO;
import com.nb.web.productlist.dto.WishlistDTO;

@RestController
@RequestMapping("/product/*")
public class ProductListRestController {
	
	@Autowired
	private IProductFilterDao productFilterDao = null;
	
	@Autowired
	private ProductModalDao productModalDao = null;
	
	@Autowired
	private ProductAjaxDao productAjaxDao = null;
	
	//필터-> 상품리스트
	@RequestMapping(value={"productAjaxFilter.json" }, method=RequestMethod.GET)
	public ResponseEntity productListFilterController(
							/*@RequestParam(value="soldOutYn") String soldOutYn
							,@RequestParam(value="sizeCode") String[] sizeCodes
							,@RequestParam(value="width") String[] feetWidths
							,@RequestParam(value="colorCode") String[] colorCodes
							,@RequestParam(value="subCateIdx") String[] subCateIdxes
							,@RequestParam(value="priceRange") String[] priceRanges
							,@RequestParam(value="sortProducts") String sortProducts
							,@RequestParam(value="cateGrpCode") String cateGrpCode
							,@RequestParam(value="cIdx") String cIdx*/
							HttpServletRequest request, HttpServletResponse response
			) throws Exception{
		String soldOutYn = request.getParameter("soldOutYn");// "Y"
		//발사이즈, 옷사이즈 등등 사이즈들
		String[] sizeCodes = request.getParameterValues("sizeCode");
		//발 볼
		String[] feetWidths = request.getParameterValues("width");
		//색상
		String[] colorCodes = request.getParameterValues("colorCode");
		//서브 카테고리들...
		String[] subCateIdxes = request.getParameterValues("subCateIdx");
		//가격 범위
		String[] priceRanges = request.getParameterValues("priceRange");//
		String sortProducts = request.getParameter("sortProducts");
		//카테고리 그룹코드
		String cateGrpCode = request.getParameter("cateGrpCode");
		String cIdx = request.getParameter("cIdx");
			String sizeCode = Arrays.toString(sizeCodes).replace("[", "").replace("]","");//220 , 230 , 240
			String feetWidth = Arrays.toString(feetWidths).replace("[", "'").replace("]","'").replaceAll(", ","', '");//"D" , "D(넓음)"
			String colorCode = Arrays.toString(colorCodes).replace("[", "").replace("]","");  // 02 , 57 , 20
			String subCateIdx = Arrays.toString(subCateIdxes).replace("[", "'").replace("]","'").replaceAll(", ","', '");   //  "F01","F02"
			String[][] priceRange = null;
			if(priceRanges!=null) {
				priceRange = new String[priceRanges.length][];
				for (int i = 0; i < priceRanges.length; i++) {
					priceRange[i] = priceRanges[i].split("~"); //[["0","49990"],["50000","99990"],["100000","149990"]]
				}
			}			
			//필터
			ArrayList<ProductListDTO> productArrayList = this.productFilterDao.productInfoAjax(soldOutYn, sizeCode, feetWidth, colorCode, subCateIdx, priceRange, sortProducts, cateGrpCode, cIdx);
		
			ProductListDTO productInfo = null;//상품정보
			List<ProductImgDTO>	productImg = null;//이미지
			List<ProductSizeStockDTO>	productSizeStock = null; // 사이즈
			List<ProductReviewDTO> productReview = null;//평점
			
			LinkedHashMap<String, ProductListDTO> productListAjax = new LinkedHashMap<String, ProductListDTO>();
			LinkedHashMap<String, List<ProductImgDTO>> productImgAjax  = new LinkedHashMap<String, List<ProductImgDTO>>();
			LinkedHashMap< String, List<ProductSizeStockDTO> > productSizeAjax = new LinkedHashMap<String, List<ProductSizeStockDTO>>();
			LinkedHashMap< String, List<ProductReviewDTO> > productReviewAjax = new LinkedHashMap<String, List<ProductReviewDTO>>();
			for (int i = 0; i < productArrayList.size(); i++) {
				String pdCode =  productArrayList.get(i).getPd_code();
				//상품정보
				productInfo = this.productFilterDao.productInfo(pdCode);
				//이미지
				productImg = this.productFilterDao.productImg(pdCode);
				//재고
				productSizeStock = this.productFilterDao.productSizeStock(pdCode);
				//평점
				productReview = this.productFilterDao.productReview(pdCode);
				
				productListAjax.put(pdCode, productInfo);
				productImgAjax.put(pdCode, productImg);
				productSizeAjax.put(pdCode, productSizeStock);
				productReviewAjax.put(pdCode, productReview);
				
			}
			
			ArrayList lists = new ArrayList();
			lists.add(productListAjax);
			lists.add(productImgAjax);
			lists.add(productSizeAjax);
			lists.add(productReviewAjax);
			
			
		    HttpHeaders header = new HttpHeaders();
		    header.add("Content-Type", "application/json;charset=UTF-8");
		    HttpStatus   status = HttpStatus.OK;
		    
		   return new ResponseEntity <>(lists, header, status);

	}

	//퀵뷰창
	@RequestMapping("quickView.json")
	public ResponseEntity selectProduct(@RequestParam("pdCode") String pdCode, Model model) throws Exception {
	
		
		ProductDTO pdDto = this.productModalDao.selectProduct(pdCode); 
		ArrayList<ProductImgDTO> imgList = this.productModalDao.selectImage(pdCode); 
		ArrayList<ProductSizeStockDTO> sizeList = this.productModalDao.selectSize(pdCode); 
		ArrayList<ProductModalColor> diffColorList = this.productModalDao.diffColorProduct(pdCode);
		
		model.addAttribute("userCode", "M1");
		
		ArrayList lists = new ArrayList();
		lists.add(pdDto);
		lists.add(imgList);
		lists.add(sizeList);
		lists.add(diffColorList);
		
		
	    HttpHeaders header = new HttpHeaders();
	    header.add("Content-Type", "application/json;charset=UTF-8");
	    HttpStatus   status = HttpStatus.OK;
	    
	   return new ResponseEntity<>(lists, header, status);

	}
	
	// 관심상품 담기
	   @RequestMapping(value={"wishList.json"}, method=RequestMethod.POST)
	   public @ResponseBody String addWishList(HttpServletRequest request) throws Exception {
	      String result = "";
	      try {
	         String[] wishCodeList = request.getParameterValues("wishCodeList[]");
	         System.out.println(Arrays.toString(wishCodeList));
	         String wishlist = Arrays.toString(wishCodeList).replace("[", "").replace("]","");
	         
	         WishlistDTO dto = new WishlistDTO(wishlist, "M1"); 
	         
	         int rowCount = this.productAjaxDao.addWishlist(dto);
	         
	         System.out.println(rowCount);
	         if(rowCount >= 1) {
	            result = "00";
	         }else {
	            result = "99";
	         }
	      } catch (Exception e) {
	         result = "99";
	      }
	      
	      return result;
	   }
	
	
	
	
	

}
