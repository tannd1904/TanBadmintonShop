<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>N17DCCN150</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/slider.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/sub.js"></script>
<base href="${pageContext.servletContext.contextPath }" />
<style>
<%@ include file="/resources/css/reset.css"%>
<%@ include file="/resources/css/index.css"%>
<%@ include file="/resources/css/home.css"%>
<%@ include file="/resources/css/list-pro.css"%>
<%@ include file="/resources/css/pro-del.css"%>
<%@ include file="/resources/css/checkout.css"%>
</style>
</head>
<body>
	<div class="icon-bar">
		<a onclick="openCart()" class="carticon"><i class="fas fa-shopping-cart"></i></a>
		<a href="#" class="facebook"><i class="fa fa-facebook"></i></a> 
	    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a> 
	    <a href="#" class="google"><i class="fa fa-google"></i></a> 
	    <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
	    <a href="#" class="youtube"><i class="fa fa-youtube"></i></a> 
	</div>
	
	<div id="mySidebar" class="sidebar">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">??</a>
	  <a href="#">About</a>
	  <a href="#">Services</a>
	  <a href="#">Clients</a>
	  <a href="#">Contact</a>
	</div>
	
	<div id="main">
	  <button class="openbtn" onclick="openNav()">???</button>  
	</div>
	
	<div id="myCart" class="cartslide" style="background-color: #4ac4f1;">
		<a href="javascript:void(0)" class="closebtn" onclick="closeCart()"><i class="far fa-times-circle "></i></a>
		      <h1>Gi??? H??ng</h1>
		      <div class="right-cont">
                	<br>
					<c:forEach var="a" items="${cart}">
					<div class="item-cart ">
						<a class="del" href="${pageContext.request.contextPath}/home/deletecart.htm?idSanPham=${a.idSanPham}"><i class="far fa-times-circle "></i></a>
                        <img src="${pageContext.request.contextPath}/resources/img/pro/${a.image}" alt=" ">
                        <div class="item-cart1 ">
                            <a class="pr"  href="${pageContext.request.contextPath}/detail/${a.idSanPham}.htm">${a.tenSanPham}</a>
                            <div class="sl-tt ">
                                <select   name="size${a.idSanPham}" id="size" class="size">
		                        <c:forEach var="sz" items="${prode}">
		                       		<c:if test="${sz.product.id==a.idSanPham}">
		                       		<c:choose>
		                       			<c:when test="${a.size==sz.size}">
		                       				<option selected="selected" value="${sz.size}">${sz.size}</option>
		                       			</c:when>
		                       			<c:otherwise><option value="${sz.size}">${sz.size}</option></c:otherwise>
		                       		</c:choose>
		                       		</c:if>
		                       </c:forEach>   
                                </select >
                                <c:forEach var="sz" items="${prode}">
                                	<c:if test="${sz.product.id==a.idSanPham && sz.size == a.size}">
                                		<input type="number" name="sl${a.idSanPham}" min="0" max="${sz.quanlity}" value="${a.soLuong}" >
                                	</c:if>
                                </c:forEach>
                                <h4><fmt:formatNumber pattern="###,### VND" value="${a.giaSanPham*a.soLuong}" type="currency" /></h4>                     
                            </div>
                        </div>
                    </div>
					</c:forEach>
                    <div class="sum ">
                        <div class="s-t ">
                            <h4><b>Th??nh Ti???n:</b></h4>
                            <h1><fmt:formatNumber pattern="###,### VND" value="${tongTien}" type="currency" /></h1> 
                        </div>
                    </div>
                    <div class="btn">
                    	<a href="${pageContext.request.contextPath}/home/order.htm">Thanh to??n</a>
                    </div>
                </div>
            </div>
	
	

	<header>
		<div class="container">
			<div class="logo">
				<a href=""><img
					src="${pageContext.request.contextPath}/resources/img/logo/tanshop-logo.png" alt="Logo Shop"></a>
			</div>
			<div class="contener1">
					<ul class="navbar">
										
						<c:forEach var="menu1" items="${menu}">
							<c:if test="${menu1.parentid==null}">
								<li>
									<a href="${pageContext.request.contextPath}/${menu1.link}">${menu1.name}</a>
									<div class="sub-menu">
										<div class="sub-menu1">
											<ul>
												<c:forEach var="menu2" items="${menu}">
													<c:if test="${menu2.parentid==menu1.id}">
														<li><a href="${pageContext.request.contextPath}/list/${menu2.link}.htm">${menu2.name }</a></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
                <div class="navbar-right">
                	<form action="${pageContext.request.contextPath}/list/search.htm">
                		<div class="search">
	                        <input class="ip-search" name="search_string" placeholder="Search..."/>
	                        <button><i class="fas fa-search icon-search"></i></button>
	                    </div>
                	</form>
                     <div class="dropdown">
					    <button class="dropbtn">Ch??o, ${username }
					    </button>
					    <div class="dropdown-content">
					      <c:choose>
					      	<c:when test="${username=='Guest' }">
					      		<a href="${pageContext.request.contextPath}/home/login.htm">????ng nh???p</a>
					      		<a href="${pageContext.request.contextPath}/home/sign-up.htm">????ng k??</a>
					      	</c:when>
					      	<c:otherwise>
					      		<a href="${pageContext.request.contextPath}/home/logout.htm"> ????ng xu???t</a>
					      	</c:otherwise>
					      </c:choose>
					    </div>
					</div> 
                </div>
			</div>
		</div>
		
		<div id="user" class="user-box">
            <span onclick="document.getElementById('user').style.display='none'" class="close" title="Close Modal">&times;</span>
            <div class="user-content">
                <div class="content-top">
                    <i class="fas fa-user-circle"></i>
                    <a>${username}</a>
                </div>
                <div class="content-bottom">
                    <c:choose>
                    	<c:when test="${username=='Guest'}">
                    		<button > <a href="${pageContext.request.contextPath}/home/login.htm"> ????ng nh???p</a> </button>
                    		<button > <a href="${pageContext.request.contextPath}/home/sign-up.htm"> ????ng k??</a> </button>
                    	</c:when>
                    	<c:otherwise><button > <a href="${pageContext.request.contextPath}/home/logout.htm"> ????ng xu???t</a> </button></c:otherwise>
                    </c:choose>
                </div>
            </div> 
        </div>
	</header>
	
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
    <div class="container-list-produce">
    	            
        
        <div class="right-content">
            <div class="sort-filter">
                <select id="filter_price" class="filter_price">
                    <option value="none">B??? l???c</option>

                    <option data-text="D?????i 300.000 VND" value="(price:product<=300000)">
                        D?????i 300.000 VND
                    </option>

                    <option data-text="300 - 500.000 VND" value="(price:product>300000)&amp;&amp;(price:product<500000)">
                        300 - 500.000 VND
                    </option>

                    <option data-text="500 - 1.000.000 VND" value="(price:product>=500000)&amp;&amp;(price:product<1000000)">
                        500 - 1.000.000 VND
                    </option>
                    <option data-text="Tr??n 1.000.000 VND" value="(price:product>=1000000)">
                        Tr??n 1.000.000 VND
                    </option>
            </select>
                <select name="SortBy" class="sort-by" id="SortBy">
                <option value="manual">S???p x???p:</option>
                <option value="quantity-descending" data-filter="(quantity:product=desc)">T???n Kho: Gi???m d???n</option>
                <option value="price-ascending" data-filter="(price:product=asc)">Gi??: T??ng d???n</option>
                <option value="price-descending" data-filter="(price:product=desc)">Gi??: Gi???m d???n</option>
                <option value="title-ascending" data-filter="(title:product=asc)">T??n: A-Z</option>
                <option value="title-descending" data-filter="(title:product=desc)">T??n: Z-A</option>
                <option value="created-ascending" data-filter="(updated_at:product=asc)">C?? nh???t</option>
                <option value="created-descending" data-filter="(updated_at:product=desc)">M???i nh???t</option>
                <option value="best-selling" data-filter="(sold_quantity:product=desc)">B??n ch???y nh???t</option>
            </select>
            </div>
            <button onclick="sortList()">Sort</button>
            <hr>
            <c:choose>
            	<c:when test="${type == 2 }">
	            	<div class="size-content ">
	                <h3>SIZE</h3>
	                <ul id="sort_size" class="list-size list-fm">
	                    <li class="advanced-filter" data-text="36">
	                        <label>
								<span data-value="(variantonhand:product**36)">36</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="37">
	                        <label>
								<span data-value="(variantonhand:product**37)">37</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="38">
	                        <label>
								<span data-value="(variantonhand:product**38)">38</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="39">
	                        <label>
								<span data-value="(variantonhand:product**39)">39</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="40">
	                        <label>
								<span data-value="(variantonhand:product**40)">40</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="41">
	                        <label>
								<span data-value="(variantonhand:product**41)">41</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="42">
	                        <label>
								<span data-value="(variantonhand:product**42)">42</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="43">
	                        <label>
								<span data-value="(variantonhand:product**43)">43</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="44">
	                        <label>
								<span data-value="(variantonhand:product**44)">44</span>
							</label>
	                    </li>
	                </ul>
	            </div>
	            <div class="coler-content list-fm">
	                <h3>M??U S???C</h3>
	                <ul id="color" class="list-color list-fm">
	                    <li class="advanced-filter" data-text="Cam">
	                        <label>
								<span data-value="(variantonhand:product**Cam)" class="catalog_color cam" style="background-color:#ff6600" title="Cam">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="??en">
	                        <label>
								<span data-value="(variantonhand:product**??en)" class="catalog_color den" style="background-color:#000000" title="??en">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="????? ?????m">
	                        <label>
								<span data-value="(variantonhand:product**????? ?????m)" class="catalog_color do-dam" style="background-color:#cc0000" title="????? ?????m">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="?????">
	                        <label>
								<span data-value="(variantonhand:product**?????)" class="catalog_color do" style="background-color:#ff0000" title="?????">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="N??u ?????t">
	                        <label>
								<span data-value="(variantonhand:product**N??u ?????t)" class="catalog_color nau-dat" style="background-color:#974706" title="N??u ?????t">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="N??u">
	                        <label>
								<span data-value="(variantonhand:product**N??u)" class="catalog_color nau" style="background-color:#9e4b07" title="N??u">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="R??u">
	                        <label>
								<span data-value="(variantonhand:product**R??u)" class="catalog_color reu" style="background-color:#76933c" title="R??u">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Tr???ng">
	                        <label>
								<span data-value="(variantonhand:product**Tr???ng)" class="catalog_color trang" style="background-color:#f9f9f9" title="Tr???ng">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="V??ng">
	                        <label>
								<span data-value="(variantonhand:product**V??ng)" class="catalog_color vang" style="background-color:#ffff00" title="V??ng">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="X??m">
	                        <label>
								<span data-value="(variantonhand:product**X??m)" class="catalog_color xam" style="background-color:#a6a6a6" title="X??m">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh D????ng ?????m">
	                        <label>
								<span data-value="(variantonhand:product**Xanh D????ng ?????m)" class="catalog_color xanh-duong-dam" style="background-color:#000099" title="Xanh D????ng ?????m">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh D????ng">
	                        <label>
								<span data-value="(variantonhand:product**Xanh D????ng)" class="catalog_color xanh-duong" style="background-color:#0000ff" title="Xanh D????ng">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh D????ng L???t">
	                        <label>
								<span data-value="(variantonhand:product**Xanh D????ng L???t)" class="catalog_color xanh-duong-lot" style="background-color:#3399ff" title="Xanh D????ng L???t">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh Mi N??">
	                        <label>
								<span data-value="(variantonhand:product**Xanh Mi N??)" class="catalog_color xanh-mi-no" style="background-color:#99ff33" title="Xanh Mi N??">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh">
	                        <label>
								<span data-value="(variantonhand:product**Xanh)" class="catalog_color xanh" style="background-color:#003399" title="Xanh">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh Nh???t">
	                        <label>
								<span data-value="(variantonhand:product**Xanh Nh???t)" class="catalog_color xanh-nhot" style="background-color:#003399" title="Xanh Nh???t">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="H???ng">
	                        <label>
								<span data-value="(variantonhand:product**H???ng)" class="catalog_color hong" style="background-color:#ff00cc" title="H???ng">&nbsp;</span>
							</label>
	                    </li>
	                </ul>
	            </div>
            </c:when>
            <c:when test="${type == 3 }">
	            	<div class="size-content ">
	                <h3>SIZE</h3>
	                <ul id="sort_size" class="list-size list-fm">
	                    <li class="advanced-filter" data-text="XS">
	                        <label>
								<span data-value="(variantonhand:product**XS)">XS</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="S">
	                        <label>
								<span data-value="(variantonhand:product**S)">S</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="M">
	                        <label>
								<span data-value="(variantonhand:product**M)">M</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="L">
	                        <label>
								<span data-value="(variantonhand:product**L)">L</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="XL">
	                        <label>
								<span data-value="(variantonhand:product**XL)">XL</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="XXL">
	                        <label>
								<span data-value="(variantonhand:product**XXL)">XXL</span>
							</label>
	                    </li>
	                </ul>
	            </div>
	            <div class="coler-content list-fm">
	                <h3>M??U S???C</h3>
	                <ul id="color" class="list-color list-fm">
	                    <li class="advanced-filter" data-text="Cam">
	                        <label>
								<span data-value="(variantonhand:product**Cam)" class="catalog_color cam" style="background-color:#ff6600" title="Cam">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="??en">
	                        <label>
								<span data-value="(variantonhand:product**??en)" class="catalog_color den" style="background-color:#000000" title="??en">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="????? ?????m">
	                        <label>
								<span data-value="(variantonhand:product**????? ?????m)" class="catalog_color do-dam" style="background-color:#cc0000" title="????? ?????m">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="?????">
	                        <label>
								<span data-value="(variantonhand:product**?????)" class="catalog_color do" style="background-color:#ff0000" title="?????">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="N??u ?????t">
	                        <label>
								<span data-value="(variantonhand:product**N??u ?????t)" class="catalog_color nau-dat" style="background-color:#974706" title="N??u ?????t">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="N??u">
	                        <label>
								<span data-value="(variantonhand:product**N??u)" class="catalog_color nau" style="background-color:#9e4b07" title="N??u">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="R??u">
	                        <label>
								<span data-value="(variantonhand:product**R??u)" class="catalog_color reu" style="background-color:#76933c" title="R??u">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Tr???ng">
	                        <label>
								<span data-value="(variantonhand:product**Tr???ng)" class="catalog_color trang" style="background-color:#f9f9f9" title="Tr???ng">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="V??ng">
	                        <label>
								<span data-value="(variantonhand:product**V??ng)" class="catalog_color vang" style="background-color:#ffff00" title="V??ng">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="X??m">
	                        <label>
								<span data-value="(variantonhand:product**X??m)" class="catalog_color xam" style="background-color:#a6a6a6" title="X??m">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh D????ng ?????m">
	                        <label>
								<span data-value="(variantonhand:product**Xanh D????ng ?????m)" class="catalog_color xanh-duong-dam" style="background-color:#000099" title="Xanh D????ng ?????m">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh D????ng">
	                        <label>
								<span data-value="(variantonhand:product**Xanh D????ng)" class="catalog_color xanh-duong" style="background-color:#0000ff" title="Xanh D????ng">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh D????ng L???t">
	                        <label>
								<span data-value="(variantonhand:product**Xanh D????ng L???t)" class="catalog_color xanh-duong-lot" style="background-color:#3399ff" title="Xanh D????ng L???t">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh Mi N??">
	                        <label>
								<span data-value="(variantonhand:product**Xanh Mi N??)" class="catalog_color xanh-mi-no" style="background-color:#99ff33" title="Xanh Mi N??">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh">
	                        <label>
								<span data-value="(variantonhand:product**Xanh)" class="catalog_color xanh" style="background-color:#003399" title="Xanh">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="Xanh Nh???t">
	                        <label>
								<span data-value="(variantonhand:product**Xanh Nh???t)" class="catalog_color xanh-nhot" style="background-color:#003399" title="Xanh Nh???t">&nbsp;</span>
							</label>
	                    </li>
	                    <li class="advanced-filter" data-text="H???ng">
	                        <label>
								<span data-value="(variantonhand:product**H???ng)" class="catalog_color hong" style="background-color:#ff00cc" title="H???ng">&nbsp;</span>
							</label>
	                    </li>
	                </ul>
	            </div>
            </c:when>
            </c:choose>
            
        </div>
        
        <div style="border-left: 2px solid yellow" class="left-content">
			<br>
			<c:choose>
				<c:when test="${type == 0 }"> 
					<h2 style="margin: 0 200px;">Kh??ng c?? s???n ph???m n??o</h2>
				</c:when>
				<c:otherwise>
					<div id="listPro" class="content-pro">
		            	<c:forEach var="pn" items="${item}">
						<div class="item-pro">
			                <div class="sale">
			                    <a href="${pageContext.request.contextPath}/detail/${pn.id}.htm"><img src="${pageContext.request.contextPath}/resources/img/pro/${pn.img1}" alt=""></a>
			                    <c:if test="${pn.sale!=0}">
			                    	<h1>-${pn.sale}%</h1>
			                    </c:if>
			                </div>
			                <a class="proName" href="">${pn.name}</a>
			                <h3>${pn.coler}</h3>
		                <div style="margin-top: 5px" class="price">
		                    <c:if test="${pn.sale==0}">
		                    	<h3><fmt:formatNumber pattern="###,### VND" value="${pn.price}" type="currency" /></h3>
		                    </c:if>
		                    <c:if test="${pn.sale!=0}">
		                    	<del><h3><fmt:formatNumber pattern="###,###" value="${pn.price}" type="currency" /> </h3></del>
		                    	<h3><fmt:formatNumber pattern="###,### VND" value="${pn.price - (pn.price*pn.sale)/100}" type="currency" /></h3>
		                    </c:if>
		                </div>
			                <!--   <div class="bt-ab">
			                    <a class="bt-mua" href="${pageContext.request.contextPath}/home/shopping-now.htm?id=${pn.id }&name=${pn.name }&coler=${pn.coler}&gia=${pn.price }&image=${pn.img1}">Mua ngay</a>
			                    <a href="${pageContext.request.contextPath}/home/shopping-list.htm?id=${pn.id }&name=${pn.name }&coler=${pn.coler}&gia=${pn.price }&image=${pn.img1}">Th??m</a>
			                </div> -->
		            	</div>
		            	</c:forEach>
		            </div>
				</c:otherwise>
			</c:choose>
				
	        </div>
        
        
    </div>

