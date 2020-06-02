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
	
	function changeKieuThongKe(){
		var kieuThongKe=$('#kieuThongKe').val();
		
		if(kieuThongKe == "theoThang"){
			$('#div1').removeClass("classHide");
			$('#div1').addClass("classShow");
			
			$('#div2').removeClass("classShow");
			$('#div2').addClass("classHide");
			
			$('#div3').removeClass("classShow");
			$('#div3').addClass("classHide");
		}else if(kieuThongKe == "theoNam"){
			$('#div2').removeClass("classHide");
			$('#div2').addClass("classShow");
			
			$('#div1').removeClass("classShow");
			$('#div1').addClass("classHide");
			
			$('#div3').removeClass("classShow");
			$('#div3').addClass("classHide");
		}else{
			$('#div3').removeClass("classHide");
			$('#div3').addClass("classShow");
			
			$('#div2').removeClass("classShow");
			$('#div2').addClass("classHide");
			
			$('#div1').removeClass("classShow");
			$('#div1').addClass("classHide");
		}
	}
	
	$(document).ready(function() {
		//----------------------------------------------
		//Để tránh trường hợp trở về nhưng kiểu thống kê không tương ứng
		var kieuThongKe=$('#kieuThongKe').val();
		if(kieuThongKe == "theoThang"){
			$('#div1').removeClass("classHide");
			$('#div1').addClass("classShow");
			
			$('#div2').removeClass("classShow");
			$('#div2').addClass("classHide");
			
			$('#div3').removeClass("classShow");
			$('#div3').addClass("classHide");
		}else if(kieuThongKe == "theoNam"){
			$('#div2').removeClass("classHide");
			$('#div2').addClass("classShow");
			
			$('#div1').removeClass("classShow");
			$('#div1').addClass("classHide");
			
			$('#div3').removeClass("classShow");
			$('#div3').addClass("classHide");
		}else{
			$('#div3').removeClass("classHide");
			$('#div3').addClass("classShow");
			
			$('#div2').removeClass("classShow");
			$('#div2').addClass("classHide");
			
			$('#div1').removeClass("classShow");
			$('#div1').addClass("classHide");
		}
		//----------------------------------------------
		
		$('#btnThongKeThang').click(function(){
			$('#namForm').val($('#nam').val());
			$("#submitThongKeThang").click();
		});
		
		$('#btnThongKeNam').click(function(){
			var namStart = $('#namBatDau').val();
			var namEnd = $('#namKetThuc').val();
			
			if(namStart > namEnd){
				alert('Khoảng thời gian bạn chọn không đúng!');
			}else{
				$('#namBatDauForm').val($('#namBatDau').val());
				$('#namKetThucForm').val($('#namKetThuc').val());
				$("#submitThongKeNam").click();
			}
		});

		$('#btnThongKeKTG').click(function(){
			var tuNgay = $('#tuNgay').val();
			var denNgay = $('#denNgay').val();
			
			var sDate = new Date(tuNgay);
			var eDate = new Date(denNgay);
			var now = new Date();
			
			if(tuNgay==""){
				alert("Bạn chưa chọn ngày băt đầu!");
				$("#tuNgay").focus();
			}else if (denNgay==""){
				alert("Bạn chưa chọn ngày kết thúc!");
				$("#denNgay").focus();
			}else if (sDate > eDate){
				alert("Khoảng thời gian không hợp lệ!");
			}else if (sDate.getFullYear() < 2000){
				alert("Ngày bắt đầu phải từ ngày 01/01/2000 trở đi!");
			}else if (eDate.getTime() > (now.getTime()+25200000)){
				alert("Ngày kết thúc không được vượt quá thời gian hiện tại!");
			}else{
				$('#tuNgayForm').val($('#tuNgay').val());
				$('#denNgayForm').val($('#denNgay').val());
				$('#submitThongKeKTG').click();
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
	
	<!-- Form thống kê tháng -->
	<form method="post" action="thongKeServlet" style="display: none">
		<input type="submit" id="submitThongKeThang" name="action" value="doanhThuThongKeThang">
		<input type=hidden id="namForm" name="nam" value="">
	</form>	
	
	<!-- Form thống kê năm -->
	<form method="post" action="thongKeServlet" style="display: none">
		<input type="submit" id="submitThongKeNam" name="action" value="doanhThuThongKeNam">
		<input type=hidden id="namBatDauForm" name="namBatDau" value="">
		<input type=hidden id="namKetThucForm" name="namKetThuc" value="">
	</form>	
	
	<!-- Form thống kê theo khoảng thời gian -->
	<form method="post" action="thongKeServlet" style="display: none">
		<input type="submit" id="submitThongKeKTG" name="action" value="doanhThuThongKeKTG">
		<input type=hidden id="tuNgayForm" name="tuNgay" value="">
		<input type=hidden id="denNgayForm" name="denNgay" value="">
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
		   			<h2>Đ/C: LỘC TIẾN PHÚ LỘC, THỪA THIÊN HUẾ</h2>
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
            	    <a class="groupTitle" href="showThongKeServlet" style="margin-top: 0px; display: block; opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">THỐNG KÊ DOANH THU BÁN HÀNG</h3>
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
        			<div  style="margin-top: 0px;">
	       				<div style="float: left; width: 33%; margin-bottom: 5px;">
		       				Thống kê theo
		       				<select id="kieuThongKe" style="margin-right: 20px;" onchange="changeKieuThongKe();">
		       					<option value="theoKhoangThoiGian">khoảng thời gian</option>  
		       					<option value="theoThang">tháng</option>
		       					<option value="theoNam">năm</option>    					
		       				</select>
	       				</div>
	       				<div id="div1" class="classShow" style="float: right; width: 67%; margin-bottom: 20px;">
		       				Thời gian
		       				<select id="nam">
		       				<%for(int y=year;y>=2000;y--){%>
		       					<option value="<%=y%>"><%=y%></option>    
		       				<%}%>    					
		       				</select>
		       				<input id="btnThongKeThang" type="button" value="Thống kê" style="padding: 4px 8px; margin-left: 10px;">
	       				</div>
	       				<div id="div2" class="classHide" style="float: right; width: 67%; margin-bottom: 20px;">
		       				Từ
		       				<select id="namBatDau">
		       				<%for(int y=2000;y<=year;y++){%>
		       					<option value="<%=y%>"><%=y%></option>    
		       				<%}%>    					
		       				</select>
		       				đến 
		       				<select id="namKetThuc">
		       				<%for(int y=year;y>=2000;y--){%>
		       					<option value="<%=y%>"><%=y%></option>    
		       				<%}%>    					
		       				</select>
		       				<input id="btnThongKeNam" type="button" value="Thống kê" style="padding: 4px 8px; margin-left: 10px;">
	       				</div>
	       				<div id="div3" class="classHide" style="float: right; width: 67%; margin-bottom: 20px;">
		       				Từ <input id="tuNgay" name="tuNgay" type="date">       				
	       					đến <input id="denNgay" name="denNgay" type="date">
	       					<input id="btnThongKeKTG" type="button" value="Thống kê" style="padding: 4px 8px; margin-left: 10px;">
	       				</div>		
       				</div>
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
       
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>