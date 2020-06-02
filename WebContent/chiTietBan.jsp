<%@page import="com.NhaHang.bean.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="./admin/css/tiles.css">
<script type="text/javascript" src="./admin/js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="./admin/js/bootstrap.js"></script>

<link href="./admin./css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./admin/css/layout.css">
<link rel="stylesheet" type="text/css" href="./admin/css/nav.css">
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

<script src="./admin/js/html5.js"></script>
<script type="text/javascript">window.jQuery || document.write('<script type="text/javascript" src="./admin/js/jquery1102.js"><\/script>')</script> 
<script type="text/javascript" src="./admin/js/plugins.js"></script>

<script type="text/javascript">	
	//Vô hiệu hóa chuột phải
	/* document.addEventListener("contextmenu", function(e){
	    e.preventDefault();
	}, false); */
	
	function xacNhan(){
		return confirm("Bạn muốn đăng xuất?");
	}
	
	function timedRefresh(timeoutPeriod) {
		setTimeout("location.reload(true);",timeoutPeriod);
	}
	
	$(document).ready(function() {
		$('#thanhToan').click(function(){
			var check = $('#check').val();
			if(check == 0){
				alert('Bàn này vẫn chưa gọi món ăn nào, không thể tính tiền!');
				$("#refresh").click();
			}else{		
				$('#check').val("0");
				$('#hoaDon').click();
				
			}
		});
	});

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


<title>Chi tiết bàn</title>
</head>
<body class="full desktop">		
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
		   			<h2>Đ/C: LỘC TIẾN,PHÚ LỘC ,THỪA THIÊN HUẾ</h2>
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
    
	<div id="wrapper" style="padding-top: 84px;">
		<div id="centerWrapper" style="display: block;">
  		    <div id="tileContainer" class="" style="width: 100%; height: 500px; display: block; margin-top: 23px;">
            	<div id="divHeader" style="display: block;">
            	    <a class="groupTitle" style="margin-top: 0px; display: block; 
	       		       opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">CHI TIẾT BÁN HÀNG</h3>
	       		    </a>
            	</div>
            	
            	<div id="divLeft">	        		
	        		<a id="thanhToan" class="tile" style="padding: 10px 15px; margin-top: 0px; width: 100px;
	        		   background-color: rgb(73, 62, 197); text-align: center;">
						Thanh toán				
					</a>
					<a href="showQuanLyBanHangServlet" class="tile" style="padding: 10px 15px; background-color: rgb(62, 197, 197);
					   margin-top: 50px; width: 100px; text-align: center;">
						Trở về		
					</a>	
        		</div>
        		
        		<div id="divContent">        		
         <%
        	int index=0;
         	String tableNumber = (String)request.getAttribute("tableNumber");
         	ArrayList<Food> listFood = (ArrayList<Food>) request.getAttribute("listFood");
         	if(listFood != null){
         	%>
         		<table style="width: 10%; margin: 1.1% 1%; border: 1px solid white;">
				  		<tr style="color: white">
				      		<td style="text-align: center; background-color: rgb(44, 133, 216);">
					      	  <strong>Bàn <%=tableNumber%></strong>
					      </td>	
					  </tr>
				</table>
				
				<table class="table table-hover table-condensed" style="border: 0px;">
					        <thead style="background-color: rgb(44, 133, 216);">
					          <tr>
					          	<th style="text-align: center; color: white; width: 10%"><b>#</b></th>
					            <th style="text-align: center; color: white; width: 40%"><b>Tên món</b></th>
					            <th style="text-align: center; color: white; width: 20%"><b>Số lượng</b></th>
					            <th style="text-align: center; color: white; width: 30%"><b>Đơn giá</b></th>
					          </tr>
					        </thead>
					        <tbody>
         	<%
	        	long tongGia=0;
		      	for(Food s : listFood){
		      		index++;
		      		tongGia+=(long)s.getGia()*s.getSoluongchebien();
		      		String tam=Long.toString(((long)s.getGia()));
					String gia="";
					int d=tam.length()%3;
					for(int i=0;i<tam.length();i++){
						if((i+1)%3==d && i!=tam.length()-1) gia+=tam.charAt(i)+".";
						else gia+=tam.charAt(i);
					}
         	   %>						        		
						      <tr class="zzBody">
						      	 <td style="text-align: center; border-top: 2px solid #dddddd;"><%=index%></td>
							     <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getTenmon()%></td>		              
							     <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getSoluongchebien()%></td>
							     <td style="text-align: center; border-top: 2px solid #dddddd;"><%=gia%> VNĐ</td>							     
						      </tr>              
					    	
		 	  <%}//for
		 	   
		 	    String tam=Long.toString(tongGia);
			    String gia="";
			    int d=tam.length()%3;
			    for(int i=0;i<tam.length();i++){
					if((i+1)%3==d && i!=tam.length()-1) gia+=tam.charAt(i)+".";
					else gia+=tam.charAt(i);
			 	}
		 	  %>
		 	     		   </tbody>
						</table>
						
		 				<table style="width: 98%; margin: 0% 1%;">
				  			<tr style="color: white">
				         		<td width=65%></td>
				         		<td width=15% style="text-align: center; background-color: rgb(204, 61, 95);"><strong>TỔNG TIỀN</strong></td>	
				         		<td width="20%" style="text-align: center; background-color: rgb(204, 61, 95);"><strong><%=gia%> VNĐ</strong></td>
				 		    </tr>
						</table>
		  <%}//if 
		  
		  if(index!=0){%>
			  		<!-- Form chi tiết bán hàng -->
					<form method="post" target="_blank" action="showHoaDonServlet" style="display: none" onsubmit="return confirm('Bạn muốn tính tiền bàn này?');">
						<input type="submit" id="hoaDon" name="tableNumber" value="<%=tableNumber%>">
						<input type="hidden" id="check" value="1">
					</form>			  
		  <%}else{%>
		  			<input type="hidden" id="check" value="0">
		  <%}%>
		  
				    <!-- Refresh -->
					<form id="refreshForm" method="post" action="showChiTietBanServlet" style="display: none">
						<input type="submit" id="refresh" name="tableNumber" value="<%=tableNumber%>">
					</form>	
					
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
		
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>