<footer>
        <div id="about" class="footer-cont">
            <img src="${pageContext.request.contextPath}/resources/img/logo/logo-footer.png" alt="">
            <ul>
                S???n ph???m
                <li><a href="${pageContext.request.contextPath}/list/vot-cau-long.htm">V???t c???u l??ng</a></li>
                <li><a href="${pageContext.request.contextPath}/list/giay-cau-long.htm">Gi??y c???u l??ng</a></li>
                <li><a href="${pageContext.request.contextPath}/list/ao-quan-cau-long.htm">??o qu???n c???u l??ng</a></li>
                <li><a href="${pageContext.request.contextPath}/list/phu-kien.htm">Ph??? ki???n c???u l??ng</a></li>
                <li><a href="${pageContext.request.contextPath}/list/sale.htm">Sale-off</a></li>
            </ul>
            <ul>
                Li??n h???
                <li><a href="">Email : tannd194@gmail.com</a></li>
                <li><a href="">Hotline : 0389211236</a></li>
            </ul>
            <ul>
                H??? Tr???
                <li><a href="">FAQs</a></li>
                <li><a href="">Ch??nh s??ch chung</a></li>
                <li><a href="">Tra c???u ????n h??ng</a></li>
            </ul>
        </div>
        <h1>Copyright &copy 2020 TanShop. All rights reserved.</h1>
    </footer>
