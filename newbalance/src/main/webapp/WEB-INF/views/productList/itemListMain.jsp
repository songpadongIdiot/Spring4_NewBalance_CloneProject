<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon"
   href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/64abd09342.js" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/a335022766.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link rel="stylesheet" href="/newbalance/css/productList/itemListMainCss1.css">
<link rel="stylesheet" href="/newbalance/css/productList/itemListMainCss2.css">
<link rel="stylesheet" href="/newbalance/css/productList/itemListMainCss3.css">
<link rel="stylesheet" href="/newbalance/css/productList/productmodal.css">
</head>
<style>
</style>
<body>
<h3></h3>
<jsp:include page="/common/header.jsp" flush="false" />
<div class="container" style="padding-top: 0px;">
    <!-- header -->
    <div class="listTop">
        <div class="category_title">            
            <span data-cidx="1285"><a href="/product/subMain.action?cIdx=1285">
	            <c:choose>
	            	<c:when test="${param.cateGrpCode == 'M'}">
	            		남자
	            	</c:when>
	            	<c:when test="${param.cateGrpCode == 'W'}">
	            		여자
	            	</c:when>
	            	<c:when test="${param.cateGrpCode == 'K'}">
	            		KIDs
	            	</c:when>
	            	<c:otherwise>
	            		${param.searchWord}
	            	</c:otherwise>
	            </c:choose>
            </a></span>     

			<h3 data-cidx="1320">
					<c:set value="${param.cIdx }" var="cidx"/>
					<c:forEach items="${categoryList}" var="cList">
						<c:if test="${cList.category_code == cidx }">
								${cList.minor_sort }
						</c:if>
					</c:forEach>
			</h3>
        </div>
										

        <div class="fliterList">
            <div class="soldout_chk">
                <input type="checkbox" name="soldOutYn" id="soldOutYn" class="ip_chekbox blackBg" value="Y">
                <label for="soldOutYn">품절상품 제외</label>
            </div>
            
            <div class="dropdown">
                <a href="javascript:;" class="dropdown_tit">신상품순</a>
                <ul class="dropdown_list">
                    <li class="on"><a href="javascript:;" data-value="Q01">신상품순</a></li>
                    <li><a href="javascript:;" data-value="Q02">베스트상품순</a></li>
                    <li><a href="javascript:;" data-value="Q03">높은 가격순</a></li>
                    <li><a href="javascript:;" data-value="Q04">낮은 가격순</a></li>
                </ul>
            </div>					
            <div class="filter">
                <input type="checkbox" name="filter" class="ip_chk-ios" id="filter" checked=""><label for="filter" class="ios-switch">필터</label>
            </div>						
            <div class="thumbList">
                <a href="javascript:;" class="ico_thumbView"><span class="blind">리스트 크게보기 작게보기 버튼</span></a>
            </div>		
        </div>
    </div>
    
    <!-- body -->
    <div class="listContent viewB" style="min-height: 1070px;">
        <div class="listLeft">
        <div class="inner">
                <!-- filter에서 남자(신발부분,의류,용품,언더 목록들)-->
                <div class="allList">
                    <ul class="allList_list">
                    		<c:if test="${not empty param.cateGrpCode}">               
                     				<li><a href="<%=contextPath %>/product/productList.action?cateGrpCode=${param.cateGrpCode }&cIdx=F" data-gtag-idx="fo_common_gbn_1" data-gtag-label="" data-category-name="">전체보기</a></li>                    		
                     		<c:forEach items="${categoryList}" var="categoryList">
                    				<li><a href="<%=contextPath %>/product/productList.action?cateGrpCode=${param.cateGrpCode }&cIdx=${categoryList.category_code}" data-gtag-idx="fo_common_gbn_1" data-gtag-label="${categoryList.minor_sort }" data-category-name="">${categoryList.minor_sort }</a></li>
                    		</c:forEach>
                    		</c:if>
                    		<c:if test="${empty param.cateGrpCode }">
                    			<li><a href="<%=contextPath %>/product/productList.action?searchWord=${param.searchWord }" data-gtag-idx="fo_common_gbn_1" data-gtag-label="" data-category-name="">Men</a></li>
                    			<li><a href="<%=contextPath %>/product/productList.action?searchWord=${param.searchWord }" data-gtag-idx="fo_common_gbn_1" data-gtag-label="" data-category-name="">Women</a></li>
                    			<li><a href="<%=contextPath %>/product/productList.action?searchWord=${param.searchWord }" data-gtag-idx="fo_common_gbn_1" data-gtag-label="" data-category-name="">Kids</a></li>
                    		</c:if>
                    </ul>		
                </div>
                
                <!-- 사이즈 -->
                <div class="accd" id="filterSize">
                    <div class="accordionTit on"><a href="javascript:">사이즈</a></div><!--  -->
                    <ul class="accordionList accordionList-border">
                    	<c:forEach items="${csizeList}" var="csizelist" >
                        	<li><span class="inputBox"><input type="checkbox" name="sizeCode" id="${csizelist.sz}" class="ip_chk ip_chk-boxBg" value="${csizelist.sz}"/><label for="${csizelist.sz}"><span>${csizelist.sz}</span></label></span></li>			
                    	</c:forEach>
                    </ul>
                </div>
<%--
${ fn:substring(param.cIdx, 0,1) }
<br>

<c:if test="${ fn:substring(param.cIdx, 0,1) eq 'C' }">O</c:if>
<c:if test="${ fn:substring(param.cIdx, 0,1) ne 'C' }">X</c:if> 
--%>

				<c:if test="${ fn:substring(param.cIdx, 0,1) == 'K' }">
		                <!-- 남자발볼 -->
		                <div class="accd filterWidth">
		                    <div class="accordionTit on"><a href="javascript:">발볼(${param.cateGrpCode=='M'?'남':'여' })</a></div>
		                    <ul class="accordionList accordionList-list">
		                    <c:forEach items="${cfeetList}" var="feetlist">
		                        <li><span><input type="checkbox" name="width" id="${feetlist.pd_feet }" class="ip_chekbox blackBg" value="${feetlist.pd_feet }"><label for="${feetlist.pd_feet }">${feetlist.pd_feet }</label></span></li>
		                    </c:forEach>
		                    </ul>
		                </div>
		         </c:if>       
		 <%--                <!-- 여자발볼 -->
		                <div class="accd filterWidth">
		                    <div class="accordionTit on"><a href="javascript:">발볼(여)</a></div>
		                    <ul class="accordionList accordionList-list">
		                        <li><span><input type="checkbox" name="width" id="width_w1" class="ip_chekbox blackBg" value="B_W"><label for="width_w1">B(보통)</label></span></li>
		                        <li><span><input type="checkbox" name="width" id="width_w3" class="ip_chekbox blackBg" value="D_W"><label for="width_w3">D(약간 넓음)</label></span></li>
		                        <li><span><input type="checkbox" name="width" id="width_w4" class="ip_chekbox blackBg" value="4E_W"><label for="width_w4">2E(넓음)</label></span></li>
		                        <li><span><input type="checkbox" name="width" id="width_w8" class="ip_chekbox blackBg" value="M_W"><label for="width_w8">M(보통)</label></span></li>
		                    </ul>
		                </div> --%>
		                
		                
                <!-- 색상 -->
                <div class="accd accordion-color filterColor moreList">
                    <div class="accordionTit on"><a href="javascript:">색상</a></div>
                    <ul class="accordionList accordionList-list accordionList-color all-color">
                    	<c:forEach items="${cColorlist }" var="colorlist">
                        		<li><span class="inputBox"><input type="checkbox" class="ip_chk ip_chk-color color01" name="colorCode" id="${colorlist.color_code }" value="${colorlist.color_code}"><label for="${colorlist.color_code}"><img src="${colorlist.color_url }" alt="Black"><span class="blind"></span></label></span></li>
                    	</c:forEach>
                    </ul>
                </div>
                
                
                <!-- 카테고리 -->
                <div class="accd" id="filterItem">
                    <div class="accordionTit on"><a href="javascript:">카테고리</a></div>
                    <ul class="accordionList accordionList-list">
	                    <c:forEach items="${categoryList}" var="categoryList">
	                        <li><span class="inputBox"><input type="checkbox" id="${categoryList.category_code }" name="subCateIdx" class="ip_chekbox blackBg" value="${categoryList.category_code}" ><label for="${categoryList.category_code }">${categoryList.minor_sort}</label></span></li>
                    	</c:forEach>
                    </ul>
                </div>
                <script>
               		if('${param.cIdx}'.length == 1){
               			$(":checkbox[name='subCateIdx']").prop("checked", true);               			
               			//체크된 subCateIdxes input 태그에 넣기

               		}else{
				     	$(":checkbox[name='subCateIdx'][value='${ param.cIdx}']").prop("checked", true);
               		}
				</script>
                
                <!-- 가격 -->
                <div class="accd" id="filterPrice">
                    <div class="accordionTit on"><a href="javascript:">가격</a></div>
                    <ul class="accordionList accordionList-list">
                        <li><span class="inputBox"><input type="checkbox" id="price01" name="priceRange" class="ip_chekbox blackBg" value="0~49990"><label for="price01">5만원미만</label></span></li>
                        <li><span class="inputBox"><input type="checkbox" id="price02" name="priceRange" class="ip_chekbox blackBg" value="50000~99990"><label for="price02">5만원-10만원 미만</label></span></li>
                        <li><span class="inputBox"><input type="checkbox" id="price03" name="priceRange" class="ip_chekbox blackBg" value="100000~149990"><label for="price03">10만원-15만원 미만</label></span></li>
                        <li><span class="inputBox"><input type="checkbox" id="price04" name="priceRange" class="ip_chekbox blackBg" value="150000~199990"><label for="price04">15만원-20만원 미만</label></span></li>
                        <li><span class="inputBox"><input type="checkbox" id="price05" name="priceRange" class="ip_chekbox blackBg" value="200000~9999999"><label for="price05">20만원 이상</label></span></li>
                    </ul>
                </div>
                <div class="btn_area center mb30">
                    <a href="javascript:;" class="btn_ty_bface listBtn" name="btnAllFilterRemove">전체 선택 취소</a>
                </div>
            </div>
        </div>      
        
