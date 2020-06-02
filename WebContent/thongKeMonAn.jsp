<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="./admin/css/tiles.css">
<script type="text/javascript" src="./admin/js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="./admin/js/bootstrap.js"></script>
<!-- JS TABLE PAGING -->
<script src="./admin/js/pagingMenu.js" type="text/javascript"></script>

<link href="./admin/css/css.css" rel="stylesheet" type="text/css">
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
	function xacNhan(){
		return confirm("Bạn muốn đăng xuất?");
	}
	
	$(document).ready(function() {		
		$('#btnThongKeMonAn').click(function(){
			var tuNgay = $('#startDay').val();
			var denNgay = $('#endDay').val();
			
			var sDate = new Date(tuNgay);
			var eDate = new Date(denNgay);
			var now = new Date();
			
			if(tuNgay==""){
				alert("Bạn chưa chọn ngày băt đầu!");
			}else if (denNgay==""){
				alert("Bạn chưa chọn ngày kết thúc!");
			}else if (sDate > eDate){
				alert("Khoảng thời gian không hợp lệ!");
			}else if (sDate.getFullYear() < 2000){
				alert("Ngày bắt đầu phải từ ngày 01/01/2000 trở đi!");
			}else if (eDate.getTime() > (now.getTime()+25200000)){
				alert("Ngày kết thúc không được vượt quá thời gian hiện tại!");
			}else{
				$('#topForm').val($('#top').val());
				$('#sapXepForm').val($('#sapXep').val());
				$('#startDayForm').val($('#startDay').val());
				$('#endDayForm').val($('#endDay').val());
				$('#typeForm').val($('#type').val());
				$("#submitThongKeMonAn").click();
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
html,body{
	background:#F8F8F8  repeat fixed !important; /* Main background color */}
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

.modal.fade.in {
	top: 12%;
}

.classShow{
	display: block;
}

.classHide{
	display: none;
}
</style> 


<title>Thống kê kinh doanh</title>
</head>
<script src="./admin/js/highcharts.js"></script>
<script src="./admin/js/exporting.js"></script>
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
	
	<!-- Form thống kê món ăn -->
	<form method="post" action="thongKeServlet" style="display: none">
		<input type="submit" id="submitThongKeMonAn" name="action" value="thongKeMonAn">
		<input type=hidden id="topForm" name="top" value="">
		<input type=hidden id="sapXepForm" name="sapXep" value="">
		<input type=hidden id="startDayForm" name="startDay" value="">
		<input type=hidden id="endDayForm" name="endDay" value="">
		<input type=hidden id="typeForm" name="type" value="">
	</form>	
	
	<!-- Refresh -->
	<form id="refreshForm" method="post" action="showThongKeServlet" style="display: none">
		<input type="submit" id="refresh">
	</form>	
	
	<header style="top: 0px;">
		<div id="headerWrapper">
			<div id="headerCenter">
				<div id="headerTitles">
					<h1><a href="homePageAdmin.jsp">NHÀ HÀNG PHÚ GIA</a></h1>
		   			<h2>Đ/C: LỘC TIẾN,PHÚ LỘC,THỪA THIÊN HUẾ</h2>
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
            	    <a class="groupTitle" href="showThongKeServlet?action=thongKeMonAn" style="margin-top: 0px; display: block; opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">THỐNG KÊ MÓN ĂN</h3>
	       		    </a>
            	</div>
            	
            	<div id="divLeft">        		
	        		<a id="thongKeBanHang" href="showThongKeServlet" class="tile" style="padding: 10px 15px; background-color: rgb(73, 62, 197);
	        		   margin-top: 0px; width: 100px; text-align: center;">
						Bán hàng		
					</a>
					<a id="thongKeDoanhThu" href="showThongKeServlet?action=thongKeMonAn" class="tile" style="padding: 10px 15px; background-color: rgb(14, 196, 101);
	        		   margin-top: 50px; width: 100px; text-align: center;">
						Món ăn		
					</a>	
        		</div>
        		
        		<div id="divContent">     
        			<%
	        			DateFormat dateFormat = new SimpleDateFormat("yyyy");
	        			Date date = new Date();	
	        			int year=Integer.parseInt(dateFormat.format(date));
        			%>	
	       			<div style="float: left; text-align: center; width: 100%; margin-bottom: 15px;">
		       			Thống kê
		       			<select id="top">
		       				<option value="0">tất cả</option>
							<option value="5">top 5</option>
							<option value="10">top 10</option>
							<option value="15">top 15</option>
							<option value="20">top 20</option>
							<option value="30">top 30</option>
							<option value="50">top 50</option>
						</select>
						<select id="type">
		       				<option value="1">món ăn</option>
		       				<option value="2">thức uống</option>
						</select>
						bán được
						<select id="sapXep">
							<option value="1">nhiều nhất</option>
							<option value="0">ít nhất</option>
						</select> 
							
						từ
						<input id="startDay" type="date" name="startDay" required style="width: 141px;">
						đến
						<input id="endDay" type="date" name="endDay" required style="width: 141px;">
	       			</div>
	       			<div style="float: left; text-align: center; width: 100%; margin-bottom: 20px;">
	       				<input id="btnThongKeMonAn" type="button" value="Thống kê" style="padding: 5px 10px; margin-right: 20px;">
	       			</div>
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
       
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>