</body>

<script>

	//Get the button
	var mybutton = document.getElementById("myBtn");
	
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};
	
	function scrollFunction() {
	  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	    mybutton.style.display = "block";
	  } else {
	    mybutton.style.display = "none";
	  }
	}
	
	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	  document.body.scrollTop = 0;
	  document.documentElement.scrollTop = 0;
	}
	
	
	
    // Get the modal
    var modalus = document.getElementById('user');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modalus) {
            modalus.style.display = "none";
        }
    }
    var modallg = document.getElementById('login');
    window.onclick = function(event) {
        if (event.target == modallg) {
            modallg.style.display = "none";
        }
		
    }
    var modalsu = document.getElementById('sign-up');
    window.onclick = function(event) {
        if (event.target == modalsu) {
            modalsu.style.display = "none";
        }
    }
    var modalsu = document.getElementById('cart1');
    window.onclick = function(event) {
        if (event.target == modalsu) {
            modalsu.style.display = "inline-block";
        }
    }
    
    function openNav() {
    	  document.getElementById("mySidebar").style.width = "250px";
    	  document.getElementById("main").style.marginLeft = "250px";
    	}

    	function closeNav() {
    	  document.getElementById("mySidebar").style.width = "0";
    	  document.getElementById("main").style.marginLeft= "0";
    	}
    	var modalNav = document.getElementById('mySidebar');
    	 // When the user clicks anywhere outside of the modal, close it
    	    window.onclick = function(event) {
    	        if (event.target == modalNav) {
    	        	closeNav();
    	        }
    	    }
    	
    	
   	function openCart() {
   	  document.getElementById("myCart").style.width = "800px";
   	  document.getElementById("btnCart").style.marginRight = "800px";
   	}

   	function closeCart() {
   	  document.getElementById("myCart").style.width = "0";
   	  document.getElementById("btnCart").style.marginRight = "0";
   	}
   	
   	var modal = document.getElementById('myCart');
 // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
        	closeCart();
        }
    }
    
    function sortList() {
    	  var list, i, switching, b, shouldSwitch;
    	  list = document.getElementById("listPro");
    	  switching = true;
    	  /* Make a loop that will continue until
    	  no switching has been done: */
    	  while (switching) {
    	    // start by saying: no switching is done:
    	    switching = false;
    	    b = list.getElementsByTagName("proName");
    	    // Loop through all list-items:
    	    for (i = 0; i < (b.length - 1); i++) {
    	      // start by saying there should be no switching:
    	      shouldSwitch = false;
    	      /* check if the next item should
    	      switch place with the current item: */
    	      if (b[i].innerHTML.toLowerCase() > b[i + 1].innerHTML.toLowerCase()) {
    	        /* if next item is alphabetically
    	        lower than current item, mark as a switch
    	        and break the loop: */
    	        shouldSwitch = true;
    	        break;
    	      }
    	    }
    	    if (shouldSwitch) {
    	      /* If a switch has been marked, make the switch
    	      and mark the switch as done: */
    	      b[i].parentNode.insertBefore(b[i + 1], b[i]);
    	      switching = true;
    	    }
    	  }
    	}
    	
</script>
</html>