<!-- 전체 보기일 때 모든 accd input[type=check] check 되게 하기 -->
        

       <div class="listRight">
           <ul class="productList" id="prodList">
   <c:choose>      
           <c:when test="${not empty pImgMap}">
   <c:forEach items="${pImgMap}" var="map">
              <li class="memberOnly">
               <div class="pro_area pro_soldOut"><!-- 품절 시 pro_soldOut 클래스 추가 -->
                  <div class="pro_thumbNail">
                     	<a href="/newbalance/product/productDetail.action?pdCode=${map.key.pd_code}" id="selDetail" data-emphasis="Y" data-style="${ map.key.pd_code}" data-color="${map.key.color } " data-cidx="${map.key.category_code }" class="pro_area" data-com-icon="https://image.nbkorea.com/NBRB_Icon/NB20180727200033690001.png,https://image.nbkorea.com/NBRB_Icon/NB20180727200053071001.png" data-sale-icon="" data-cate-icon="" data-event-icon="" data-guide-icon="">   
                        <img id="selGoods" src="${map.value.get(0).img_url}" alt="ML2002RC" class="img_goods" data-base-img="${map.value.get(0).img_url}" data-hover-img="${map.value.get(1).img_url}" style="display: inline-block;">                    	
                              <span class="img_tag"></span>
                                       <span class="icon_nbg_s "></span>
                                       <span class="img_made"></span>      

	                                    <!-- 재고가 없으면 넣고 있으면 안넣기 -->   
	                                   <c:set value="0" var="count"/>
	                                   <c:forEach items="${ pSizeStockMap.get(map.key.pd_code)}" var="list">
											<c:if test="${list.stock_count != 0}">
													<c:set value="${count+1 }" var="count"/>
											</c:if>	                                   
	                                   </c:forEach>                             
	                                   <c:if test="${count == 0}">
	                                       <div class="soldOut soldOut-L">
	                                          <p>SOLD OUT</p>
	                                       </div>
	                                   </c:if>
	                                   
                                                               
                     	</a>
  <!-- quick_view -->       <p class="quick_view"><a href="javascript:;" class="btnQuickView" name=${map.key.pd_code}>Quick View</a></p>
                                                                     
                      	<c:if test="${map.key.pd_memberonly == 1}">              
                                    <!-- 회원전용상품 아이콘 productList안에 memberonly가 1이면 없앰-->
		                     <span class="icon_nbg_s icon_nbg_s-mb" style="display:block;">                                    
		                        <img class="" alt="member only" src="https://image.nbkorea.com/NBRB_PC/product/ico_memberOnly_list.png">                                    
		                     </span>
		                                    <!-- 회원전용상품아이콘 호버상황 -->
		                     <span class="ico_mb"><img src="https://image.nbkorea.com/NBRB_PC/product/ico_memberOnly_hover.png" alt="member only"></span>
		                </c:if>     
		                                       
                  </div>
                  <div class="pro_info">
                     <div class="badge">
                        <img src="https://image.nbkorea.com/NBRB_Icon/NB20180727200033690001.png">
                        <img src="https://image.nbkorea.com/NBRB_Icon/NB20180727200053071001.png">               
                     </div>
                     	<p class="prdName_name">${map.key.pd_name}</p>
                     <div class="prdName">
                                    <p class="prdDetail">${map.key.pd_code}</p>
                                    <div class="prdName_price">                  
                                       <p><fmt:formatNumber value="${map.key.pd_price}" pattern="#,###"/><span>원</span></p>
                                    </div>
                     </div>
                     <div class="star_style03 star_score">
                     	<!-- 별점, 리뷰수 -->
                     	<!-- 1점 단위로 별점 1개 0.1~0.9까지는 별 반 개 -->
						<span class="star_point">
							<%-- <c:set value="${ pReview.get(map.key.pd_code) }" var="revdto"/>
							<c:forEach items="${revdto.avgReview == 0 ? '': revdto.avgReview}" var="avgRev">
								   <i class="fa-solid fa-star fa-xs"></i>
						   </c:forEach> --%>

						   <c:set value="${ pReview.get(map.key.pd_code) }" var="revdto"/>
						    <b>별점 ${empty revdto.avgReview? 0 : revdto.avgReview}</b> <span>( ${empty revdto.countPOfReview? 0 : revdto.countPOfReview} 개)</span>
						</span>
                     	<!-- (각 리뷰의 평점합) / 상품에 대한 전체 리뷰수    ( 상품에 대한 전체 리뷰수 )-->
                     </div>
                     <div class="prdSize">
						<ul class="prdSize_list">
							
  							<c:forEach items="${pSizeStockMap.get(map.key.pd_code)}" var="list">
 									 <c:if test="${list.stock_count != 0}">
											<li>${list.sz}</li>
									</c:if>
							</c:forEach>

						</ul>
					</div>
                  </div>
               </div>
            </li>
            </c:forEach>
            </c:when>
            <c:otherwise>
	            <div class="no_filter" id="noDataList" style="display: block;">
						<p class="txt01">다른 카테고리나 다른 필터 조건을 이용해 보세요.</p>
				</div>
			</c:otherwise>
	</c:choose>  
           </ul>
        </div><!--listRight  -->       
    </div><!-- listContent -->



	<!-- 모달창 -->
	<div class="dimm_pop" id="layerProductQuickViewPopupDimmed" style="/* position: fixed; *//* display: block; */"></div>
	<div class="item_detail"><!-- pop_inner background : fff -->
	  <div class="item_detailTop"><!-- 내용 -->
	</div>
</div><!--container  -->



<script>

var modalAjaxForm = $("<form name=modalAjaxForm></form>")
modalAjaxForm.appendTo('body');

