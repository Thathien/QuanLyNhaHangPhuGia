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
<!-- JS TABLE PAGING -->
<script src="./admin/js/pagingMenu.js" type="text/javascript"></script>

<link href="./admin/./css/css.css" rel="stylesheet" type="text/css">
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
	function xacNhanXoa(){
		return confirm("Bạn muốn xóa");
	}
	function isNumeric(v) {
		if(parseInt(v)==0) return false;
		return v.length > 0 && v.length < 9 && !isNaN(v) && v.search(/[A-Z]|[#]|[-]/ig) == -1;
	};
	
	function isValidString(v){
		var kt=0;
		for(var i=0;i<v.length;i++){
			if (v[i]!=" ") kt=1;
		}
		return (v.search(/[<]|[>]|[#]|[-]/ig) == -1) && (v.length>0) && (kt==1);
	};
	
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#imgPreview')
	                .attr('src', e.target.result)
	                .width(150)
	                .height(100);
	        };

	        reader.readAsDataURL(input.files[0]);
	    }
	};
	
	function readURL2(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#imgPreview2')
	                .attr('src', e.target.result)
	                .width(150)
	                .height(100);
	        };

	        reader.readAsDataURL(input.files[0]);
	    }
	};
	
	$(document).ready(function() {		
		$("#updateFoodModal").modal("show");	
		
		$("#checkAll").click(function () {
			if(this.checked){
				$(":checkbox").prop('checked', true);
			}else{
				$(":checkbox").prop('checked', false);
			}
		});	
		
		$("#addFood").click(function () {
			$("#addFoodModal").modal("show");		  		
		});
		
		$("#updateFood").click(function () {
		  	if($(":checkbox:checked").length == 1){
		  		$('#mamon').val($(":checkbox:checked").eq(0).val());		  		
		  		$("#update").click();
		  	}else{
		  		alert("Hãy chọn 1 món ăn trước khi click cập nhật!");
		  	}		  		
		});
		
		$("#deleteFood").click(function () {
				var listFood = "";
		  		
		  		for(var i=0; i<$(":checkbox:checked").length;i++){
		  			listFood+=$(":checkbox:checked").eq(i).val()+",";
		  		}
		  		
			  	if($(":checkbox:checked").length != 0){		
			  		var x = confirm("Bạn muốn xóa?");
			  		if(x){
			  			$.post("quanLyThucDonDeleteServlet",{
				  			listFood: listFood,
					    }, function(message){
							if(message!="ok"){
								alert('Có lỗi xảy ra, không thể xóa!');
							}else{
								alert('Xóa thành công!');
								$("#refresh").click();
							}
		  			    });
			  		}else{
						return false;
					}
			  		
			  	}else{
			  		alert("Hãy chọn ít nhất 1 món ăn trước khi click xóa món ăn!");
			  	}		  		
			
		});
		
		$('#add').click(function(){
			var tenMon = $('#tenMon').val();
			var donGia = $('#donGia').val();
			if(!isValidString(tenMon)){
				alert('Tên món trống hoặc không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)');
				$("#tenMon").focus();
			}else if($('#loai').val() == 0){
				alert('Bạn chưa chọn loại món ăn!');
				$("#loai").focus();
			}else if(!isNumeric(donGia) || donGia == null){
				alert('Giá nhập vào không đúng!\nTối đa 8 ký tự và chỉ cho phép các ký tự số (0-9)');
				$("#donGia").focus();
			}else{				
				$("#form-add").submit();
			}			
		});
		
		$('#updateButton').click(function(){
			var tenMon2 = $('#tenMon2').val();
			var donGia2 = $('#donGia2').val();
			if(!isValidString(tenMon2)){
				alert('Tên món trống hoặc không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)');
				$("#tenMon2").focus();
			}else if($('#loai2').val() == 0){
				alert('Bạn chưa chọn loại món ăn!');
			}else if(!isNumeric(donGia2) || donGia2 == null){
				alert('Giá nhập vào không đúng!\nTối đa 8 ký tự và chỉ cho phép các ký tự số (0-9)');
				$("#donGia2").focus();
			}else{				
				$("#form-update").submit();
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

#hieuUng {
	padding: 1px;
	margin: 4px 4px 0 0;
	border: 1px solid #d5d5d5;
	transition: all 0.5s ease;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-moz-transition-delay: 0.5s;
	transform: rotate(0deg);
	-moz-transform: rotate(0deg);
	-webkit-transform: rotate(0deg);
	width: 70px;
}

#hieuUng:hover {
	box-shadow: 0px 0px 10px #666;
	-moz-box-shadow: 0px 0px 10px #666;
	-webkit-box-shadow: 0px 0px 10px #666;
	border-radius: 5px;
	background-color: #ffffff;
	padding: 5px;
	transition: all 0.5s ease;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	transform: rotate(360deg);
	-moz-transform: rotate(360deg);
	-webkit-transform: rotate(360deg);
	position: relative;
	width: 200px;
}

.modal.fade.in {
	top: 12%;
}
</style> 


<title>Quản lý thực đơn</title>
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

	<!-- Modal Add Food -->
	<div id="addFoodModal" class="modal fade" style="width: 437px; margin-left: -225px; display: none;">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400;">Thêm món ăn</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 368px">
		      	<div style="float: left">
		      		<form id="form-add" action="quanLyThucDonServlet" method="post" enctype="multipart/form-data">
			      		<table class="table table-hover table-condensed" style="border: 0px; width: 400px">
							<tr style="">
							     <th style="text-align: right; color: white; width: 23%; background-color: rgb(44, 133, 216);">
							     	<b>Ảnh</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">							
								    <input type="hidden" name="oldFoodImg" value="noImage.png">
									<img id="imgPreview" src="upload/noImage.png" alt="Ảnh tải lên" style=" width: 150px; height: 100px; margin-top: 3px"/>
								  	<input type="file" name="foodImg" id="foodImg" onchange="readURL(this)" accept="image/png,image/jpeg,image/gif,image/jpg">
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 23%; background-color: rgb(44, 133, 216);">
							     	<b>Tên món</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								   	 <p style="color: red; margin-top: 0px"><input id="tenMon" name="tenmon" type="text">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 25%; background-color: rgb(44, 133, 216);">
							     	<b>Loại</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
									  	 <select id=loai name="loai">
									  	 	<option value=0>---- Loại ----</option>
									  	 	<option value=1>Cơm</option>
									  	 	<option value=2>Lẩu</option>
									  	 	<option value=3>Hải sản</option>
									  	 	<option value=4>Thức uống</option>
									  	 	<option value=5>Loại khác</option>
									  	 </select>*
									 </p>
								 </td>
							</tr>
							<tr>	
							     <th style="text-align: right; color: white; width: 23%; background-color: rgb(44, 133, 216);">
							     	<b>Đơn giá (VNĐ)</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								 	<p style="color: red; margin-top: 0px"><input id="donGia" name="gia" type="text">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 23%; background-color: rgb(44, 133, 216);">
							     	<b>Khuyên dùng</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
								  	<p style="color: red; margin-top: 0px">
									  	<select id=khuyenDung name="khuyendung">
									  	 	<option value='0'>Không</option>
									  	 	<option value='1'>Có</option>
									  	</select>*
									</p>
								 </td>
							</tr>
			      		</table>
		      		</form>
		      	</div>		      	
		      	<br><br><br>
		      	<div style="float: right; margin-top: 7px">
		      		<input id="add" class="btn btn-primary" type="button" value="Thêm" style="padding: 7px 15px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Hủy</button>
		      	</div>		      
		      </div>
		    </div>
		  </div>
	</div>
	
	<!-- Modal Update Food -->
	<%
		Food food = (Food) request.getAttribute("food");
	%>
	<div id="updateFoodModal" class="modal fade" style="width: 437px; margin-left: -225px; display: none;">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400;">Cập nhật món ăn</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 368px">
		      	<div style="float: left">
		      		<form id="form-update" action="quanLyThucDonUpdateServlet" method="post" enctype="multipart/form-data">
		      			<input type="hidden" name="mamon" value="<%=food.getMamon()%>">
			      		<table class="table table-hover table-condensed" style="border: 0px; width: 400px">
							<tr style="">
							     <th style="text-align: right; color: white; width: 23%; background-color: rgb(44, 133, 216);">
							     	<b>Ảnh</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">							
								    <input type="hidden" name="oldFoodImg2" value="<%=food.getAnh()%>">
									<img id="imgPreview2" src="./admin/upload/<%=food.getAnh()%>" alt="Ảnh tải lên" style=" width: 150px; height: 100px; margin-top: 3px"/>
								  	<input type="file" name="foodImg2" id="foodImg2" onchange="readURL2(this)" accept="image/png,image/jpeg,image/gif,image/jpg">
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 23%; background-color: rgb(44, 133, 216);">
							     	<b>Tên món</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								   	 <p style="color: red; margin-top: 0px"><input id="tenMon2" name="tenmon2" type="text" value="<%=food.getTenmon()%>">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 25%; background-color: rgb(44, 133, 216);">
							     	<b>Loại</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
									  	 <select id=loai2 name="loai2">
									  	 <%
									  	 	switch(food.getMaloai()){
									  	 	case 1: %><option value=1>Cơm</option><%
									  	 			break;
									  		case 2: %><option value=2>Lẩu</option><%
									  	 			break;
									  		case 3: %><option value=3>Hải sản</option><%
									  	 			break;
									  		case 4: %><option value=4>Thức uống</option><%
									  	 			break;
									  		case 5: %><option value=5>Loại khác</option><%
									  		}
									  	 %>
									  	 	<option value=0>---- Loại ----</option>
									  	 	<option value=1>Cơm</option>
									  	 	<option value=2>Lẩu</option>
									  	 	<option value=3>Hải sản</option>
									  	 	<option value=4>Thức uống</option>
									  	 	<option value=5>Loại khác</option>
									  	 </select>*
									 </p>
								 </td>
							</tr>
							<tr>	
							     <th style="text-align: right; color: white; width: 23%; background-color: rgb(44, 133, 216);">
							     	<b>Đơn giá (VNĐ)</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								 	<p style="color: red; margin-top: 0px"><input id="donGia2" name="gia2" type="text" value="<%=(long)food.getGia()%>">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 23%; background-color: rgb(44, 133, 216);">
							     	<b>Khuyên dùng</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
								  	<p style="color: red; margin-top: 0px">
									  	<select id=khuyenDung2 name="khuyendung2">
									  	<%
									  		switch(food.getKhuyendung()){
									  		case 0: %><option value='0'>Không</option>
									  				  <option value='1'>Có</option><%
									  	 			break;
									  		case 1: %><option value='1'>Có</option>
									  				  <option value='0'>Không</option><%
									  		}
									  	%>									  	 	
									  	</select>*
									</p>
								 </td>
							</tr>
			      		</table>
		      		</form>
		      	</div>		      	
		      	<br><br><br>
		      	<div style="float: right; margin-top: 7px">
		      		<input id="updateButton" class="btn btn-primary" type="button" value="Cập nhật" style="padding: 7px 15px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Hủy</button>
		      	</div>		      
		      </div>
		    </div>
		  </div>
	</div>
	
	<!-- Update Form -->
	<form action="quanLyThucDonUpdateServlet" method="post" style="display: none">
		<input type=submit id=update>
		<input type="hidden" name=action value="show">
		<input type=hidden name="mamon" id=mamon value="">
	</form>
	
	<!-- Refresh -->
	<form id="refreshForm" method="post" action="showQuanLyThucDonServlet?sapXep=1" style="display: none">
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
            	    <a class="groupTitle" href="showQuanLyThucDonServlet?sapXep=1" style="margin-top: 0px; display: block; 
	       		       opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">QUẢN LÝ THỰC ĐƠN</h3>
	       		    </a>
            	</div>
            	
            	<div id="divLeft">	        		
	        		<a id="addFood" class="tile" style="padding: 10px 15px; background-color: rgb(73, 62, 197);
	        		   margin-top: 0px; width: 100px; text-align: center;">
						Thêm món ăn				
					</a>
					<a id="updateFood" class="tile" style="padding: 10px 15px; background-color: rgb(14, 196, 101);
					   margin-top: 50px; width: 100px; text-align: center;">
						Cập nhật		
					</a>	
					<a id="deleteFood" class="tile" style="padding: 10px 15px; background-color: rgb(238, 78, 78);
	        		   margin-top: 100px; width: 100px; text-align: center;" onclick="return xacNhanXoa()">
						Xóa món ăn				
					</a>
        		</div>
        		
        		<div id="divContent">        		
         <%
        	int index=0;
         	ArrayList<Food> listFood = (ArrayList<Food>) request.getAttribute("listFood");
         	if(listFood != null){
         	%>
				
				<table id='table' class="table table-hover table-condensed" style="border: 0px">
					<thead style="background-color: rgb(44, 133, 216);">
					   <tr>
					   	 <th style="text-align: center; color: white; width: 1%" title="Chọn tất cả">
					   	 	<input id='checkAll' type="checkbox" value="">
					   	 </th>
					     <th style="text-align: center; color: white; width: 11%"></th>
					     <th style="text-align: center; color: white; width: 13%">
					     	<a href="showQuanLyThucDonServlet?sapXep=1" title="Sắp xếp theo mã món"
					     	   style="color: white; text-decoration: none;">
					     		<b>Mã món</b>
					     	</a>
					     </th>
					     <th style="text-align: center; color: white; width: 22%">
					     	<a href="showQuanLyThucDonServlet?sapXep=2" title="Sắp xếp theo tên món" 
					     	   style="color: white; text-decoration: none;">
					     		<b>Tên món</b>
					     	</a>
					     </th>
					     <th style="text-align: center; color: white; width: 15%">
					     	<a href="showQuanLyThucDonServlet?sapXep=3" title="Sắp xếp theo mã loại" 
					     	   style="color: white; text-decoration: none;">
					     		<b>Loại</b>
					     	</a>
					     </th>
					     <th style="text-align: center; color: white; width: 18%">
					     	<a href="showQuanLyThucDonServlet?sapXep=4" title="Sắp xếp theo đơn giá"  
					     	   style="color: white; text-decoration: none;">
					     		<b>Đơn giá</b>
					     	</a>
					     </th>
					     <th style="text-align: center; color: white; width: 20%">
					    	<a href="showQuanLyThucDonServlet?sapXep=5" title="Sắp xếp theo khuyên dùng" 
					     	   style="color: white; text-decoration: none;">
					     		<b>Khuyên dùng</b>
					     	</a>
					     </th>
					   </tr>
					</thead>
					<tbody>
         	<%
		      	for(Food s : listFood){
		      		index++;
		      		String tam=Long.toString(((long)s.getGia()));
					String gia="";
					int d=tam.length()%3;
					for(int i=0;i<tam.length();i++){
						if((i+1)%3==d && i!=tam.length()-1) gia+=tam.charAt(i)+".";
						else gia+=tam.charAt(i);
					}
         	   %>						        		
						<tr class="zzBody">
						  <td style="text-align: center; border-top: 2px solid #dddddd;">
					   	 	<input id='check<%=s.getMamon()%>' type="checkbox" value="<%=s.getMamon()%>">
						  </td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;">
						     <img id="hieuUng" src="./admin/upload/<%=s.getAnh()%>">
						  </td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getMamon()%></td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getTenmon()%></td>		              
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getTenloai()%></td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=gia%> VNĐ</td>	
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%if(s.getKhuyendung() == 0){out.print("Không");}else{out.print("Có");}%></td>								     
						</tr>  				    	
		 	  <%}//for
		 	  %>
		 	     	</tbody>
				</table>
						
						
		  		<div id="pageNavPosition" align="center" style="margin-top: 10px"></div>
		  		<!-- PAGING TABLE -->
				<script type="text/javascript">
					var pager = new Pager('table', 5);
					pager.init();
					pager.showPageNav('pager', 'pageNavPosition');
					pager.showPage(1);
				</script>
		  <%}//if %>
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>