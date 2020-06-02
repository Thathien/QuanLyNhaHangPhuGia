<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./admin/css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./admin/css/layout.css">
<link rel="stylesheet" type="text/css" href="./admin/css/nav.css">
<link rel="stylesheet" type="text/css" href="./admin/css/tiles.css">
<link rel="stylesheet" type="text/css" href="./admin/css/theme.css">
<link rel="stylesheet" type="text/css" href="./admin/css/plugin.css">
<link rel="stylesheet" type="text/css" href="./admin/css/plugin(1).css">
<link rel="stylesheet" type="text/css" href="./admin/css/plugin(2).css">
<link rel="stylesheet" type="text/css" href="./admin/css/plugin(3).css">
<link rel="stylesheet" type="text/css" href="./admin/css/plugin(4).css">
<link rel="stylesheet" type="text/css" href="./admin/css/plugin(5).css">
<link rel="stylesheet" type="text/css" href="./admin/css/plugin(6).css">
<link rel="stylesheet" type="text/css" href="./admin/css/plugin(7).css">
<link rel="stylesheet" type="text/css" href="./admin/css/plugin(8).css">

<script src="./admin/js/jquery.min.js"></script>
<script src="./admin/js/html5.js"></script>
<script src="./admin/js/jquery.min.203.js"></script>
<script type="text/javascript">window.jQuery || document.write('<script type="text/javascript" src="./admin/js/jquery1102.js"><\/script>')</script> 
<script type="text/javascript" src="./admin/js/plugins.js"></script>

<script>
	scale = 145;
	spacing = 10;
	theme = 'theme_modernlight';
	$group.titles = ["Quản lý"];
	$group.spacingFull = [4,4,3];
	$group.inactive.opacity = "1";
	$group.inactive.clickable = "1";
	$group.showEffect = 0;
	$group.direction = "horizontal";

	mouseScroll = "1";

	siteTitle = 'Phú Gia';
	siteTitleHome = 'Quản lý';
	showSpeed = 400;
	hideSpeed = 300;
	scrollSpeed = 550;

	device = "desktop";
	scrollHeader = "1";
	disableGroupScrollingWhenVerticalScroll = "";

	/*For background image*/
	bgMaxScroll= "130";
	bgScrollSpeed = "450";

	/*For responsive */
	autoRearrangeTiles = "1";
	autoResizeTiles = "1";
	rearrangeTreshhold = 2;

	/*Locale */
	lang = "en";
	l_pageNotFound = "Lỗi không tìm thấy trang";
	l_pageNotFoundDesc = "<h2 class='margin-t-0'>Lỗi</h2>Không tìm thấy trang.";
	l_menu = "Menu";
	l_goToFullSiteRedirect = "Đang chuyển hướng đến trang chủ...";
	panelDim = '0.6';
	hidePanelOnClick = '1';
	panelGroupScrolling = '';
	pageTitles=new Array();
	pageTitles['welcome.php'] = 'Welcome to this Site';
	pageTitles['typography.php'] = 'Typography of the Metro Template';
	pageTitles['accordions.php'] = 'Accordions example page';
	pageTitles['sidebars.php'] = 'Sidebars';
	pageURL=new Array();pageURL['welcome.php'] = 'welcome';
	pageURL['typography.php'] = 'typography';
	pageURL['accordions.php'] = 'accordions';
	pageURL['sidebars.php'] = 'sidebars';
	
	function xacNhan(){
		return confirm("Bạn muốn đăng xuất?");
	}
</script>
<script type="text/javascript" src="./admin/js/plugins.js"></script>
<script type="text/javascript" src="./admin/js/plugin(9).js"></script>
<script type="text/javascript" src="./admin/js/desktop.js"></script>
<script type="text/javascript" src="./admin/js/plugin(10).js"></script>
<script type="text/javascript" src="./admin/js/plugin(11).js"></script>
<script type="text/javascript" src="./admin/js/plugin(12).js"></script>
<script type="text/javascript" src="./admin/js/plugin(13).js"></script>
<script type="text/javascript" src="./admin/js/plugin(14).js"></script>
<script type="text/javascript" src="./admin/js/plugin(15).js"></script>
<script type="text/javascript" src="./admin/js/functions.js"></script>
<script type="text/javascript" src="./admin/js/main.js"></script>    