$("#btnLayerPopupClose").on("click",function(){
	$(".dimm_pop").css("display","none");
	$(".item_detail").css("display","none");
	
	$("form[name='modalAjaxForm'] input[name='pdCode']").remove();
	
})	
$(".btnQuickView").on("click",function(){
	$(".dimm_pop").css("display","block");
	$(".item_detail").css("display","block");
	
	//${map.key.pd_code}
	//var btnpdCodeValue = $(this).prop("name");
	//console.log(btnpdCodeValue)
	modalAjaxForm.append( $("<input/>",{type:'hidden', name:'pdCode', value: $(this).prop("name") })  );
	
	var modalParam = $("form[name='modalAjaxForm']").serialize();
	console.log(modalParam);
	$.ajax({
		url:"/newbalance/product/quickView.json",
		dataType:"json",
		type:"GET",
		data:modalParam,
		cache:false,
		success:function(data,testStatus,jqXHR){
			if(data){

				console.log(data);
				$(".item_detail").empty();		
				
var pdDto = data[0];	//pdDto list			
var imgList = data[1];	//imgList list			
var sizeList = data[2];	//sizeList list			
//var relatedPdList = data[3];	//relatedPdList list			
var diffColorList = data[3];	//diffColorList list	

var content= "";
content+="<div class='item_detailTop'>";
content+="<a href='javascript:;' class='close' id='btnLayerPopupClose' onclick='closeClick(this)'><img src='https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png' alt='팝업 닫기'></a>";
content+="<p class='"+pdDto.pdCode+"'>스타일코드<strong id='quickStyleCode'>"+pdDto.pdCode+"</strong></p>";
content+="<div class='pr_visual'>"
content+="<div class='item_img'>";

var count = 0
for (var i = 0; i < sizeList.length; i++) {
	if (sizeList[i].stock_count != 0 ) {
		count += 1;
	}//if
}//for
if(count == 0 ){
	content +="<div class='soldout'><p>SOLD OUT</p></div>";
}
content+="<img class='main_img' alt='상품 메인이미지' src='"+pdDto.imgUrl+"'>";
content+="</div>"
content+="<div class='img_list'>";
for (var i = 0; i < imgList.length; i++) {
	if( i == 0){
		content+="<span class='active' id='first_image'><img src='"+imgList[0].img_url+"' alt='1번' /></span>";
	}else{
		content+="<span><img src='"+imgList[i].img_url+"' alt='"+i+"번' /></span>";
	}
}
content+="</div>";
content+="</div>";
content+="<div class='item_option'>";
content+="<h2 class='pd_name'>"+pdDto.pdName+"</h2>";
content+="<div class='icon'>";
content+="<img src='https://image.nbkorea.com/NBRB_Icon/NB20180727200053137001.png' alt='BEST' />";
content+="<img src='https://image.nbkorea.com/NBRB_Icon/NB20180727200034090001.png' alt='NEW' />";
content+="</div>";
content+="<div class='right_box'>";
content+="<div class='review_sns'>";
content+="<span class='star_point'>";
content+="<b></b> <a href='#pd_review'></a>";
content+="</span>";
content+="<div class='btn_sns' style='float: right; width: 115px;'>";
content+="<a id='like_item' class='like_item' href='javascript:;' data-pdcode='"+pdDto.pdCode +"' onclick='wishList(this)'></a>";
content+="<p>";
content+="<a class='facebook' href='javascript:;'></a>";
content+="<a class='twitter' href='javascript:;'></a>";
content+="</p>";
content+="</div>";
content+="</div>";
content+="<div class='price'>";
content+="<span><b id='item_price'>"+pdDto.pdPrice+"</b>원</span><br>";
content+="<span>적립 &nbsp;<b>"+pdDto.pdPrice*0.06+"</b> (6%)</span>";
content+="</div>"

if(pdDto.pdMemberonly == 1){
	content+="<div class='buy_limit'>";
	content+="<p>해당 상품은 <strong>ID</strong>당 색상별<br>최대 <b id='maximum'>"+pdDto.pdMincount+"</b>pcs까지 구매가능합니다.</p>"
	content+="</div>";
}

content+="<div class='sizes op_top'>";
content+="<div class='fsize_guide'>";
content+="<p class='op_title'>사이즈</p>";
content+="</div>";
content+="<ul id='size_list'>";

for (var i = 0; i < sizeList.length; i++) {
	if(sizeList[i].stock_count == 0){
		content+="<li style='display:inline-block; margin-top:5px; margin-right:8px;'>";
		content+="<input type='radio' id='"+sizeList[i].sz+"s' name='sizes' value='"+sizeList[i].sz+"' data-pdcode='"+pdDto.pdCode+"' data-sizecode='"+sizeList[i].size_code+"'  data-stock='"+sizeList[i].stockCount+"' data-price='"+pdDto.pdPrice+"' data-color='"+diffColorList[0].color+"' data-colorcode='"+diffColorList[0].colorCode+"' onclick='showPrice(this)'>";
		content+="<label class='soldout' for='"+sizeList[i].sz+"s' title='"+sizeList[i].sz+"'>"+sizeList[i].sz+"</label>";
		content+="</li>";
		
	}else{
		content+="<li style='display:inline-block; margin-top:5px; margin-right:8px;'>";
		content+="<input type='radio' id='"+sizeList[i].sz+"s' name='sizes' value='"+sizeList[i].sz+"' data-pdcode='"+pdDto.pdCode+"' data-sizecode='"+sizeList[i].size_code+"' data-stock='"+sizeList[i].stockCount+"' data-price='"+pdDto.pdPrice+"' data-color='"+diffColorList[0].color+"' data-colorcode='"+diffColorList[0].colorCode+"' onclick='showPrice(this)'>";
		content+="<label for='"+sizeList[i].sz+"s' title='"+sizeList[i].sz+"'>"+sizeList[i].sz+"</label>";
		content+="</li>";
	}
}
content+="</ul> ";
content+="</div>";
if(pdDto.pdFeet != null){
	content+="<div class='fwidth op_top'>";
	content+="<div class='fwidth_guide'>";
	content+="<p class='op_title'>발볼 넓이</p>";
	content+="</div>";
	content+="<ul>";
	content+="<li>";
	content+="<input type='radio' id='fwidth' name='fwidth' value='"+pdDto.pdFeet+"' data-pdcode='"+pdDto.pdCode+"'>";
	content+="<label for='fwidth'>"+pdDto.pdFeet+"</label>";
	content+="</li>";
	content+="</ul>";
	content+="</div>";
}

content+="<div class='selected'>";
content+="<ul id='selected_size' class='selected_list'>";
content+="</ul>";
content+="</div>";

content+="<div class='total_price'>";
content+="<div class='hide_box' style='display: none;'>";
content+="<div class='won first'>";
content+="<span class='tp_text'>합계</span>";
content+="<span class='tp_money' id='tp_money'><strong></strong>원</span>";
content+="</div>";
content+="<div class='won'>";
content+="<span class='ship_fee'>배송비</span>";
content+="<span class='all_free'>전상품 무료배송</span>";
content+="</div>";
content+="<div class='card_benefit'>";
content+="<span class='cb_text'>카드혜택</span>";
content+="<span class='cb_details'><a href='/newbalance/product/benefitCardPop.jsp'>자세히 보기</a></span>";
content+="</div>";
content+="<div class='naver_banner'>";
content+="<span class='naver_text'>네이버페이 포인트 혜택</span>";
content+="<span class='naver_point'>최대 3% 적립</span>";
content+="</div>";
content+="</div>";
content+="<div class='cart_buy'>";
content+="<a href='javascript:;' class='cart' id='open_cart' onclick='addCart(this)'>장바구니</a>";
content+="<a href='javascript:;' id='buyBtn' class='buy' onclick='buy(this);'>구매하기</a>";
content+="</div>";
content+="<p class='noti'>* 주문/배송/반품 등 일반 문의는 1:1 문의를 이용해 주시기 바랍니다.</p>";
content+="</div>";

if(pdDto.pdMemberonly == 1){
	content+="<div class='mb_only'>";
	content+="<p>뉴발란스 멤버 전용상품입니다</p>";
	content+="</div>";
}
content+="</div>";
content+="</div>";
content+="<div class='item_detailBottom'></div>";
content+="</div>";
content+="</div>";
content+="</div>";
	
$(".item_detail").append(content);				
	

			}//if data==true
		}//success
		
	})//ajax
})//click


function closeClick(self){
	$(".dimm_pop").css("display","none");
	$(".item_detail").css("display","none");
	$("form[name='modalAjaxForm'] input[name='pdCode']").remove();
	
}


</script>



<script>
$(function(){
	

	$(".dropdown_tit").on("click", function () {
		$(".dropdown").toggleClass('on');
	});
	// dropdown 제목 눌렀을 때, dropdown list 보여주기			
	// filter text 변경
	$(".dropdown_list > li").on("click", function () {
		$(".dropdown_tit").removeClass('on');
		$(".dropdown_list > li").removeClass('on');
		$(this).addClass('on');
		$(".dropdown").toggleClass('on');
		$(".dropdown_tit").text($(this).text());
		//location.href="/newbalance/productList/itemListNewBest.jsp";

		// scroll height 초기화
		$('html').scrollTop(0);
	});
	
	
	//필터 on off
	$(".ip_chk-ios").click(function () {
        if ($('.ip_chk-ios').is(':checked')) {
            $(".listContent").removeClass("filterOff")
            $(".thumbList").removeClass("on")
            $(".thumbList").removeClass("viewB")
        } else {
            $(".listContent").addClass("filterOff")
            $(".listContent").addClass("viewB")
            $(".listContent").removeClass("viewS")
        }
    });
	
	//작게보기 크게보기
	$(".thumbList").on("click", function () {
        $(this).toggleClass("on")
        if ($('.thumbList').hasClass("on")) {
            // 작게보기
            $('.listContent').removeClass("viewB")
            $('.listContent').addClass("viewS")
            $(".listContent").addClass("filterOff")
            $('.ip_chk-ios').prop('checked', false);
        } else {
            // 크게보기
            $('.listContent').removeClass("viewS")
            $('.listContent').addClass("viewB")
            $(".listContent").addClass("filterOff")
            $('.ip_chk-ios').prop('checked', false);
        };
    });	

	
	//왼쪽 제목 누르면 슬라이드 닫힘
	$(".accordionTit").on("click", function () {				
		if ($(this).hasClass("on")) {					
			$(this).removeClass("on");
			
			if($(this).parent('.accd').hasClass('accordion-color')){						
				$(this).siblings(".accordionList").slideUp();
				
				if($(".filterColor").hasClass("moreList")){
					$(".aco_moreBtn").hide(200);
				}						
			}else{
				$(this).siblings(".accordionList").slideUp();
			}						
		} else {		
			$(this).addClass("on");						
			
			if($(this).parent('.accd').hasClass('accordion-color')){
				$(this).siblings(".accordionList").slideDown();
				
				if($(".filterColor").hasClass("moreList")){
					$(".aco_moreBtn").show(200);
				}										
			}else{
				$(this).siblings(".accordionList").slideDown();
			}
		}
	}); 
	
	//상품에 마우스 올렸을 때 이미지 바뀜
	// $(this)    ul  li 중에 마우스가 올라가 있는  mouseover 이벤트를 받은 li 태그
	$("#prodList").on({
		mouseover:function() {			
			
			var hoverImg = $(this).find("#selGoods").data("hoverImg");			
			$(this).find("#selGoods").attr("src", hoverImg);
			
			$(this).addClass("on"); //jquery 클래스 속성 추가 +
			
		}, 
		mouseout:function() {						
			var baseImg = $(this).find("#selGoods").data("baseImg");
			$(this).find("#selGoods").attr("src", baseImg);
			
			$(this).removeClass("on");
		}
	}, "li");
})	
</script>

