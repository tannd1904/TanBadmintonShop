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
	
	    <div class="container-detail">
        <div class="img-pro">
        <c:forEach var="a" items="${item}">
            <div class=" owl-carousel owl-theme ">
					 <div class="item-img">
                    <img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img1}" alt="">
                </div>
                <div class="item-img">
                    <img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img2}" alt="">
                </div>
                <div class="item-img">
                    <img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img3}" alt="">
                </div>
            </div>
            <div class="sub-img">
            	<img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img1}" alt="">
            	<img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img2}" alt="">
            	<img src=" ${pageContext.request.contextPath}/resources/img/pro/${a.img3}" alt="">
            </div>
        </c:forEach>
        </div>
        <div class="del-pro">
            <c:forEach var="pr" items="${item}">
            	<h1>${pr.name}</h1>
            	<h3>M??u : ${pr.coler}</h3>
	            <h3>M?? SP : ${pr.id}</h3>
				<div style="margin-top: 5px" class="price">
					<c:if test="${pr.sale==0}">
						<h2>Gi?? :
							<fmt:formatNumber pattern="###,### VND" value="${pr.price}"
								type="currency" />
						</h2>
					</c:if>
					<c:if test="${pr.sale!=0}">
						<div style="display: flex;">
						<del>
							<h2 style="margin-right: 10px">
								<fmt:formatNumber pattern="###,### VND" value="${pr.price}"
									type="currency" />
							</h2>
						</del>
						<h2>
							<fmt:formatNumber pattern="###,### VND"
								value="${pr.price - (pr.price*pr.sale)/100}" type="currency" />
						</h2>
						</div>
					</c:if>
				</div>
				<c:if test="${pr.status==1 }">
					<h3>T??nh tr???ng: C??n h??ng</h3>
				</c:if>
				<c:if test="${pr.status!=1 }">
					<h3>T??nh tr???ng: H???t h??ng</h3>
				</c:if>
				<p class="content-del">${pr.content}</p>
				
				<c:if test="${pr.status==1 }">
					<div class="btn">
						<a href="${pageContext.request.contextPath}/home/shopping-now.htm?id=${pr.id }&name=${pr.name }&coler=${pr.coler}&gia=${pr.price }&image=${pr.img1}">Mua ngay</a>
					    <br>
					    <a href="${pageContext.request.contextPath}/home/shopping.htm?id=${pr.id }&name=${pr.name }&coler=${pr.coler}&gia=${pr.price }&image=${pr.img1}">Th??m</a>
					</div>
				</c:if>
				<!-- <c:if test="${pr.status!=1 }">
					<div class="btn">
						<button disabled="disabled">Mua ngay</button>
						<button disabled="disabled">Th??m</button>
					</div>
				</c:if> -->
				
				
            
            <c:choose>
            	<c:when test="${type == 3 }">
            		<div class="tab-size">
		                <img src=" ${pageContext.request.contextPath}/resources/img/banner/size-quan-ao.jpg" alt="">
		            </div>
            	</c:when>
            	<c:when test="${type == 2 }">
            		<div class="tab-size">
		                <img src=" ${pageContext.request.contextPath}/resources/img/banner/size.jpg" alt="">
		            </div>
            	</c:when>
            </c:choose>
            
            </c:forEach>
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
    
    	
</script>
</html>