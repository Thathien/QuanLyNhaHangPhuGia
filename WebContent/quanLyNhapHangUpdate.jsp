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
	//Vô hiệu hóa chuột phải
	/* document.addEventListener("contextmenu", function(e){
	    e.preventDefault();
	}, false); */
	
	function xacNhan(){
		return confirm("Bạn muốn đăng xuất?");
	}
	
	function regIsDigit(fData)
	{
		   var reg = new RegExp("^[0-9]*[0-9]?$");
		   return (reg.test(fData));
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
		return (v.search(/[<]|[>]|[#]/ig) == -1) && (v.length>0) && (kt==1);
	};
	
	$(document).ready(function() {
		
		$("#checkAll").click(function () {
			if(this.checked){
				$(":checkbox").prop('checked', true);
			}else{
				$(":checkbox").prop('checked', false);
			}
		});
		
		$("#addMatHang").click(function () {
			$("#addMatHangModal").modal("show");		  		
		});
		
		$('#add').click(function(){
			var tenhang = $('#tenHang').val();
			var donvitinh = $('#donViTinh').val();
			var soluong = $('#soLuong').val()*1;
			var gia = $('#donGia').val();
			
			if(!isValidString(tenhang)){
				alert("Tên mặt hàng trống hoặc có ký tự không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)");
				$("#tenHang").focus();
			}else if(!isValidString(donvitinh)){
				alert("Đơn vị tính trống hoặc có ký tự không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)");
				$("#donViTinh").focus();
			}else if(soluong>=10000){
				alert('Số lượng nhập vào không hợp lệ!\nSố lượng tối thiểu: 1\nSố lượng tối đa: 9999');
				$("#soLuong").focus();
			}else if( !regIsDigit($('#soLuong').val()) || $('#soLuong').val()==0){
				alert('Số lượng nhập vào không hợp lệ!\nSố lượng tối thiểu: 1\nSố lượng tối đa: 9999');
				$("#soLuong").focus();
			}else if(!isNumeric(gia) || gia == null){
				alert('Giá nhập vào không đúng!\nTối đa 8 ký tự và chỉ cho phép các ký tự số (0-9)');
				$("#donGia").focus();
			}else{			
				$("#form-add").submit();
			}
		});
		
		$("#deleteMatHang").click(function () {
				var listMatHang = "";
		  		
		  		for(var i=0; i<$(":checkbox:checked").length;i++){
		  			if($(":checkbox:checked").eq(i).attr('id') != "checkAll"){
		  				listMatHang+=$(":checkbox:checked").eq(i).attr('id')+",";
		  			}
		  		}
		  		
			   	if($(":checkbox:checked").length != 0){		  
			   		var x = confirm("Bạn muốn xóa?");
			   		if(x){
			   			$.post("quanLyNhapHangServlet",{
				  			listMatHang: listMatHang,
				  			action: "deleteMatHang"
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
			  		alert("Hãy chọn ít nhất 1 mặt hàng trước khi click xóa mặt hàng!");
			  	} 	  		
			
		});
		
		$("#updateDonHang").click(function () {
			$("#updateDonHangModal").modal("show");
		});
		
		$('#btnUpdate').click(function(){
			var tendonhang = $('#tenDonHang').val();
			var ngaynhap = $('#ngayNhapNew').val();
			var date = new Date(ngaynhap);
			var now = new Date();
			
			if(ngaynhap==""){
				ngaynhap = $('#ngayNhapOld').val();
			}
			
		 	if(!isValidString(tendonhang)){
				alert("Mô tả đơn hàng trống hoặc có ký tự không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)");
			}else if (date.getFullYear() < 2020 || date.getTime() > (now.getTime()+25200000)){
				alert("Thời gian nhập hàng phải nằm trong khoảng từ ngày 01/01/2020 đến thời gian hiện tại!");
			}else{					
				$("#form-update").submit();
			} 
		});
	});

</script>
<script type="text/javascript" src="./admin/js/plugin.js"></script>
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
.modal.fade.in {
	top: 12%;
}
</style> 


<title>Quản lý nhập hàng</title>
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
	
	<%
		HoaDon donHang = (HoaDon) request.getAttribute("donHang");
	%>
	<!-- Modal thêm mặt hàng -->
	<div id="addMatHangModal" class="modal fade" style="width: 437px; margin-left: -225px; display: none;">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400;">Thêm mặt hàng</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 215px">
		      	<div style="float: left">
		      		<form id="form-add" action="quanLyNhapHangServlet" method="post">
		      			<input type="hidden" name=action value="addMatHangUpdate">
		      			<input type="hidden" name=madonhang value="<%=donHang.getMadonhang()%>">
			      		<table class="table table-hover table-condensed" style="border: 0px; width: 400px">
							<tr>
							     <th style="text-align: right; color: white; width: 23%; background-color: rgb(44, 133, 216);">
							     	<b>Tên mặt hàng</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								   	 <p style="color: red; margin-top: 0px"><input id="tenHang" name="tenhang" type="text" placeholder="Tên mặt hàng" style="width: 270px">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 25%; background-color: rgb(44, 133, 216);">
							     	<b>Đơn vị tính</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px"><input id="donViTinh" name="donvitinh" type="text" placeholder="Kg, thùng, gói, ..." style="width: 270px">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 25%; background-color: rgb(44, 133, 216);">
							     	<b>Số lượng</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px"><input id="soLuong" name="soluong" type="text" placeholder="Chữ số" style="width: 270px">*</p>
								 </td>
							</tr>
							<tr>	
							     <th style="text-align: right; color: white; width: 23%; background-color: rgb(44, 133, 216);">
							     	<b>Đơn giá (VNĐ)</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
								 	<p style="color: red; margin-top: 0px"><input id="donGia" name="gia" type="text" placeholder="Chữ số, không quá 8 ký tự" style="width: 270px">*</p>
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
	
	<!-- Modal cập nhật đơn hàng -->
	<div id="updateDonHangModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 135px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Cập nhật đơn hàng</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 165px; border-radius: 0px">
		      	<div>
		      		<form id="form-update" action="quanLyNhapHangServlet" method="post">
		      			<input type="hidden" name="action" value="update">
		      			<input type="hidden" name=madonhang value="<%=donHang.getMadonhang()%>">
			      		<table class="table table-hover table-condensed" style="border: 0px; width: 380px">
							<tr>
							     <th style="text-align: right; color: white; width: 28%; background-color: rgb(44, 133, 216);">
							     	<b>Mô tả đơn hàng</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								   	 <p style="color: red; margin-top: 0px"><input id="tenDonHang" name="tendonhang" type="text" style="width: 250px;"
								   	 	placeholder="Mô tả các mặt hàng có trong đơn hàng" value="<%=donHang.getTendonhang()%>">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 28%; background-color: rgb(44, 133, 216);">
							     	<b>Ngày nhập</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
								   	 <p style="color: red; margin-top: 0px">
								   	 	<input id="ngayNhapOld" type="text" readonly="readonly" name="ngayNhapOld" style="width: 250px;" value="<%=donHang.getNgaynhap()%>">*
								   	 	<input id="ngayNhapNew" name="ngayNhapNew" type="date" required style="width: 250px;"></p>
								 </td>
							</tr>
				      	</table>
			      	</form>
		      	</div>		      	
		      	
		      	<div style="float: right; margin-top: 5px">
		      		<input id="btnUpdate" class="btn btn-primary" type="button" value="Cập nhật" style="padding: 7px 15px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Hủy</button>
		      	</div>		      
		      </div>
		    </div>
		</div>
	</div>
	
	<!-- Refresh -->
	<form id="refreshForm" method="post" action="quanLyNhapHangServlet" style="display: none">
		<input type="submit" id="refresh">
		<input type="hidden" name="action" value="showUpdate">
		<input type="hidden" name=madonhang3 value="<%=donHang.getMadonhang()%>">
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
            	    <a class="groupTitle" style="margin-top: 0px; display: block; opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">CẬP NHẬT ĐƠN HÀNG</h3>
	       		    </a>
            	</div>
            	
            	<div id="divLeft">        		
	        		<a id="addMatHang" class="tile" style="padding: 10px 15px; background-color: rgb(73, 62, 197);
	        		   margin-top: 0px; width: 100px; text-align: center;">
						Thêm mặt hàng	
					</a>
					<a id="deleteMatHang" class="tile" style="padding: 10px 15px; background-color: rgb(238, 78, 78);
	        		   margin-top: 50px; width: 100px; text-align: center;">
						Xóa mặt hàng			
					</a>
					<a id="troVe" href="showQuanLyNhapHangServlet" class="tile" style="padding: 10px 15px; background-color: rgb(62, 197, 197);
	        		   margin-top: 100px; width: 100px; text-align: center;">
						Trở về			
					</a>
        		</div>
        		
        		<div id="divContent">        		
			    	<table style="width: 70%; margin: 1.1% 1%; border: 1px solid white;">
						<tr style="color: white">
						    <td style="text-align: center; background-color: rgb(44, 133, 216); width: 20%">
							  	<b>Mã đơn hàng</b>
							</td>	
						 	<td style="text-align: center; background-color: rgb(44, 133, 216); width: 35%">
							  	<b>Mô tả đơn hàng</b>
							</td>	
						    <td style="text-align: center; background-color: rgb(44, 133, 216); width: 25%">
							  	<b>Ngày nhập</b>
							</td>	
							<td style="text-align: center; background-color: rgb(44, 133, 216); width: 20%">
							</td>
						</tr>
						<tr>
						 	<td style="text-align: center; background-color: rgb(235, 235, 235);">
							  	<%=donHang.getMadonhang()%>
							</td>
							<td style="text-align: center; background-color: rgb(235, 235, 235);">
							  	<%=donHang.getTendonhang()%>
							</td>		
							<td style="text-align: center; background-color: rgb(235, 235, 235);">
							  	<%=donHang.getNgaynhap()%>
							</td>	
							<td style="text-align: center; background-color: rgb(235, 235, 235);">
							  	<input type="button" id="updateDonHang" value="Cập nhật">
							</td>
						</tr>
					</table>
				  <%
         	ArrayList<HoaDon> chiTietHoaDon = (ArrayList<HoaDon>) request.getAttribute("chiTietHoaDon");
         	int index = 0;
         	if(chiTietHoaDon != null){
         		if(chiTietHoaDon.size() != 0){
	        %>				
				<table id='table' class="table table-hover table-condensed" style="border: 0px">
					<thead style="background-color: rgb(44, 133, 216);">
					   <tr>
					   	 <th style="text-align: center; color: white; width: 5%" title="Chọn tất cả">
					   	 	<input id='checkAll' type="checkbox" value="">
					   	 </th>
					   	 <th style="text-align: center; color: white; width: 5%"><b>#</b></th>
					     <th style="text-align: center; color: white; width: 30%"><b>Tên mặt hàng</b></th>
					     <th style="text-align: center; color: white; width: 20%"><b>Số lượng</b></th>
					     <th style="text-align: center; color: white; width: 20%"><b>Đơn vị tính</b></th>
					     <th style="text-align: center; color: white; width: 20%"><b>Đơn giá</b></th>
					   </tr>
					</thead>
					<tbody>
	       	<%
	       		long tongGia=0;
		      	for(HoaDon s : chiTietHoaDon){
		      		index++;
		      		tongGia+=(long)s.getGia()*s.getSoluong();
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
					   	 	<input id='<%=s.getStt()%>' type="checkbox" value="<%=s.getStt()%>">
						  </td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=index%></td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getTenhang()%></td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getSoluong()%></td>	
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getDonvitinh()%></td>	
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
		    <%}else{
				  %><h3 style="font-size: 13px; color: red; text-align: center; margin-left: -20px">Hiện tại đơn hàng này chưa có mặt hàng nào!</h3><%	
			  }
         	}
			%>
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
       
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>