<!-- 카테고리 클릭 시 input 동적 생성. ajax -->
<script>



//1.  $(drplist  a )click    -> categoryForm ->기본(신상품순으로..)하고, 다 지우고 클릭 한 거만 집어넣기 input  -> 아래 checkbox 이벤트랑 ajax 똑같이 코딩
$(".dropdown_list a").on("click", function(){
    	$("input[name=sortProducts]").remove();
		categoryForm.append(  $("<input/>"
						, {type:'hidden', name:"sortProducts" , value:$(this).data("value") }) );
		
		var params = $("form[name=categoryAjax]").serialize();
		console.log(params);
		$.ajax({
			   url:"/newbalance/product/productAjaxFilter.json",
			   dataType:"json",
			   type:"GET",
			   data:params,
			   cache:false,
			   success:function(data, testStatus, jqXHR){
			   if(data){
				   console.log(data);
				   $(".productList").empty();//초기화
					//	   												key			value
					//console.log("productInfoList.MF01aaak41.pd_code : ", productInfoList.MF01aaak41.pd_code);//상품코드
	/*
					[key값 전체 출력]
					for(const key in productInfoList){
						console.log( key +" : " + productInfoList[key].color+" : " + productInfoList[key].pd_feet  )
					}
	*/	 
	var productInfoList = data[0];//상품정보 arraylist
	var productImgList = data[1];//상품이미지 arraylist
	var productSizeStockList = data[2];//상품재고 arraylist
	var productReviewList = data[3];//리뷰 arraylist
	var content="";

					
	for(const key in productInfoList){
		if(productInfoList[key]==null){
			content+="<div class='no_filter' id='noDataList' style='display: block;'>"
			content+="<p class='txt01'>다른 카테고리나 다른 필터 조건을 이용해 보세요.</p>";
			content+="</div>";
			
		}else{
		
		content+="<li class='memberOnly'>";
		content+="<div class='pro_area pro_soldOut'>";
		
		//이미지
		content+="<div class='pro_thumbNail'>";
		content+="<a href='/newbalance/product/productDetail.action?pdCode="+productInfoList[key].pd_code+"' id='selDetail' data-emphasis='Y' data-style='"+productInfoList[key].pd_code+"' data-color='"+productInfoList[key].color+"' data-cidx='"+productInfoList[key].category_code+"' class='pro_area' data-com-icon='https://image.nbkorea.com/NBRB_Icon/NB20180727200033690001.png,https://image.nbkorea.com/NBRB_Icon/NB20180727200053071001.png' data-sale-icon='' data-cate-icon='' data-event-icon='' data-guide-icon=''>";                                                          
		
		content+="<img id='selGoods' src='"+productImgList[key][0].img_url+"' alt='' class='img_goods' data-base-img='"+productImgList[key][0].img_url+"' data-hover-img='"+productImgList[key][0].img_url+"' style='display: inline-block;'>";
		content+="<span class='img_tag'></span>";
		content+="<span class='icon_nbg_s'></span>";
		content+="<span class='img_made'></span>";
		    
		var count = 0;
		var sizeArray =  productSizeStockList[key] ;
		for (var i = 0; i < sizeArray.length; i++) {//재고
			if(sizeArray[i].stock_count != 0){
				count = count + 1
			}//if
		}//for
		if(count == 0){
			content+="<div class='soldOut soldOut-L'>";
			content+="<p>SOLD OUT</p>";
			content+="</div>";	
		}//if
		content+="";
		content+="</a>";
		content+="<p class='quick_view'><a href='javascript:;' name='"+productInfoList[key].pd_code+"' class='btnQuickView' onclick='quickClick(this)'>Quick View</a></p>";
		
		if(productInfoList[key].pd_memberonly == 1){//맴버면? 자물쇠 이미지
			content+="<span class='icon_nbg_s icon_nbg_s-mb' style='display:block;'>";
			content+="<img class='' alt='member only' src='https://image.nbkorea.com/NBRB_PC/product/ico_memberOnly_list.png'>";
			content+="</span>";
			content+="<span class='ico_mb'><img src='https://image.nbkorea.com/NBRB_PC/product/ico_memberOnly_hover.png' alt='member only'></span>";
		}//if
		content+="</div>";//thumbNail
		
		//상품정보
		content+="<div class='pro_info'>";
		content+="<div class='badge'>";
		content+="<img src='https://image.nbkorea.com/NBRB_Icon/NB20180727200033690001.png'>";
		content+="<img src='https://image.nbkorea.com/NBRB_Icon/NB20180727200053071001.png'>";
		content+="</div>";//badge
		content+="<p class='prdName_name'>"+productInfoList[key].pd_name+"</p>";
		content+="<div class='prdName'>";
		content+="<p class='prdDetail'>"+productInfoList[key].pd_code+"</p>";
		content+="<div class='prdName_price'>";
		var pdPrice = productInfoList[key].pd_price;
		content+="<p>"+pdPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"<span>원</span></p>"
		content+="</div>";//prdName_price
		content+="</div>";//prdName
		
		//리뷰
		content+="<div class='star_style03 star_score'>";
		content+="<span class='star_point'>"
			if(productReviewList[key][0] == null){
				content+="<b>별점</b><span>(0개)</span>";
			}else{
				content+="<b>별점"+productReviewList[key][0].avgReview + "</b><span>("+productReviewList[key][0].countPOfReview+"개)</span>";
				//console.log(productReviewList[key].avgReview);
			}
		content+="</span>";//star_point
		content+="</div>";//star_style03
		
		
		//사이즈들
		content+="<div class='prdSize'>";
		content+="<ul class='prdSize_list'>";
		for (var i = 0; i < sizeArray.length; i++) {
			if(sizeArray[i].stock_count != 0){
				content+="<li>"+sizeArray[i].size_code+"</li>";
			}//if
		}//for
		content+="</ul>";//prdSize_list
		content+="</div>";//prdSize
		
		content+="</div>";//pro_info
		content+="</li>";//memberOnly;
		}

	}//처음꺼 for 
	$(".productList").append(content);				   
		   
	
	
			   }//if
		   }//success
	   }) 
});


//카테고리 클릭하면 form 태그
var categoryForm = $('<form name=categoryAjax></form>');
/* http://localhost/newbalance/product/productList.action?cateGrpCode=W&cIdx=F01 */
	
//파라미터로 searchWord라는게 존재 할 때   ?searchWord 가 있다면....
categoryForm.append($("<input/>", {type:'hidden', name:"searchWord", value:"${param.searchWord}" } ) );
//파라미터로 cateGrpCode,cIdx 가 존재할 때 ?cateGrpCode="xx"&cIdx="yy"
categoryForm.append($("<input/>", {type:'hidden', name:"cateGrpCode", value:"${param.cateGrpCode}" } ) );                         
categoryForm.append($("<input/>", {type:'hidden', name:"cIdx", value:"${param.cIdx}" } ) );



categoryForm.append($("<input/>", {type:'hidden', name:"sortProducts", value:"Q01" } ) );

if('${param.cIdx}'.length==3){//전체보기가 아니면 카테고리 코드 넣기
	categoryForm.append($("<input/>", {type:'hidden', name:"subCateIdx", value:"${param.cIdx}" } ) );
}

categoryForm.appendTo('body');

//전체취소
$(".btn_ty_bface").on("click",function(){
	$(".accd .accordionList input[type=checkbox]:checked").prop("checked",false);
	alert("ㅎㅎㅎ");
	$("form[name=categoryAjax] input[name=subCateIdx]").remove();
});

