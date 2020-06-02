<%@page import="com.NhaHang.bean.SuKien"%>
<%@page import="com.NhaHang.bean.Food"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<link href="./admin/css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./admin/css/nav.css">
<link rel="stylesheet" type="text/css" href="./admin/css/tiles.css">
<link rel="stylesheet" type="text/css" href="./admin/css/theme.css">
<link href="./admin/css/responsive.css" rel="stylesheet" type="text/css">
<script src="./admin/js/jquery.min.js"></script>
<script type="text/javascript">
	function regIsDigit(fData)
	{
		   var reg = new RegExp("^[0-9]*[0-9]?$");
		   return (reg.test(fData));
	}
	
	function xacNhan(){
		return confirm("Bạn muốn đăng xuất?\n\nLưu ý: \n   - Quý khách vui lòng không dùng chức năng này.\n   - Liên hệ với quản lý nhà hàng nếu lỡ đăng xuất.");
	}
	
	$(document).ready(function() {
		
		$('#btn0').click(function(){
			$('html,body').animate({ scrollTop: $('#div0').offset().top }, 'slow');			 
		}); 
		$('#btn1').click(function(){
			$('html,body').animate({ scrollTop: $('#div1').offset().top }, 'slow');			 
		}); 
		$('#btn2').click(function(){
			$('html,body').animate({ scrollTop: $('#div2').offset().top }, 'slow');			 
		}); 
		$('#btn3').click(function(){
			$('html,body').animate({ scrollTop: $('#div3').offset().top }, 'slow');			 
		}); 
		$('#btn4').click(function(){
			$('html,body').animate({ scrollTop: $('#div4').offset().top }, 'slow');			 
		}); 
		$('#btn5').click(function(){
			$('html,body').animate({ scrollTop: $('#div5').offset().top }, 'slow');			 
		}); 
		
		$(function(){
			$(window).scroll(function(){
				if($(this).scrollTop()!=0){
					$('#bttop').fadeIn();
				}else{
					$('#bttop').fadeOut();
				}
			});
			
			$('#bttop').click(function(){
				$('body,html').animate({scrollTop:0},800);});
		});
		
		//Xử lý sự kiện gọi món
		$('.sideBar').find('button').click(function() {
			var maMon = $(this).val();
			var soLuong = $('#'+maMon).val()*1;
			if(soLuong>=100){
				alert('Số lượng nhập vào không hợp lệ!\nSố lượng tối thiểu: 1\nSố lượng tối đa: 99');
			}else if( !regIsDigit($('#'+maMon).val()) || $('#'+maMon).val()==0){
					  alert('Số lượng nhập vào không hợp lệ!\nSố lượng tối thiểu: 1\nSố lượng tối đa: 99');
				  }else{
					  $.post("goiMonServlet",{
							tableNumber: $("#tableNumber").val(),
							maMon: maMon,
							soLuong: soLuong,
					  }, function(message){
							if(message=="no"){
								alert('Nhà hàng đã ngưng phục vụ món ăn này.\nMong quý khách thông cảm!');
								$("#refresh").click();
							}else if(message=="ok"){
								alert('Gọi món thành công!');
							}else if(message=="error"){
								alert('Có lỗi xảy ra, không thể gọi món lúc này!');
							}
					  });
				  }
		});
	});	
</script>

<style>
body {
	background:#f3f5f7;
		
}
html,body{
	background:#F8F8F8  repeat fixed !important; /* Main background color */}
.left-col{
	background : #0A99D1;
}

#bttop{
	border:1px solid #4adcff;
	background:#24bde2;
	text-align:center;
	padding:0.25%;
	position:fixed;
	bottom:35px;
	right:10px;
	cursor:pointer;
	display:none;
	color:#fff;
	font-size:11px;
	font-weight:900;
}

#bttop:hover{
	border:1px solid #ffa789;
	background:#ff6734;
}
</style>
<title>Gọi món</title>
</head>
<body>
	<%
		String security = (String) session.getAttribute("security");
		RequestDispatcher requestDispatcher;
		if (security != null){
			switch(Integer.parseInt(security)){
			case 1:
				requestDispatcher=request.getRequestDispatcher("homePageAdmin.jsp");
				requestDispatcher.forward(request, response);
				break;
			case 2: 
				requestDispatcher=request.getRequestDispatcher("showQuanLyBanHangServlet_quanly");
				requestDispatcher.forward(request, response);
				break;
			case 3:
				requestDispatcher=request.getRequestDispatcher("showQuanLyGoiMonServlet");
				requestDispatcher.forward(request, response);
			}
		}else{
			requestDispatcher=request.getRequestDispatcher("showDangNhapServlet");
			requestDispatcher.forward(request, response);
		}
	%>

	<header>
		<div id="headerWrapper">
			<div id="headerCenter">
				<div id="headerTitles">
					<%
					String tableNumberSession=(String)session.getAttribute("tableNumberSession");	
						session.setAttribute("tableNumberSession", tableNumberSession);
					%>
					<h1 style="margin-top: 0px; margin-bottom: 0px;"><a href="showGoiMonServlet">NHÀ HÀNG PHÚ GIA</a></h1>
		    		<a href="showDangNhapServlet" class="tile" style="right: 15px; height: 32px; width: 32px" onclick="return xacNhan();">
						<img src="./admin/img/logout.ico" title="Đăng xuất" style="background-color: #0A99D1; margin-bottom: 0px">					
					</a>