<style>

.tile{
	-webkit-transition-property: box-shadow, margin-left,  margin-top;
	-webkit-transition-duration: 0.25s, 0.5s, 0.5s;
	-moztransition-property: box-shadow, margin-left,  margin-top;
	-moz-transition-duration: 0.25s, 0.5s, 0.5s;
	-o-transition-property: box-shadow, margin-left,  margin-top;
	-o-transition-duration: 0.25s, 0.5s, 0.5s;
	-ms-transition-property: box-shadow, margin-left,  margin-top;
	-ms-transition-duration: 0.25s, 0.5s, 0.5s;
	transition-property: box-shadow, margin-left,  margin-top;
	transition-duration: 0.25s, 0.5s, 0.5s;
}
	html,body{
	background:#F8F8F8  repeat fixed !important; /* Main background color */}
</style> 


<title>NHÀ HÀNG PHÚ GIA</title>
</head>
<body class="full desktop">
<!-- style="background-image: url(img/bg.png); background-attachment:fixed; background-repeat:repeat;" -->
	<%
		String security = (String) session.getAttribute("security");
		RequestDispatcher requestDispatcher;
		if (security != null){
			switch(Integer.parseInt(security)){
			case 2: 
				requestDispatcher=request.getRequestDispatcher("showQuanLyBanHangServlet_quanly");
				requestDispatcher.forward(request, response);
				break;
			case 3:
				requestDispatcher=request.getRequestDispatcher("showQuanLyGoiMonServlet");
				requestDispatcher.forward(request, response);
				break;
			case 4:
				requestDispatcher=request.getRequestDispatcher("showGoiMonServlet");
				requestDispatcher.forward(request, response);
			}
		}else{
			requestDispatcher=request.getRequestDispatcher("showDangNhapServlet");
			requestDispatcher.forward(request, response);
		}
	%>
	
	<header style="top: 0px;">
		<div id="headerWrapper">
			<div id="headerCenter">
				<div id="headerTitles">
					<h1><a href="homePageAdmin.jsp">NHÀ HÀNG PHÚ GIA</a></h1>
		   			<h2>Đ/C: LỘC TIẾN ,PHÚ LỘC, THỪA THIÊN HUẾ</h2>
		    	</div>
		    	<nav>
            		<a href="homePageAdmin.jsp" rel="group0" class="navActive">
						<img src="./admin/img/manager.ico" alt="Quản lý">
						Quản lý
					</a>					
				</nav>
			</div>
			<a href="showDangNhapServlet" class="tile" style="margin-top: 2px; right: 1px;" onclick="return xacNhan();">
				<img src="./admin/img/logout.ico" height="50" width="50" title="Đăng xuất" style="background-color: #0A99D1;">					
			</a>			
    	</div>
    </header>
    <!-- width: 2390.5px; -->
	<div id="wrapper" style="padding-top: 84px;">
		<div id="centerWrapper" style="display: block;">
  		    <div id="tileContainer" class="" style=" height: 500px; display: block;">
            		 
       		    <a href="homePageAdmin.jsp#&QuanLy" id="groupTitle0" class="groupTitle" style="margin-left: 0px; margin-top: 0px; display: block; 
       		       opacity: 1;" onclick="javascript:$group.goTo(0);">
       		       <h3>Quản lý</h3>
       		    </a>
        		
        		<!-- ----------------------------------------------------------------------------------------------------------- -->
        		<!-- Group 1 -->
    			
    			<a href="showQuanLyBanHangServlet" class="tile tileFlip support3D group0" 
      					  style="margin-top: 45px; margin-left: 0px; width: 300px; height: 145px; display: block; opacity: 1;" data-pos="200-930-145"> 
    				<div class="flipContainer">
						<div class="flipFront" style="background:rgb(4, 174, 218);">
       						<div class="flipImgWrapper">
        						<div class="flipImgCenterer">
        							<img src="./admin/img/banHang.png">
       							</div>
        					</div>
       					</div>
						<div class="flipBack" style="background:rgb(4, 174, 218);">
						   	<h4 style="color:#FFF; margin-top: 45px;">Quản lý bán hàng</h4>
						</div>
        			</div>
    			</a>
    			
    			<a href="showQuanLyThucDonServlet?sapXep=1" class="tile tileFlip support3D group0" 
      					  style="margin-top: 45px; margin-left: 310px; width: 300px; height: 145px; display: block; opacity: 1;" data-pos="200-930-145"> 
    				<div class="flipContainer">
						<div class="flipFront" style="background:rgb(255, 127, 39);">
       						<div class="flipImgWrapper">
        						<div class="flipImgCenterer">
        							<img src="./admin/img/thucDon.png">
       							</div>
        					</div>
       					</div>
						<div class="flipBack" style="background:rgb(255, 127, 39);">
						   	<h4 style="color:#FFF; margin-top: 45px;">Quản lý thực đơn</h4>
						</div>
        			</div>
    			</a>
    				
    			<a href="showQuanLyNhanVienServlet?sapXep=9" class="tile tileFlip support3D group0" 
      					  style="margin-top: 45px; margin-left: 620px; width: 300px; height: 145px; display: block; opacity: 1;" data-pos="200-930-145"> 
    				<div class="flipContainer">
						<div class="flipFront" style="background:rgb(34, 177, 76);">
       						<div class="flipImgWrapper">
        						<div class="flipImgCenterer">
        							<img src="./admin/img/nhanVien.png">
       							</div>
        					</div>
       					</div>
						<div class="flipBack" style="background:rgb(34, 177, 76);">
						   	<h4 style="color:#FFF; margin-top: 45px;">Quản lý nhân viên</h4>
						</div>
        			</div>
    			</a>
      			
      			<a href="showQuanLySuKienServlet" class="tile tileFlip support3D group0" 
      					  style="margin-top: 200px; margin-left: 0px; width: 300px; height: 145px; display: block; opacity: 1;" data-pos="200-930-145"> 
    				<div class="flipContainer">
						<div class="flipFront" style="background:rgb(206, 0, 103);">
       						<div class="flipImgWrapper">
        						<div class="flipImgCenterer">
        							<img src="./admin/img/suKien.png">
       							</div>
        					</div>
       					</div>
						<div class="flipBack" style="background:rgb(206, 0, 103);">
						   	<h4 style="color:#FFF; margin-top: 45px;">Quản lý sự kiện</h4>
						</div>
        			</div>
    			</a>	
      			
      			<a href="showQuanLyNhapHangServlet" class="tile tileFlip support3D group0" 
      					  style="margin-top: 200px; margin-left: 310px; width: 300px; height: 145px; display: block; opacity: 1;" data-pos="200-930-145"> 
    				<div class="flipContainer">
						<div class="flipFront" style="background:rgb(4, 174, 218);">
       						<div class="flipImgWrapper">
        						<div class="flipImgCenterer">
        							<img src="./admin/img/nhapHang.png">
       							</div>
        					</div>
       					</div>
						<div class="flipBack" style="background:rgb(4, 174, 218);">
						   	<h4 style="color:#FFF; margin-top: 45px;">Quản lý nhập hàng</h4>
						</div>
        			</div>
    			</a>
    			
    			<a href="showThietLapTaiKhoanServlet" class="tile tileFlip support3D group0" 
      					  style="margin-top: 200px; margin-left: 620px; width: 300px; height: 145px; display: block; opacity: 1;" data-pos="200-930-145"> 
    				<div class="flipContainer">
						<div class="flipFront" style="background:rgb(182, 182, 26);">
       						<div class="flipImgWrapper">
        						<div class="flipImgCenterer">
        							<img src="./admin/img/thietLap.png">
       							</div>
        					</div>
       					</div>
						<div class="flipBack" style="background:rgb(182, 182, 26);">
						   	<h4 style="color:#FFF; margin-top: 45px;">Thiết lập tài khoản</h4>
						</div>
        			</div>
    			</a>
    			
    			<a href="showThongKeServlet" class="tile tileFlip support3D group0" 
      					  style="margin-top: 355px; margin-left: 310px; width: 300px; height: 145px; display: block; opacity: 1;" data-pos="200-930-145"> 
    				<div class="flipContainer">
						<div class="flipFront" style="background:rgb(69, 104, 152);">
       						<div class="flipImgWrapper">
        						<div class="flipImgCenterer">
        							<img src="./admin/img/thongKe.png">
       							</div>
        					</div>
       					</div>
						<div class="flipBack" style="background:rgb(69, 104, 152);">
						   	<h4 style="color:#FFF; margin-top: 45px;">Thống kê kinh doanh</h4>
						</div>
        			</div>
    			</a>
    			
    			<a href="showQuanLyGopYServlet" class="tile tileFlip support3D group0" 
      			   style="margin-top: 355px; margin-left: 0px; width: 300px; height: 145px; display: block; opacity: 1;" data-pos="200-930-145"> 
    				<div class="flipContainer">
						<div class="flipFront" style="background:rgb(255, 127, 39);">
       						<div class="flipImgWrapper">
        						<div class="flipImgCenterer">
        							<img src="./admin/img/gopY.png" height="40%" width="80%">
       							</div>
        					</div>
       					</div>
						<div class="flipBack" style="background:rgb(255, 127, 39);">
						   	<h4 style="color:#FFF; margin-top: 45px;">Quản lý góp ý</h4>
						</div>
        			</div>
    			</a>
    			
    		<!--  	<a target="_blank" href="" id="tileSlideshow0-0-1" class="tile tileSlideshow group0" 
    			   style="margin-top: 355px; margin-left: 620px; width: 300px; height: 145px; background-color: rgb(235, 172, 39); display: block; opacity: 1; background-position: initial initial; 
      			   background-repeat: initial initial;" data-pos="200-0-145" data-n="0">     
    			   <img src="img/fanPageRes.png" style="display: inline-block; height: 147px; width: 300px; margin-top: 0px; opacity: 1;">
    			  <div class="tileLabelWrapper bottom">
    			   		<div class="tileLabel bottom" style="border-bottom-color:#C23737;">
    			   			Fanpage
    			   		</div>
    			   </div> 
    			</a>
    			-->
      			<!-- 
      			<a href="" class="tile group0 " 
      			   style="margin-top: 45px; margin-left: 310px; width: 145px; height: 145px; background-color: rgb(255, 153, 0); display: block; 
      			   opacity: 1; background-position: initial initial; background-repeat: initial initial;" data-pos="45-310-145"> 
    			   <div class="tileTitle" style="text-align: center; margin-left: 3px;">
				 		Sự kiện
				 		<img src="img/event2.ico" alt="Gọi món" height="60%" width="60%">
				   </div>        
				</a>
				 -->
				
				<!--  
      			<a href="" class="tile tileSlideFx group1 lightbox" 
      			   style="margin-top: 45px; margin-left: 620px; width: 300px; height: 145px; background-color: rgb(51, 51, 51); display: block; 
      			   opacity: 1; background-position: initial initial; background-repeat: initial initial;" data-pos="45-620-300">       
    			   <div class="slideText" style="">
   	 					Click to see in full    
   	 			   </div>   
   				   <div class="slice s1" style="width: 75px; background-image: url(http://metro-webdesign.info/demo/modernlight/img/metro_slide_300x150.png);">
   				   		<span class="overlay" style="width:75px;"></span>					
   				   		<div class="slice s2" style="width: 75px; background-image: url(http://metro-webdesign.info/demo/modernlight/img/metro_slide_300x150.png); 
   				   			 background-position: -75px 0px;">
   				   			 <span class="overlay" style="width:75px;"></span>					
   				   			 <div class="slice s3" style="width: 75px; background-image: url(http://metro-webdesign.info/demo/modernlight/img/metro_slide_300x150.png); 
   				   			 	  background-position: -150px 0px;">
   				   			 	  <span class="overlay" style="width:75px;"></span>					
   				   			 	  <div class="slice s4" style="width: 75px; background-image: url(http://metro-webdesign.info/demo/modernlight/img/metro_slide_300x150.png); 
   				   			 	  	   background-position: -225px 0px;">
   				   			 	  	   <span class="overlay" style="width:75px;"></span>					
   				   			 	  </div>
   				   			 </div>
   				   		</div>
   				   	</div>
   				</a>
   				-->
   				<!-- 
      			<a href="http://metro-webdesign.info/demo/modernlight/#!/sidebars" class="tile tileSlide up group1 " 
      			   style="margin-top: 200px; margin-left: 620px; width: 300px; height: 145px; background-color: rgb(255, 153, 0); 
      			   padding: 0px; display: block; opacity: 1; background-position: initial initial; background-repeat: initial initial;" 
      			   data-pos="200-620-300" data-doslide="1">     
    			   <div class="slideText" style="height: 58px; width: 100%; top: 145px;">
    				  <h3 class="white">A page with sidebar</h3>    
    			   </div>
    			   <div class="imageWrapper" style="margin-top: 0px; margin-left: 0px;">
    				  <div class="imageCenterer" style="width:300px; height:145px;line-height:143px;">
						 <img src="./MetroUI_3_files/metro_slide_300x150_2.png" alt="" title="" style="width:300px;"> 
        			  </div>
					  <div class="tileLabelWrapper top" style="border-top-color:#444;">
						 <div class="tileLabel top">
							 A slide tile
						 </div>
					  </div>
				   </div>    
    			</a>
    			 -->		
    			 
    			<!--  
      			<a href="http://metro-webdesign.info/demo/modernlight/#!/accordions" class="tile tileFlip support3D group1" 
      			   style="margin-top: 200px; margin-left: 930px; width: 145px; height: 145px; display: block; opacity: 1;" data-pos="200-930-145"> 
    			   <div class="flipContainer">
				   		<div class="flipFront" style="background:#0A99D1;">
       						<div class="flipImgWrapper">
       							<div class="flipImgCenterer">
       								<img src="./MetroUI_3_files/metro_150x150.png" alt="" title="" style="width:147px;">
       							</div>
       						</div>
       					</div>
				   		<div class="flipBack" style="background:#0A99D1;">
				   			<h4 style="color:#FFF;">Click for accordions!</h4>
				   		</div>
       				</div>
    			</a>
    			-->
    			
    			<!-- ------------------------------------------------------------------------------------------------- -->	
    			<!-- Group 3 -->
    			
    			<!--  
    			<a class="tile tileImg group2  noClick" style="margin-top: 45px; margin-left: 1240px; width: 145px; height: 145px;
      			   background-color: rgb(15, 109, 50); display: block; opacity: 1; background-position: initial initial; 
      			   background-repeat: initial initial;" data-pos="45-1240-145"> 
   				   <img title="" alt="" src="./MetroUI_3_files/img3.jpg" width="145" style="margin-left:-72.5px; margin-top: -72.5px; max-height:145px;">
    			   <div class="tileLabelWrapper bottom">
    			   		<div class="tileLabel bottom" style="border-bottom-color:#4AA842;">
    			   			Img Tile
    			   		</div>
    			   		<div class="imgDesc">
    			   			By adding the CSS class 'noClick' to this tile, we've achieved that there is no hover effect!
    			   		</div>    
    			   </div>
   				</a>
   				-->	
   				
   				<!--
      			<a class="tile tileSlide left group2 noClick" style="margin-top: 45px; margin-left: 1395px; width: 300px; height: 145px; 
      			   background-color: rgb(74, 168, 66); padding: 0px; display: block; opacity: 1; background-position: initial initial;
      			   background-repeat: initial initial;" data-pos="45-1395-300" data-doslide="">    
    			   <div class="slideText" style="width:150px; height:100%;right:0;">
    					<h3 class="white">No click</h3>    
    			   </div>
   		 		   <div class="imageWrapper">
    	  				<div class="imageCenterer" style="width:300px; height:145px;line-height:143px;">
	  					   <img src="./MetroUI_3_files/metro_slide_300x150_2.png" alt="" title="" style="width:300px;"> 
       					</div>
				   </div>
	 			   <div class="tileLabelWrapper top" style="border-top-color:#444;">
				  	    <div class="tileLabel top">
						  	 Other direction slide
						</div>
				   </div>
    			</a>
    			-->

    			<!--
    			<a class="tile group2 noClick" style="margin-top: 45px; margin-left: 1240px; width: 450px; height: 385px; 
    			   background-color: rgb(15, 109, 50);">
    			   Google map
    			</a>
    			-->
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
		
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>