//2. input[type=checkbox] 태그 클릭 했을 때
$("input[type=checkbox]").on("click", function (){
  
	   var isChecked =  $(this).prop("checked");  // 
	   var inputValue = $(this).val();
	   if( isChecked ){
	      categoryForm.append(  $("<input/>", {type:'hidden', name:$(this).prop("name") , value:$(this).val() } ) );
	   }else{
	      $("form input[value='"+inputValue+"']").remove();   
	  
	   }
	
	   var params = $("form[name=categoryAjax]").serialize();
	   console.log(params);//cateGrpCode=M&cIdx=F01&sortProducts=Q01&subCateIdx=F01&sizeCode=220
	    $.ajax({
		   url:"/newbalance/product/productAjaxFilter.json",
		   dataType:"json",
		   type:"GET",
		   data:params,
		   cache:false,
		   success:function(data, testStatus, jqXHR){
			   if(data){
				   console.log(data)
				   $(".productList").empty();//초기화
				   
				   
				//	   												key			value
				//console.log("productInfoList.MF01aaak41.pd_code : ", productInfoList.MF01aaak41.pd_code);//상품코드
/*
				[key값 전체 출력]
				for(const key in productInfoList){
					console.log( key +" : " + productInfoList[key].color+" : " + productInfoList[key].pd_feet  )
				}
*/	 
var productInfoList = data[0];//상품정보 arraylist
var productImgList = data[1];//상품이미지 arraylist
var productSizeStockList = data[2];//상품재고 arraylist
var productReviewList = data[3];//리뷰 arraylist
var content="";

				
for(const key in productInfoList){
	if(productInfoList[key]==null){
		content+="<div class='no_filter' id='noDataList' style='display: block;'>"
		content+="<p class='txt01'>다른 카테고리나 다른 필터 조건을 이용해 보세요.</p>";
		content+="</div>";
		
	}else{
	
	content+="<li class='memberOnly'>";
	content+="<div class='pro_area pro_soldOut'>";
	
	//이미지
	content+="<div class='pro_thumbNail'>";
	content+="<a href='/newbalance/product/productDetail.action?pdCode="+productInfoList[key].pd_code+"' id='selDetail' data-emphasis='Y' data-style='"+productInfoList[key].pd_code+"' data-color='"+productInfoList[key].color+"' data-cidx='"+productInfoList[key].category_code+"' class='pro_area' data-com-icon='https://image.nbkorea.com/NBRB_Icon/NB20180727200033690001.png,https://image.nbkorea.com/NBRB_Icon/NB20180727200053071001.png' data-sale-icon='' data-cate-icon='' data-event-icon='' data-guide-icon=''>";                                                          
	
	content+="<img id='selGoods' src='"+productImgList[key][0].img_url+"' alt='' class='img_goods' data-base-img='"+productImgList[key][0].img_url+"' data-hover-img='"+productImgList[key][1].img_url+"' style='display: inline-block;'>";
	content+="<span class='img_tag'></span>";
	content+="<span class='icon_nbg_s'></span>";
	content+="<span class='img_made'></span>";
	    
	var count = 0;
	var sizeArray =  productSizeStockList[key] ;
	for (var i = 0; i < sizeArray.length; i++) {//재고
		if(sizeArray[i].stock_count != 0){
			count = count + 1
		}//if
	}//for
	if(count == 0){
		content+="<div class='soldOut soldOut-L'>";
		content+="<p>SOLD OUT</p>";
		content+="</div>";	
	}//if
	content+="";
	content+="</a>";
	content+="<p class='quick_view'><a href='javascript:;' name='"+productInfoList[key].pd_code+"' class='btnQuickView' onclick='quickClick(this)'>Quick View</a></p>";
	
	if(productInfoList[key].pd_memberonly == 1){//맴버면? 자물쇠 이미지
		content+="<span class='icon_nbg_s icon_nbg_s-mb' style='display:block;'>";
		content+="<img class='' alt='member only' src='https://image.nbkorea.com/NBRB_PC/product/ico_memberOnly_list.png'>";
		content+="</span>";
		content+="<span class='ico_mb'><img src='https://image.nbkorea.com/NBRB_PC/product/ico_memberOnly_hover.png' alt='member only'></span>";
	}//if
	content+="</div>";//thumbNail
	
	//상품정보
	content+="<div class='pro_info'>";
	content+="<div class='badge'>";
	content+="<img src='https://image.nbkorea.com/NBRB_Icon/NB20180727200033690001.png'>";
	content+="<img src='https://image.nbkorea.com/NBRB_Icon/NB20180727200053071001.png'>";
	content+="</div>";//badge
	content+="<p class='prdName_name'>"+productInfoList[key].pd_name+"</p>";
	content+="<div class='prdName'>";
	content+="<p class='prdDetail'>"+productInfoList[key].pd_code+"</p>";
	content+="<div class='prdName_price'>";
	var pdPrice = productInfoList[key].pd_price;
	content+="<p>"+pdPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"<span>원</span></p>"
	content+="</div>";//prdName_price
	content+="</div>";//prdName
	
	//리뷰
	content+="<div class='star_style03 star_score'>";
	content+="<span class='star_point'>"
	if(productReviewList[key][0] == null){
		content+="<b>별점</b><span>(0개)</span>";
	}else{
		content+="<b>별점"+productReviewList[key][0].avgReview
		+"</b><span>("+productReviewList[key][0].countPOfReview+"개)</span>";
		//console.log(productReviewList[key].avgReview);
	}
	content+="</span>";//star_point
	content+="</div>";//star_style03
	
	
	//사이즈들
	content+="<div class='prdSize'>";
	content+="<ul class='prdSize_list'>";
	for (var i = 0; i < sizeArray.length; i++) {
		if(sizeArray[i].stock_count != 0){
			content+="<li>"+sizeArray[i].size_code+"</li>";
		}//if
	}//for
	content+="</ul>";//prdSize_list
	content+="</div>";//prdSize
	
	content+="</div>";//pro_info
	content+="</li>";//memberOnly;
	}

}//처음꺼 for 
$(".productList").append(content);

			   }//if

		   }//success
	   }) 
});

function quickClick(self){
	 $(".dimm_pop").css("display", "block");
	 $(".item_detail").css("display","block");
	 
		//$(".dimm_pop").css("display","block");
		//$(".item_detail").css("display","block");
		
		//${map.key.pd_code}
		//var btnpdCodeValue = $(this).prop("name");
		//console.log(btnpdCodeValue)
		modalAjaxForm.append( $("<input/>",{type:'hidden', name:'pdCode', value: $(self).prop("name") })  );
		
		var modalParam = $("form[name='modalAjaxForm']").serialize();
		console.log(modalParam);
		$.ajax({
			url:"/newbalance/product/quickView.json",
			dataType:"json",
			type:"GET",
			data:modalParam,
			cache:false,
			
			success:function(data,testStatus,jqXHR){
				if(data){

					console.log(data);
					$(".item_detail").empty();		
					
	var pdDto = data[0];	//pdDto list			
	var imgList = data[1];	//imgList list			
	var sizeList = data[2];	//sizeList list			
	//var relatedPdList = data[3];	//relatedPdList list			
	var diffColorList = data[3];	//diffColorList list	

	var content= "";
	content+="<div class='item_detailTop'>";
	content+="<a href='javascript:;' class='close' id='btnLayerPopupClose' onclick='closeClick(this)'><img src='https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png' alt='팝업 닫기'></a>";
	content+="<p class='"+pdDto.pdCode+"'>스타일코드<strong id='quickStyleCode'>"+pdDto.pdCode+"</strong></p>";
	content+="<div class='pr_visual'>"
	content+="<div class='item_img'>";

	var count = 0
	for (var i = 0; i < sizeList.length; i++) {
		if (sizeList[i].stockCount != 0 ) {
			count += 1;
		}//if
	}//for
	if(count == 0 ){
		content +="<div class='soldout'><p>SOLD OUT</p></div>";
	}
	content+="<img class='main_img' alt='상품 메인이미지' src='"+pdDto.imgUrl+"'>";
	content+="</div>"
	content+="<div class='img_list'>";
	for (var i = 0; i < imgList.length; i++) {
		if( i == 0){
			content+="<span class='active' id='first_image'><img src='"+imgList[0].img_url+"' alt='1번' /></span>";
		}else{
			content+="<span><img src='"+imgList[i].img_url+"' alt='"+i+"번' /></span>";
		}
	}
	content+="</div>";
	content+="</div>";
	content+="<div class='item_option'>";
	content+="<h2 class='pd_name'>"+pdDto.pdName+"</h2>";
	content+="<div class='icon'>";
	content+="<img src='https://image.nbkorea.com/NBRB_Icon/NB20180727200053137001.png' alt='BEST' />";
	content+="<img src='https://image.nbkorea.com/NBRB_Icon/NB20180727200034090001.png' alt='NEW' />";
	content+="</div>";
	content+="<div class='right_box'>";
	content+="<div class='review_sns'>";
	content+="<span class='star_point'>";
	content+="<b></b><a href='#pd_review'></a>";
	content+="</span>";
	content+="<div class='btn_sns' style='float: right; width: 115px;'>";
	content+="<a id='like_item' class='like_item' href='javascript:;' data-pdcode='"+pdDto.pdCode +"' onclick='wishList(this)'></a>";
	content+="<p>";
	content+="<a class='facebook' href='javascript::;'></a>";
	content+="<a class='twitter' href='javascript::;'></a>";
	content+="</p>";
	content+="</div>";
	content+="</div>";
	content+="<div class='price'>";
	content+="<span><b id='item_price'>"+pdDto.pdPrice+"</b>원</span><br>";
	content+="<span>적립 &nbsp;<b>"+pdDto.pdPrice*0.06+"</b> (6%)</span>";
	content+="</div>"

	if(pdDto.pdMemberonly == 1){
		content+="<div class='buy_limit'>";
		content+="<p>해당 상품은 <strong>ID</strong>당 색상별<br>최대 <b id='maximum'>"+pdDto.pdMincount+"</b>pcs까지 구매가능합니다.</p>"
		content+="</div>";
	}

	content+="<div class='sizes op_top'>";
	content+="<div class='fsize_guide'>";
	content+="<p class='op_title'>사이즈</p>";
	content+="</div>";
	content+="<ul id='size_list'>";

	for (var i = 0; i < sizeList.length; i++) {
		if(sizeList[i].stock_count == 0){
			content+="<li style='display:inline-block; margin-top:5px; margin-right:8px;'>";
			content+="<input type='radio' id='"+sizeList[i].sz+"s' name='sizes' value='"+sizeList[i].sz+"' data-pdcode='"+pdDto.pdCode+"' data-sizecode='"+sizeList[i].size_code+"'  data-stock='"+sizeList[i].stockCount+"' data-price='"+pdDto.pdPrice+"' data-color='"+diffColorList[0].color+"' data-colorcode='"+diffColorList[0].colorCode+"' onclick='showPrice(this)'>";
			content+="<label class='soldout' for='"+sizeList[i].sz+"s' title='"+sizeList[i].sz+"'>"+sizeList[i].sz+"</label>";
			content+="</li>";
			
		}else{
			content+="<li style='display:inline-block; margin-top:5px; margin-right:8px;'>";
			content+="<input type='radio' id='"+sizeList[i].sz+"s' name='sizes' value='"+sizeList[i].sz+"' data-pdcode='"+pdDto.pdCode+"' data-sizecode='"+sizeList[i].size_code+"' data-stock='"+sizeList[i].stockCount+"' data-price='"+pdDto.pdPrice+"' data-color='"+diffColorList[0].color+"' data-colorcode='"+diffColorList[0].colorCode+"' onclick='showPrice(this)'>";
			content+="<label for='"+sizeList[i].sz+"s' title='"+sizeList[i].sz+"'>"+sizeList[i].sz+"</label>";
			content+="</li>";
		}
	}
	content+="</ul> ";
	content+="</div>";
	if(pdDto.pdFeet != null){
		content+="<div class='fwidth op_top'>";
		content+="<div class='fwidth_guide'>";
		content+="<p class='op_title'>발볼 넓이</p>";
		content+="</div>";
		content+="<ul>";
		content+="<li>";
		content+="<input type='radio' id='fwidth' name='fwidth' value='"+pdDto.pdFeet+"' data-pdcode='"+pdDto.pdCode+"'>";
		content+="<label for='fwidth'>"+pdDto.pdFeet+"</label>";
		content+="</li>";
		content+="</ul>";
		content+="</div>";
	}

	content+="<div class='selected'>";
	content+="<ul id='selected_size' class='selected_list'>";
	content+="</ul>";
	content+="</div>";

	content+="<div class='total_price'>";
	content+="<div class='hide_box' style='display: none;'>";
	content+="<div class='won first'>";
	content+="<span class='tp_text'>합계</span>";
	content+="<span class='tp_money' id='tp_money'><strong></strong>원</span>";
	content+="</div>";
	content+="<div class='won'>";
	content+="<span class='ship_fee'>배송비</span>";
	content+="<span class='all_free'>전상품 무료배송</span>";
	content+="</div>";
	content+="<div class='card_benefit'>";
	content+="<span class='cb_text'>카드혜택</span>";
	content+="<span class='cb_details'><a href='/newbalance/product/benefitCardPop.jsp'>자세히 보기</a></span>";
	content+="</div>";
	content+="<div class='naver_banner'>";
	content+="<span class='naver_text'>네이버페이 포인트 혜택</span>";
	content+="<span class='naver_point'>최대 3% 적립</span>";
	content+="</div>";
	content+="</div>";
	content+="<div class='cart_buy'>";
	content+="<a href='javascript:;' class='cart' id='open_cart' onclick='addCart(this)'>장바구니</a>";
	content+="<a href='javascript:;' id='buyBtn' class='buy' onclick='buy(this);'>구매하기</a>";
	content+="</div>";
	content+="<p class='noti'>* 주문/배송/반품 등 일반 문의는 1:1 문의를 이용해 주시기 바랍니다.</p>";
	content+="</div>";

	if(pdDto.pdMemberonly == 1){
		content+="<div class='mb_only'>";
		content+="<p>뉴발란스 멤버 전용상품입니다</p>";
		content+="</div>";
	}
	content+="</div>";
	content+="</div>";
	content+="<div class='item_detailBottom' data-pdCode='"+pdDto.pdCode+"' data-color='"+diffColorList[0].color+"'></div>";
	content+="</div>";
	content+="</div>";
	content+="</div>";
	content+="</div>";			
					
	$(".item_detail").append(content);				
		

			}//if data==true
		}//success
			
	})//ajax
}
</script>