<!-- 					<a href="showChonBanGuestServlet" class="tile" style="right: 52px; height: 32px; width: 32px">
						<img src="img/chonBan.png" title="Chọn bàn" style="background-color: #0A99D1; margin-bottom: 0px">					
					</a> -->
		    	</div>
		    	<nav style="float: inherit;">
            		<a class="active" href="showGoiMonServlet">
						Thực đơn
					</a>
					<a class="" href="showMonDaGoiServlet">
						Món đã gọi
 					</a>					
				</nav>
			</div>			
    	</div>
    </header>

	<div id="eventBar">
		<%
			ArrayList<SuKien> listEvent = (ArrayList<SuKien>) request.getAttribute("listEvent");
		%>
		<marquee style="color: red; font-weight: 800">
		<% 
			for(SuKien s : listEvent){
				out.print(s.getNoidung()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			} 
		%>
		</marquee>
	</div>
	
	<div class="left-col">
		<input type="hidden" id="tableNumber" value="<%=tableNumberSession%>">
		<label style="margin-left: 5px; color: #FFF; background-color: rgb(243, 58, 58);
			   padding: 2px 10px; margin-right: 5px;">
			   Bàn <%=tableNumberSession%>
		</label>
		
		<input type="button" id="btn0" value="Khuyên dùng" style="margin-right: 0px">
	<%
		ArrayList<String> listTypeFood = (ArrayList<String>)request.getAttribute("listTypeFood");
		if(listTypeFood.size()!=0){	
			int idNumber=0;
			for(int i=0; i<listTypeFood.size();i++){
				%><input type="button" id="btn<%=++idNumber%>" value="<%=listTypeFood.get(i)%>"><%
			}
		}
	
	%>
	</div>
	
	<%  
	    ArrayList<Food> listFood = (ArrayList<Food>)request.getAttribute("listFood");
	    if(listFood.size()!=0){	
	    %>
	      <div id="div0" class="left-col">
		     <legend>Món ngon trong ngày (khuyên dùng)</legend>
	 	  </div>
	 	<%
	 	  int dem=0;
	 	  for(Food s : listFood){
	 		 if(s.getKhuyendung() == 1){
	 			dem++;
				String tam=Long.toString(((long)s.getGia()));
				String gia="";
				int d=tam.length()%3;
				for(int i=0;i<tam.length();i++){
					if((i+1)%3==d && i!=tam.length()-1) gia+=tam.charAt(i)+".";
					else gia+=tam.charAt(i);
				}
	 	%>
				<div class="sidebar" style="text-align: center;margin-bottom: 10px;padding: 0 10px 10px;background: #fff;">
					<div style="margin: .3125rem 0;">
						<div style="margin-bottom: 5%;">
							<img class="imgTB" src="./admin/upload/<%=s.getAnh()%>" height="100%" width="100%">
						</div>
						<div style="margin-top: 5%;">
							<label class="lbnTB" style="margin-left: 0px;"><%=s.getTenmon()%></label>
						</div>
						<div style="margin-top: 5%;">
							<label id="labelPrice" class="lbpTB" style="margin-left: 0px;">Giá: <%=gia%> VNĐ</label>
						</div>
						<div align="center" style="margin-top: 5%; margin-bottom: 2%;">
							<input id="s<%=s.getMamon()%>" type="number" min=1 max=99 placeholder="Số lượng" style="width: 43%">										
							<button class="btn btTB" id="btCall" value="s<%=s.getMamon()%>">Gọi</button>
						</div>
					</div>
				</div>
		<%	
	 		 }
	 	  }
	 	  
	 	  if(dem==0){
	 	  %>
	 		<h3 style="font-size: 13px; color: red;">Hiện tại chưa có món ăn nào trong danh mục này!</h3>	
	 	  <%
	 	  }
	 	
	      for(int i=0; i<listTypeFood.size();i++){
   	%>
	        <div id="div<%=i+1%>" class="left-col">
		    	<legend><%=listTypeFood.get(i)%></legend>
	 		</div>
		  <%
		  	  dem=0;
			  for(Food s : listFood){
			  	if(s.getTenloai().equals(listTypeFood.get(i))){
			  		dem++;
			  		String tam=Long.toString(((long)s.getGia()));
					String gia="";
					int d=tam.length()%3;
					for(int t=0;t<tam.length();t++){
						if((t+1)%3==d && t!=tam.length()-1) gia+=tam.charAt(t)+".";
						else gia+=tam.charAt(t);
					}
		  %>
					<div class="sidebar" style="text-align: center;margin-bottom: 10px;padding: 0 10px 10px;background: #fff;">
						<div>
							<div style="margin-bottom: 5%;">
								<img class="imgTB" src="./admin/upload/<%=s.getAnh()%>" height="100%" width="100%">
							</div>
							<div style="margin-top: 5%;">
								<label class="lbnTB" style="margin-left: 0px;"><%=s.getTenmon()%></label>
							</div>
							<div style="margin-top: 5%;">
								<label id="labelPrice" class="lbpTB" style="margin-left: 0px;">Giá: <%=gia%> VNĐ</label>
							</div>
							<div align="center" style="margin-top: 5%; margin-bottom: 2%;">
								<input id="<%=s.getMamon()%>" type="number" min=1 max=99 placeholder="Số lượng" style="width: 43%">										
								<button class="btn btTB" id="btCall" value="<%=s.getMamon()%>">Gọi</button>
							</div>
						</div>
					</div>
		<%	  	
				
				}//if
			  }//for Food
			  
			  if(dem==0){
			  %>
			 	  <h3 style="font-size: 13px; color: red;">Hiện tại chưa có món ăn nào trong danh mục này!</h3>	
			  <%
			  }
		  }//for TypeFood
		}// if(listFood.size()!=0)
	%>
	
	<form id="refreshForm" method="post" action="showGoiMonServlet" style="display: none">
		<input type="submit" id="refresh">
	</form>		
	
	<div class="clearfix"></div>	
	<div id='bttop' style="font-size: 1rem;">Về đầu trang</div>		
	<footer></footer>
</body>
</html>