<script>



    </script>

<script>
function showPrice(self){
	//$(".hide_box").css("display","block");

		// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
		Number.prototype.format = function(){
		    if(this==0) return 0;
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		    return n;
		};

		// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
		String.prototype.format = function(){
		    var num = parseFloat(this);
		    if(isNaN(num)) return "0";
		    return num.format();
		};

		// 발볼넓이 값 select에 추가
		var value = $(".radio[name=fwidth]").val();
		var html = $("label[for=fwidth]").html();
		$("select[name=feet]").html($("<option value='" +  "selected='selected'>" + html + "</option>"));
	
		// 사진 클릭
		$(".img_list span").click(function() {
			$(".img_list span").each(function(i, element) {
				$(element).removeClass("active");
			})
			$(this).addClass("active");
			$(".main_img").prop("src", $(this).children("img").prop("src"));
		});
	    
 		// 확인 클릭 -> 모달창 닫기
	    $("#wishListModalClose").click(function() {
	        $("#wishListModal").css("display", "none");
	        $(".dimm_pop").css("display", "none");
	    }); 
	    // X 클릭 -> 모달창 닫기
	    $("#btnModalClose").click(function() {
		    $("#wishListModal").css("display", "none");
		   $(".dimm_pop").css("display", "none");
		});
	    
	    	        
 		// 쇼핑 계속하기 클릭 -> 모달창 닫기
	    $("#shoppingContinue").click(function() {
	        $("#cartListModal").css("display", "none");
	        $(".dimm_pop").css("display", "none");
	    }); 
	    // X 클릭 -> 모달창 닫기
	    $("#btnCloseCartModal").click(function() {
		    $("#cartListModal").css("display", "none");
		   $(".dimm_pop").css("display", "none");
		});
	
  
 	
		// 선택한 옵션 추가
		var total = 0; 
		var content ="";
		$("#size_list li label").click(function() {
			 var stock = $(this).siblings('input').data("stock");
			 // alert("재고 : " + stock);
			
			if (total >= $("#maximum").html() || total >= stock) { //
				// 구매제한 수량 있는 경우
				if($("#maximum").html() != null){
					alert("해당 상품은 최대 " + $("#maximum").html() + "pcs까지 구매가능합니다.");
				}else if($("#maximum").html() == null && stock >= 10){  // 구매제한 수량 없는 경우(재고로 관리)
					alert("10개 까지 구매가능합니다.");
				}else{
					alert(stock + "개 까지 구매가능합니다.");
				}
			}else{
				
				 content  += "<li class='clearfix' data-size='"+$(self).val()+"' data-cartcount='1' data-pdstock='" + stock + "'>"
	 				+ "<span class='selected_op'>"
	 				//+ $('#color_list li input:checked').siblings('label').prop('title') + "/"
	 				+ $(self).data("color") + "/"
	 				+ $(this).siblings('input').val();
	 				
		 	 		if($('#fwidth').val() != null) {
		 				content += "/" + $('#fwidth').val();
		 			} 
	 			 
	 				content += "</span><div class='plusminus_wrap' style='width:94px;'><input type='text' class='pd_amount' name='pd_amout' title='수량설정' value='1' maxlength=";
	 				
	 				if($("#maximum").html() != null){
	 					content += $("#maximum").html() + "'>";
	 				}else if($("#maximum").html() == null && stock >= 10){  // 구매제한 수량 없는 경우(재고로 관리)
	 					content += "10'>";
					}else{
						content += stock + "'>";
					}
	 				
	 				content += "<button type='button' class='btn_minus' onclick='minus(this)'></button><button type='button' class='btn_plus' data-stock='" + stock + "' onclick='plus(this)'></button></div>"
					+ "<span class='each_price'><strong class='inner_price'>"
					+ $(self).data("price") + "</strong>원</span>"
					+ "<a class='delete' href='javascript:void(0);' onclick='delete_op(this)'></a></li>";
				$("#selected_size").append(content); 
	
				$(".hide_box").show();
			
				var eachPrice = Number($("#item_price").html().replaceAll(",", ""));
				var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
				tp_money += eachPrice;
				$(".tp_money strong").html(tp_money.format());
				
				total += 1;
				// alert("total : " + total);
			}
		 });
	    
						
	// 옵션 삭제
	function delete_op(self) {
		var index = $(self).parent("li").index() + 1;
		// console.log(index);
	
		// 금액 차감
		var curPrice = Number($("#selected_size>li:nth-of-type(" + index + ")").children("span.each_price").children("strong").html().replaceAll(",", ""));
		var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
		tp_money -= curPrice;
		$(".tp_money strong").html(tp_money.format());
		
		// 개수 차감 - NaN ******
		total -= Number($("#selected_size>li:nth-of-type(" + index + ")").children("div").children("value").val());
		
		$(".delete").parent("li:nth-of-type(" + index + ")").remove();
		$(".delete2").parent("li:nth-of-type(" + index + ")").remove();
		// alert("total : " + total);
	}
	
	// - 버튼 클릭 시
	function minus(self) {
		var value = $(self).siblings("input").val();
		var index = $(self).parent("div").parent("li").index() + 1;
		
		if (value != 1) {
			$("#selected_size > li:nth-of-type(" + index +")").children("div").children("input").val(value - 1);
			$("#op_quickadd > li:nth-of-type(" + index +")").children("div").children("input").val(value - 1);
			var curPrice = Number($("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html().replaceAll(",", ""));
			var eachPrice = Number($("#item_price").html().replaceAll(",", ""));
			$("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html(Number(curPrice - eachPrice).format());

			var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
			tp_money -= eachPrice;
			$(".tp_money strong").html(tp_money.format());
			
			if($("#maximum").html() != null){
				total -= 1;
				// console.log("total : " + total);
			}else{
				total -= 1;
				value -= 1;
				// console.log("total : " + total);
				// console.log("value : " + value);
			}
		}
	};
	
	
	// 수량 증가 함수
	function plus_count(index, value, stock){
		console.log("tttt : ", value);
		$("#selected_size > li:nth-of-type(" + index +")").children("div").children("input").val(value + 1);
		$("#op_quickadd > li:nth-of-type(" + index +")").children("div").children("input").val(value + 1);
		var curPrice = Number($("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html().replaceAll(",", ""));
		var eachPrice = Number($("#item_price").html().replaceAll(",", ""));
		$("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html(Number(curPrice + eachPrice).format());
		
		var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
		tp_money += eachPrice;
		$(".tp_money strong").html(tp_money.format());
		
		if($("#maximum").html() != null){
			total += 1;
		}else{
			value += 1;
		}

	}

	// + 버튼 클릭 시
	function plus(self) {		
		var index = $(self).parent("div").parent("li").index() + 1;
		var value = Number($(self).siblings("input").val());
		var stock = $(self).data("stock");
		// console.log("index : " + index);
		// alert("인덱스 : " + index);
		// alert("재고 : " + stock);
		// alert("수량 : " + value);
	
		// 회원구매전용 상품 O => value == 구매제한개수
		// 회원구매전용 상품 X, 재고수량 10개 이상 => value == 10
		// 회원구매전용 상품 X, 재고수량 10개 이하 => value == 재고수량
		
		 if($("#maximum").html() != null){
			if (total>= $("#maximum").html()) {
				alert("해당 상품은 최대 " + $("#maximum").html() + "pcs까지 구매가능합니다.");
			}else{
				plus_count(index, value, stock);
			}
		}else if($("#maximum").html() == null && stock >= 10){  // 구매제한 수량 없는 경우(재고로 관리)
			if (value >= 10) {
				alert("10개까지 구매가능합니다.");
			}else{
				plus_count(index, value, stock);
			}
		}else if($("#maximum").html() == null && stock < 10){
			if (value >= stock) {
				alert(stock + "개까지 구매가능합니다.");
			}else{
				plus_count(index, value, stock);
			}
		}
	};

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
		Number.prototype.format = function(){
		    if(this==0) return 0;
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		    return n;
		};

		// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
		String.prototype.format = function(){
		    var num = parseFloat(this);
		    if(isNaN(num)) return "0";
		    return num.format();
		};

		// 발볼넓이 값 select에 추가
		var value = $(".radio[name=fwidth]").val();
		var html = $("label[for=fwidth]").html();
		$("select[name=feet]").html($("<option value='" +  "selected='selected'>" + html + "</option>"));
	
		// 사진 클릭
		$(".img_list span").click(function() {
			$(".img_list span").each(function(i, element) {
				$(element).removeClass("active");
			})
			$(this).addClass("active");
			$(".main_img").prop("src", $(this).children("img").prop("src"));
		});
	    
 		// 확인 클릭 -> 모달창 닫기
	    $("#wishListModalClose").click(function() {
	        $("#wishListModal").css("display", "none");
	        $(".dimm_pop").css("display", "none");
	    }); 
	    // X 클릭 -> 모달창 닫기
	    $("#btnModalClose").click(function() {
		    $("#wishListModal").css("display", "none");
		   $(".dimm_pop").css("display", "none");
		});
	    
	    	        
 		// 쇼핑 계속하기 클릭 -> 모달창 닫기
	    $("#shoppingContinue").click(function() {
	        $("#cartListModal").css("display", "none");
	        $(".dimm_pop").css("display", "none");
	    }); 
	    // X 클릭 -> 모달창 닫기
	    $("#btnCloseCartModal").click(function() {
		    $("#cartListModal").css("display", "none");
		   $(".dimm_pop").css("display", "none");
		});
	
  
 	
		// 선택한 옵션 추가
		var total = 0; 
		var content ="";
		$("#size_list li label").click(function() {
			 var stock = $(this).siblings('input').data("stock");
			 // alert("재고 : " + stock);
			
			if (total >= $("#maximum").html() || total >= stock) { //
				// 구매제한 수량 있는 경우
				if($("#maximum").html() != null){
					alert("해당 상품은 최대 " + $("#maximum").html() + "pcs까지 구매가능합니다.");
				}else if($("#maximum").html() == null && stock >= 10){  // 구매제한 수량 없는 경우(재고로 관리)
					alert("10개 까지 구매가능합니다.");
				}else{
					alert(stock + "개 까지 구매가능합니다.");
				}
			}else{
				
				 content  += "<li class='clearfix' data-pdcode='${ pdDto.pdCode }' data-cartcount='${ cartCount }' data-pdstock='" + stock + "'>"
	 				+ "<span class='selected_op'>"
	 				//+ $('#color_list li input:checked').siblings('label').prop('title') + "/"
	 				+ $(self).data("color") + "/"
	 				+ $(this).siblings('input').val();
	 				
		 	 		if($('#fwidth').val() != null) {
		 				content += "/" + $('#fwidth').val();
		 			} 
	 			 
	 				content += "</span><div class='plusminus_wrap' style='width:94px;'><input type='text' class='pd_amount' name='pd_amout' title='수량설정' value='1' maxlength=";
	 				
	 				if($("#maximum").html() != null){
	 					content += $("#maximum").html() + "'>";
	 				}else if($("#maximum").html() == null && stock >= 10){  // 구매제한 수량 없는 경우(재고로 관리)
	 					content += "10'>";
					}else{
						content += stock + "'>";
					}
	 				
	 				content += "<button type='button' class='btn_minus' onclick='minus(this)'></button><button type='button' class='btn_plus' data-stock='" + stock + "' onclick='plus(this)'></button></div>"
					+ "<span class='each_price'><strong class='inner_price'>"
					+ $(self).data("price") + "</strong>원</span>"
					+ "<a class='delete' href='javascript:void(0);' onclick='delete_op(this)'></a></li>";
				$("#selected_size").append(content); 
	
				$(".hide_box").show();
	

			
				var eachPrice = Number($("#item_price").html().replaceAll(",", ""));
				var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
				tp_money += eachPrice;
				$(".tp_money strong").html(tp_money.format());
				
				total += 1;
				// alert("total : " + total);
			}
		 });
	    
						
	// 옵션 삭제
	function delete_op(self) {
		var index = $(self).parent("li").index() + 1;
		// console.log(index);
	
		// 금액 차감
		var curPrice = Number($("#selected_size>li:nth-of-type(" + index + ")").children("span.each_price").children("strong").html().replaceAll(",", ""));
		var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
		tp_money -= curPrice;
		$(".tp_money strong").html(tp_money.format());
		
		// 개수 차감 - NaN ******
		total -= Number($("#selected_size>li:nth-of-type(" + index + ")").children("div").children("value").val());
		
		$(".delete").parent("li:nth-of-type(" + index + ")").remove();
		$(".delete2").parent("li:nth-of-type(" + index + ")").remove();
		// alert("total : " + total);
	}
	
	// - 버튼 클릭 시
	function minus(self) {
		var value = $(self).siblings("input").val();
		var index = $(self).parent("div").parent("li").index() + 1;
		
		if (value != 1) {
			$("#selected_size > li:nth-of-type(" + index +")").children("div").children("input").val(value - 1);
			$("#op_quickadd > li:nth-of-type(" + index +")").children("div").children("input").val(value - 1);
			var curPrice = Number($("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html().replaceAll(",", ""));
			var eachPrice = Number($("#item_price").html().replaceAll(",", ""));
			$("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html(Number(curPrice - eachPrice).format());

			var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
			tp_money -= eachPrice;
			$(".tp_money strong").html(tp_money.format());
			
			if($("#maximum").html() != null){
				total -= 1;
				// console.log("total : " + total);
			}else{
				total -= 1;
				value -= 1;
				// console.log("total : " + total);
				// console.log("value : " + value);
			}
		}
	};
	
	
	// 수량 증가 함수
	function plus_count(index, value, stock){
		$("#selected_size > li:nth-of-type(" + index +")").children("div").children("input").val(value + 1);
		$("#op_quickadd > li:nth-of-type(" + index +")").children("div").children("input").val(value + 1);
		var curPrice = Number($("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html().replaceAll(",", ""));
		var eachPrice = Number($("#item_price").html().replaceAll(",", ""));
		$("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html(Number(curPrice + eachPrice).format());
		
		var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
		tp_money += eachPrice;
		$(".tp_money strong").html(tp_money.format());
		
		if($("#maximum").html() != null){
			total += 1;
		}else{
			value += 1;
		}

	}

	// + 버튼 클릭 시
	function plus(self) {		
		var index = $(self).parent("div").parent("li").index() + 1;
		var value = Number($(self).siblings("input").val());
		var stock = $(self).data("stock");
		// console.log("index : " + index);
		// alert("인덱스 : " + index);
		// alert("재고 : " + stock);
		// alert("수량 : " + value);
	
		// 회원구매전용 상품 O => value == 구매제한개수
		// 회원구매전용 상품 X, 재고수량 10개 이상 => value == 10
		// 회원구매전용 상품 X, 재고수량 10개 이하 => value == 재고수량
		
		 if($("#maximum").html() != null){
			if (total>= $("#maximum").html()-1) {
				alert("해당 상품은 최대 " + $("#maximum").html() + "pcs까지 구매가능합니다.");
			}else{
				plus_count(index, value, stock);
			}
		}else if($("#maximum").html() == null && stock >= 10){  // 구매제한 수량 없는 경우(재고로 관리)
			if (value >= 10) {
				alert("10개까지 구매가능합니다.");
			}else{
				plus_count(index, value, stock);
			}
		}else if($("#maximum").html() == null && stock < 10){
			if (value >= stock) {
				alert(stock + "개까지 구매가능합니다.");
			}else{
				plus_count(index, value, stock);
			}
		}
	};

	// 관심상품 담기
	   function wishList(self){
	      // if 로그인 X -> true - 로그인 페이지로 이동, false - 창 닫기
	      var usercode = "${ userCode }"; 
	      if(usercode == ""){
	         var result = confirm("로그인 이후 사용가능합니다.\n로그인 페이지로 이동하시겠습니까?");
	         if(result == true){
	            location.replace("<%=contextPath%>/customer/login.action");
	         }else{
	            return;
	         }
	      } else{
	         var array = new Array();
	         array.push( $(self).data("pdcode") );
	         console.log(array);
	         console.log(JSON.stringify(array));
	         $.ajax({
	            url : '/newbalance/product/wishList.json',
	            type : 'POST',   
	            async : false,
	            dataType : 'text',
	            cache : false,
	            data : {
	               "wishCodeList" : array
	            },        
	            success : function(data){
	               if(data == "00"){
	                  $("#like_item").addClass("on");
	               }
	               if(data == "99"){
	                   $("#wishListTitle").html("이미 관심상품으로 등록된 상품입니다.");
	                }
	               $("#wishListModal").css({
	                    "top": (($(window).height()-$("#wishListModal").outerHeight())/2+$(window).scrollTop())+"px",
	                    "display" : "block"
	                 });
	                 $(".dimm_pop").css("display", "block"); 
	            },
	            error: function(data){
	                alert("에러가 발생했습니다.");
	            }
	         });
	      }  
	   };
																				//http://localhost/newbalance/payment/order.action
   var payForm = $("<form id='payForm' name='payForm' action='<%=contextPath%>/payment/order.action' method='post'></form>");
   payForm.appendTo("body");

   var payInput = $("#size_list input");

  function buy(self){
      var usercode = "${ userCode }"; 
      if(usercode == ""){
         var result = confirm("로그인 이후 사용가능합니다.\n로그인 페이지로 이동하시겠습니까?");
         if(result == true){
            location.replace("<%=contextPath%>/customer/login.action");
         }else{
            return;
         }
      }else{
	  
         if($("#selected_size").html() == ""){
            alert("사이즈를 선택해주세요.");
            return;
         }else{
        	
        		console.log("상품코드 : " + $("#size_list input").data("pdcode") ) ;
        		console.log("총 가격 : " + $("#tp_money strong").html().replaceAll(",", ""))
        		console.log("사이즈 : " + $("#selected_size .clearfix").data("size"))
        		console.log("개수 : " + $("#selected_size .pd_amount").val())
        		console.log("상품이미지 : " + $(".main_img").prop("src"))
        		console.log("상품이름 : " + $(".item_detailTop .item_option .pd_name").html())
        		console.log("색상 : " + $("#size_list input").data("color"))
        		console.log("색상코드 : " + $("#size_list input").data("colorcode"))
        		console.log("사이즈코드 : " + $("#size_list input").data("sizecode") )
        	 
       	  	payForm.append(  $("<input/>", {type:'hidden',name:'pdCode' , id:'pd_code' , value:$("#size_list input").data("pdcode") } ) );//상품코드
       	 	payForm.append(  $("<input/>", {type:'hidden',name:'pdPrice' , id:'pd_price' , value:$("#tp_money strong").html().replaceAll(",", "")  } ) );//총 합계
       	  	payForm.append(  $("<input/>", {type:'hidden',name:'pdSize' , id:'pd_size' , value:$("#selected_size .clearfix").data("size") } ) );//사이즈
       	 	payForm.append(  $("<input/>", {type:'hidden',name:'pdAmount' , id:'pd_amount' , value:$("#selected_size .pd_amount").val() } ) );//개수
       		payForm.append(  $("<input/>", {type:'hidden',name:'pdImage' , id:'pd_image' , value:$(".main_img").prop("src") } ) );//상품이미지
       		payForm.append(  $("<input/>", {type:'hidden',name:'pdName' , id:'pd_name' , value:$(".item_detailTop").children(".item_option").children(".pd_name").html() } ) );//상품이름
       		payForm.append(  $("<input/>", {type:'hidden',name:'pdColor' , id:'pd_color' , value:$("#size_list input").data("color")   }) );//상품색상
       		payForm.append(  $("<input/>", {type:'hidden',name:'sizeCode' , id:'sizeCode' , value:$("#size_list input").data("sizecode")  }) );//   sizeCode
       		payForm.append(  $("<input/>", {type:'hidden',name:'colorCode' , id:'color_code' , value:$("#size_list input").data("colorcode")}) );//컬러 코드
            $("#payForm").submit();
         }
      }
   };
	 

<%--
// 장바구니 담기    
   function addCart(self){
      // let array = new Array();  //Object를 배열로 저장할 Array
      var sizecode;
      var usercode = "${ userCode }"; 
      if($("#selected_size").html() == ""){
         alert("사이즈를 선택해 주세요.");
      } else{
         $("#cartInfo").html("");
         color = "${colorDto.color}";
         pdImage = $("#main_img").prop("src");
         
         $("#selected_size li").each(function(i, element){
            var content = "<li>"
                     + $(element).children(".selected_op").html() + " "
                     + $(element).children("div").children("input").val() + "개 "
                     + $(element).children("span.each_price").children("strong").html() + "원</li>";
            $("#cartInfo").append(content);
            
            var size = $(element).children(".selected_op").html().split("/")[1];
            console.log(size);
            $("#size_code option").each(function(i, element) {
               if($(element).val() == size){
                  sizecode = $(element).data("sizecode");
               }
            });
            console.log(sizecode);
            $("#sizeCode").val(sizecode);         
            //array.push(sizeCode);
         });
         //console.log(array.pdCode);
         $.ajax({
            url : '/newbalance/product/addCart.ajx',
            type : 'POST',   
            async : false,
            dataType : 'json',
            cache : false,
            data : $("#buy_form").serialize(), 
            success : function(data){
               if(data.result == "00"){
                  $("#cartListModal").css({
                       "top": (($(window).height()-$("#wishListModal").outerHeight())/2+$(window).scrollTop())+"px",
                       "display" : "block"
                    });
                    $(".dimm_pop").css("display", "block"); 
               }
               if(data.result == "99"){
                   alert("장바구니 담기에 실패하였습니다.");
                }
            },
            error: function(data){
                alert("에러가 발생했습니다.");
            }
         });
      }
   }--%>
</script>

<!-- 관심상품 모달창 -->
   <div class="modal" id="wishListModal"
      style="position:absolute; display: none;">
      <div class="modal_inner">
         <div class="square">
            <div class="interest">
               <strong class="txt1" id="wishListTitle">관심상품으로 등록되었습니다.</strong>
               <p class="txt2">
                  등록하신 내역은 <span>‘마이페이지 &gt; 상품내역 &gt; 관심상품’</span>에서<br>확인하실 수
                  있습니다.
               </p>
               <div class="btn_area">
                  <a href="javascript:void(0);" id="wishListModalClose"
                     class="btn_ok">확인</a>
               </div>
            </div>
            <button type="button" class="btn_close" id="btnModalClose">
               <img
                  src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png"
                  alt="팝업 닫기">
            </button>
         </div>
      </div>
   </div>
 <script>
//확인 클릭 -> 모달창 닫기
 $("#wishListModalClose").click(function() {
     $("#wishListModal").css("display", "none");
     //$(".dimm_pop").css("display", "none");
 }); 
 // X 클릭 -> 모달창 닫기
 $("#btnModalClose").click(function() {
    $("#wishListModal").css("display", "none");
   //$(".dimm_pop").css("display", "none");
});
 </script>
 <jsp:include page="/common/footer.jsp" flush="false" />
</body>
</html>
