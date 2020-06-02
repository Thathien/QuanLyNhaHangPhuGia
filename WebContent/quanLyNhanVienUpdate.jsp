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
<script type="text/javascript">window.jQuery || document.write('<script type="text/javascript" src="/admin/js/jquery1102.js"><\/script>')</script> 
<script type="text/javascript" src="./admin/js/plugins.js"></script>

<script type="text/javascript">	
	//Vô hiệu hóa chuột phải
	/* document.addEventListener("contextmenu", function(e){
	    e.preventDefault();
	}, false); */
	
	function xacNhan(){
		return confirm("Bạn muốn đăng xuất?");
	}
	function isNumeric(v) {
		return v.length < 51 && !isNaN(v) && v.search(/[A-Z]|[#]|[-]/ig) == -1;
	};
	
	function isNumericLuong(v) {
		if(parseInt(v)==0) return false;
		return v.length > 0 && v.length < 9 && !isNaN(v) && v.search(/[A-Z]|[#]|[-]/ig) == -1;
	};
	
	function isNumericCMND(v) {
		if(parseInt(v)==0) return false;
		if(v.length != 9) return false;
		return !isNaN(v) && v.search(/[A-Z]|[#]|[-]/ig) == -1;
	};
	
	function isValidTenNV(v){
		var kt=0;
		for(var i=0;i<v.length;i++){
			if (v[i]!=" ") kt=1;
		}
		return (v.search(/[<]|[>]|[#]|[-]/ig) == -1) && (v.length>0) && (v.length<=50) && (kt==1);
	};
	
	function isValidQueQuan(v){
		var kt=0;
		for(var i=0;i<v.length;i++){
			if (v[i]!=" ") kt=1;
		}
		return (v.search(/[<]|[>]|[#]/ig) == -1) && (v.length>0) && (kt==1);
	};
	
	$(document).ready(function() {
		$("#updateNhanVienModal").modal("show");	
		
		$("#checkAll").click(function () {
				if(this.checked){
					$(":checkbox").prop('checked', true);
				}else{
					$(":checkbox").prop('checked', false);
				}
		});	
		
		$("#xemChiTiet").click(function () {
		  	if($(":checkbox:checked").length == 1){
		  		var stt=$(":checkbox:checked").eq(0).attr('id');		  		
		  		$('#xemMaNV').text($(":checkbox:checked").eq(0).attr("maNV"));	
		  		$('#xemTenNV').text($(":checkbox:checked").eq(0).attr("tenNV"));
		  		$('#xemGioiTinh').text($(":checkbox:checked").eq(0).attr("gioiTinh"));
		  		$('#xemNgaySinh').text($(":checkbox:checked").eq(0).attr("ngaySinh"));
		  		$('#xemQueQuan').text($(":checkbox:checked").eq(0).attr("queQuan"));
		  		$('#xemCMND').text($(":checkbox:checked").eq(0).attr("cmnd"));
		  		$('#xemDienThoai').text($(":checkbox:checked").eq(0).attr("dienThoai"));
		  		$('#xemLuongCoBan').text($(":checkbox:checked").eq(0).attr("luongCoBan"));
		  		$('#xemChucVu').text($(":checkbox:checked").eq(0).attr("chucVu"));
		  		$("#xemChiTietModal").modal("show");
		  	}else{
		  		alert("Hãy chọn 1 nhân viên bạn muốn xem!");
		  	}		  		
		});		
		
		$("#deleteNhanVien").click(function () {
				var listNhanVien = "";
				
		  		for(var i=0; i<$(":checkbox:checked").length;i++){
		  			if($(":checkbox:checked").eq(i).attr('id') != "checkAll") listNhanVien+=$(":checkbox:checked").eq(i).attr('id')+",";
		  		}
		  		
			  	if($(":checkbox:checked").length != 0){		
			  		var x = confirm("Bạn muốn xóa?");
			  		if(x){
			  			$.post("quanLyNhanVienServlet",{
				  			listNhanVien: listNhanVien,
				  			action: "delete",
					    }, function(message){
							if(message=="wrong"){
								alert('Không thể xóa!\nMột trong những đầu bếp bạn chọn đang làm việc.');
							}else if(message=="ok"){
								alert('Xóa thành công!');
								$("#refresh").click();
							}else{
								alert('Có lỗi xảy ra, không thể xóa!');
							}
		  			    });
			  		}else{
						return false;
					}
			  		
			  	}else{
			  		alert("Hãy chọn ít nhất 1 nhân viên trước khi click xóa nhân viên!");
			  	}		 		
			
		});
		
		$("#addNhanVien").click(function () {
			$("#addNhanVienModal").modal("show");		  		
		});
		
		$("#updateNhanVien").click(function () {
		  	if($(":checkbox:checked").length == 1){
		  		$('#showMaNV').val($(":checkbox:checked").eq(0).attr('id'));
		  		$("#update").click();
		  	}else{
		  		alert("Hãy chọn 1 nhân viên trước khi click cập nhật!");
		  	}		  		
		});
		
		$('#add').click(function(){
			var tenNV = $('#addTenNV').val();
			var gioiTinh = $('#addGioiTinh').val();
			var ngaySinh = $('#addNgaySinh').val();
			var queQuan = $('#addQueQuan').val();
			var cmnd = $('#addCMND').val();
			var dienThoai = $('#addDienThoai').val();
			var chucVu = $('#addChucVu').val();
			var luongCoBan = $('#addLuongCoBan').val();
			
			var date = new Date(ngaySinh);
			var now = new Date();
			
			if(!isValidTenNV(tenNV)){
				alert('Tên nhân viên trống hoặc không hợp lệ!\n- Tối đa 50 ký tự\n- Chỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)');
				$("#addTenNV").focus();
			}else if(ngaySinh == ""){
				alert("Bạn chưa chọn ngày sinh!");
			}else if (date.getFullYear() < 1900 || date.getTime() > (now.getTime()+25200000)){
				$("#addNgaySinh").focus();
				alert("Ngày sinh không hợp lệ!");
			}else if(!isValidQueQuan(queQuan)){
				alert('Quê quán trống hoặc không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)');
				$("#addQueQuan").focus();
			}else if(!isNumericCMND(cmnd)){
				alert('Số chứng minh trống hoặc không hợp lệ!\nSố chứng minh nhân dân gồm 9 chữ số.');
				$("#addCMND").focus();
			}else if(!isNumeric(dienThoai)){
				alert('Số điện thoại không hợp lệ!');
				$("#addDienThoai").focus();
			}else if(chucVu == 0){
				alert('Bạn chưa chọn chức vụ!');
			}else if(!isNumericLuong(luongCoBan)){
				alert('Lương trống hoặc không hợp lệ!!\nTối đa 8 ký tự và chỉ cho phép các ký tự số (0-9)');
				$("#addLuongCoBan").focus();
			}else{	
				//alert(tenNV+" | "+gioiTinh+" | "+ngaySinh+" | "+queQuan+" | "+cmnd+" | "+dienThoai+" dt | "+chucVu+" | "+luongCoBan);
				$.post("quanLyNhanVienServlet",{
		  			tenNV: tenNV,
		  			gioiTinh: gioiTinh,
		  			ngaySinh: ngaySinh,
		  			queQuan: queQuan,
		  			cmnd: cmnd,
		  			dienThoai: dienThoai,
		  			chucVu: chucVu,
		  			luongCoBan: luongCoBan,
		  			action: "add"
			    }, function(message){
			    	if(message=="error"){
						alert('Có lỗi xảy ra, không thể thêm nhân viên!');
					}else if(message=="same"){
						alert('Chứng minh nhân dân không thể trùng với người khác!');
						$("#addCMND").focus();
					}else{
						alert('Đã thêm thành công!');
						$("#refresh").click();
					}
				});
			}			
		});
		
		$('#btnUpdate').click(function(){
			var tenNV = $('#updateTenNV').val();
			var gioiTinh = $('#updateGioiTinh').val();
			var ngaySinh = $('#updateNgaySinhNew').val();
			var queQuan = $('#updateQueQuan').val();
			var cmnd = $('#updateCMND').val();
			var dienThoai = $('#updateDienThoai').val();
			var chucVu = $('#updateChucVu').val();
			var chucVuOld = $('#updateChucVuOld').val();
			var luongCoBan = $('#updateLuongCoBan').val();
			
			var date = new Date(ngaySinh);
			var now = new Date();
			
			if( $('#updateNgaySinhNew').val() == ""){
				ngaySinh = $('#updateNgaySinhOld').val();
			}
			
			if(!isValidTenNV(tenNV)){
				alert('Tên nhân viên trống hoặc không hợp lệ!\n- Tối đa 50 ký tự\n- Chỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)');
				$("#updateTenNV").focus();
			}else if (date.getFullYear() < 1900 || date.getTime() > (now.getTime()+25200000)){
				alert("Ngày sinh không hợp lệ!");
				$("#updateNgaySinhNew").focus();
			}else if(!isValidQueQuan(queQuan)){
				alert('Quê quán trống hoặc không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)');
				$("#updateQueQuan").focus();
			}else if(!isNumericCMND(cmnd)){
				alert('Số chứng minh trống hoặc không hợp lệ!\nSố chứng minh nhân dân gồm 9 chữ số.');
				$("#updateCMND").focus();
			}else if(!isNumeric(dienThoai)){
				alert('Số điện thoại không hợp lệ!');
				$("#updateDienThoai").focus();
			}else if(chucVu == 0){
				alert('Bạn chưa chọn chức vụ!');
				$("#updateChucVu").focus();
			}else if(!isNumericLuong(luongCoBan)){
				alert('Lương trống hoặc không hợp lệ!!\nTối đa 8 ký tự và chỉ cho phép các ký tự số (0-9)');
				$("#updateLuongCoBan").focus();
			}else{	
				//alert(tenNV+" | "+gioiTinh+" | "+ngaySinh+" | "+queQuan+" | "+cmnd+" | "+dienThoai+" dt | "+chucVu+" | "+luongCoBan);
				$.post("quanLyNhanVienServlet",{
					maNV: $('#updateMaNV').val(),
		  			tenNV: tenNV,
		  			gioiTinh: gioiTinh,
		  			ngaySinh: ngaySinh,
		  			queQuan: queQuan,
		  			cmnd: cmnd,
		  			dienThoai: dienThoai,
		  			chucVu: chucVu,
		  			chucVuOld: chucVuOld,
		  			luongCoBan: luongCoBan,
		  			action: "update"
			    }, function(message){
					if(message=="ok"){
						alert('Cập nhật thành công!');
						$("#refresh").click();
					}else if(message=="wrong"){
						alert('Không thể cập nhật chức vụ của nhân viên này!\nHiện tại đầu bếp này đang làm việc.');
					}else{
						alert('Có lỗi xảy ra, không thể cập nhật nhân viên!');
					}
				});
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
	top: 8%;
}
</style> 


<title>Quản lý nhân viên</title>
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
	ArrayList<NhanVien> listNhanVien = (ArrayList<NhanVien>) request.getAttribute("listNhanVien");	
	NhanVien nhanVien = (NhanVien) request.getAttribute("nhanVien");	
%>
	<!-- Modal cập nhật nhân viên -->
	<div id="updateNhanVienModal" class="modal fade" style="width: 437px; margin-left: -225px; display: none;">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400;">Cập nhật nhân viên</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 420px">
		      	<div style="float: left">
			      		<table class="table table-hover table-condensed" style="border: 0px; width: 400px">
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Tên nhân viên</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								    <p style="color: red; margin-top: 0px">
								    	<input type="hidden" id="updateMaNV" value="<%=nhanVien.getManv()%>">
								    	<input type="text" id="updateTenNV" style=" width: 230px;" placeholder="Tối đa 50 ký tự" value="<%=nhanVien.getTennv()%>">*</p>								 
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Giới tính</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 <%
								  	 	if(nhanVien.getGioitinh() == 1){
								  	 %>
								  	 	<select id="updateGioiTinh">
								  	 		<option value="1">Nam</option>
								  	 		<option value="0">Nữ</option>
								  	 	</select>*</p>
								  	 <%
								  	 	}else{
								  	 %>
								  	 	<select id="updateGioiTinh">
								  	 		<option value="0">Nữ</option>
								  	 		<option value="1">Nam</option>
								  	 	</select>*</p>
								  	 <%		
								  	 	}
								  	 %>
								 </td>
							</tr>
							<tr>	
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Ngày sinh</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								 	 <p style="color: red; margin-top: 0px">
								 	 	<input id="updateNgaySinhOld" type="text" readonly="readonly" style="width: 75px;" value="<%=nhanVien.getNgaysinh()%>">*
								 	 	<input type="date" id="updateNgaySinhNew"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Quê quán</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<input type="text" id="updateQueQuan" value="<%=nhanVien.getQuequan()%>" style=" width: 230px;" placeholder="quận (huyện) - thành phố (tỉnh)">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Số chứng minh</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<input type="text" id="updateCMND" value="<%=nhanVien.getCmnd()%>" style=" width: 230px;" placeholder="9 chữ số">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Điện thoại</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<input type="text" id="updateDienThoai" value="<%=nhanVien.getDienthoai()%>" style=" width: 230px;" placeholder="Tối đa 50 chữ số"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Chức vụ</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<input type="hidden" id="updateChucVuOld" value="<%=nhanVien.getChucvu()%>">
								  	 	<select id="updateChucVu">
								  	 		<option value="<%=nhanVien.getChucvu()%>">
								  	 		<%
										  	  switch(nhanVien.getChucvu()){
										  	  case 1: out.print("Quản lý bán hàng"); break;
										  	  case 2: out.print("Bếp trưởng"); break;
										  	  case 3: out.print("Bếp phó"); break;
										  	  case 4: out.print("Đầu bếp"); break;
										  	  case 5: out.print("Phụ bếp"); break;
										  	  case 6: out.print("Bồi bàn"); break;
										  	  case 7: out.print("Bảo vệ"); 
									  		  }
								  			%>
								  	 		</option>
								  	 		<option value="0">---- Chọn chức vụ ----</option>
								  	 		<option value="1">Quản lý bán hàng</option>
								  	 		<option value="2">Bếp trưởng</option>
								  	 		<option value="3">Bếp phó</option>
								  	 		<option value="4">Đầu bếp</option>
								  	 		<option value="5">Phụ bếp</option>
								  	 		<option value="6">Bồi bàn</option>
								  	 		<option value="7">Bảo vệ</option>
								  	 	</select>*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Lương (VNĐ)</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<input type="text" id="updateLuongCoBan" value="<%=(long)nhanVien.getLuongcoban()%>" style=" width: 230px;" placeholder="Lương cơ bản">*</p>
								 </td>
							</tr>
			      		</table>
		      	</div>		      	
		      	<br><br><br>
		      	<div style="float: right; margin-top: 7px">
		      		<input id="btnUpdate" class="btn btn-primary" type="button" value="Cập nhật" style="padding: 7px 15px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Hủy</button>
		      	</div>		      
		      </div>
		    </div>
		  </div>
	</div>

	<!-- Modal xem chi tiết nhân viên -->
	<div id="xemChiTietModal" class="modal fade" style="width: 437px; margin-left: -225px; display: none;">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400;">Chi tiết nhân viên</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 320px">
		      	<div style="float: left">
			      		<table class="table table-hover table-condensed" style="border: 0px; width: 400px">
							<tr style="">
							     <th style="text-align: right; color: white; width: 30%; background-color: rgb(44, 133, 216);">
							     	<b>Mã nhân viên</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">							
								  	<p id="xemMaNV" style=" width: 242px; margin-top: 0px; margin-left: 3px;"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 30%; background-color: rgb(44, 133, 216);">
							     	<b>Tên nhân viên</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								   	<p id="xemTenNV" style=" width: 242px; margin-top: 0px; margin-left: 3px;"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 30%; background-color: rgb(44, 133, 216);">
							     	<b>Giới tính</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	<p id="xemGioiTinh" style=" width: 242px; margin-top: 0px; margin-left: 3px;"></p>
								 </td>
							</tr>
							<tr>	
							     <th style="text-align: right; color: white; width: 30%; background-color: rgb(44, 133, 216);">
							     	<b>Ngày sinh</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								 	<p id="xemNgaySinh" style=" width: 242px; margin-top: 0px; margin-left: 3px;"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 30%; background-color: rgb(44, 133, 216);">
							     	<b>Quê quán</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	<p id="xemQueQuan" style=" width: 242px; margin-top: 0px; margin-left: 3px;"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 30%; background-color: rgb(44, 133, 216);">
							     	<b>Số chứng minh</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	<p id="xemCMND" style=" width: 242px; margin-top: 0px; margin-left: 3px;"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 30%; background-color: rgb(44, 133, 216);">
							     	<b>Điện thoại</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	<p id="xemDienThoai" style=" width: 242px; margin-top: 0px; margin-left: 3px;"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 30%; background-color: rgb(44, 133, 216);">
							     	<b>Chức vụ</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	<p id="xemChucVu" style=" width: 242px; margin-top: 0px; margin-left: 3px;"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 30%; background-color: rgb(44, 133, 216);">
							     	<b>Lương</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
								  	<p id="xemLuongCoBan" style=" width: 242px; margin-top: 0px; margin-left: 3px;"></p>
								 </td>
							</tr>
			      		</table>
		      	</div>		      	
		      	<br><br><br>
		      	<div style="float: right; margin-top: 7px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Đóng</button>
		      	</div>		      
		      </div>
		    </div>
		  </div>
	</div>
	
	<!-- Modal thêm nhân viên -->
	<div id="addNhanVienModal" class="modal fade" style="width: 437px; margin-left: -225px; display: none;">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400;">Thêm nhân viên</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 390px">
		      	<div style="float: left">
			      		<table class="table table-hover table-condensed" style="border: 0px; width: 400px">
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Tên nhân viên</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								    <p style="color: red; margin-top: 0px">
								    	<input type="text" id="addTenNV" style=" width: 230px;" placeholder="Tối đa 50 ký tự">*</p>								 
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Giới tính</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<select id="addGioiTinh">
								  	 		<option value="1">Nam</option>
								  	 		<option value="0">Nữ</option>
								  	 	</select>*</p>
								 </td>
							</tr>
							<tr>	
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Ngày sinh</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								 	 <p style="color: red; margin-top: 0px">
								 	 	<input type="date" id="addNgaySinh">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Quê quán</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<input type="text" id="addQueQuan" style=" width: 230px;" placeholder="quận (huyện) - thành phố (tỉnh)">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Số chứng minh</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<input type="text" id="addCMND" style=" width: 230px;" placeholder="9 chữ số">*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Điện thoại</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<input type="text" id="addDienThoai" style=" width: 230px;" placeholder="Tối đa 50 chữ số"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Chức vụ</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<select id="addChucVu">
								  	 		<option value="0">---- Chọn chức vụ ----</option>
								  	 		<option value="1">Quản lý bán hàng</option>
								  	 		<option value="2">Bếp trưởng</option>
								  	 		<option value="3">Bếp phó</option>
								  	 		<option value="4">Đầu bếp</option>
								  	 		<option value="5">Phụ bếp</option>
								  	 		<option value="6">Bồi bàn</option>
								  	 		<option value="7">Bảo vệ</option>
								  	 	</select>*</p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Lương (VNĐ)</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
								  	 <p style="color: red; margin-top: 0px">
								  	 	<input type="text" id="addLuongCoBan" style=" width: 230px;" placeholder="Lương cơ bản">*</p>
								 </td>
							</tr>
			      		</table>
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
	
	<!-- Update Form -->
	<form action="quanLyNhanVienServlet" method="post" style="display: none">
		<input type=submit id=update>
		<input type="hidden" name=action value="showUpdate">
		<input type=hidden name="maNV" id=showMaNV value="">
	</form>
	
	<!-- Refresh -->
	<form id="refreshForm" method="post" action="showQuanLyNhanVienServlet?sapXep=9" style="display: none">
		<input type="submit" id="refresh">
	</form>	
	
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
            	    <a class="groupTitle" href="showQuanLyNhanVienServlet?sapXep=9" style="margin-top: 0px; display: block; 
	       		       opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">QUẢN LÝ NHÂN VIÊN</h3>
	       		    </a>
            	</div>
            	
            	<div id="divLeft">
            		<!-- <a id="quanLyLuong" class="tile" style="padding: 10px 15px; background-color: rgb(159, 67, 231);
	        		   margin-top: 0px; width: 100px; text-align: center;">
						Quản lý lương			
					</a>	 -->  
					<a id="xemChiTiet" class="tile" style="padding: 10px 15px; background-color: rgb(2, 176, 192);
	        		   margin-top: 0px; width: 100px; text-align: center;">
						Xem chi tiết			
					</a>	      		
	        		<a id="addNhanVien" class="tile" style="padding: 10px 15px; background-color: rgb(73, 62, 197);
	        		   margin-top: 50px; width: 100px; text-align: center;">
						Thêm nhân viên			
					</a>
					<a id="updateNhanVien" class="tile" style="padding: 10px 15px; background-color: rgb(14, 196, 101);
	        		   margin-top: 100px; width: 100px; text-align: center;">
						Cập nhật			
					</a>	
					<a id="deleteNhanVien" class="tile" style="padding: 10px 15px; background-color: rgb(238, 78, 78);
	        		   margin-top: 150px; width: 100px; text-align: center;" >
						Xóa nhân viên			
					</a>
        		</div>
        		
        		<div id="divContent">        		
         <%
        	int index=0;
         	if(listNhanVien.size() != 0){
         	%>
				
				<table id='table' class="table table-hover table-condensed" style="border: 0px">
					<thead style="background-color: rgb(44, 133, 216);">
					   <tr>
					   	 <th style="text-align: center; color: white; width: 1%" title="Chọn tất cả">
					   	 	<input id='checkAll' type="checkbox" value="">
					   	 </th>
					     <th style="text-align: center; color: white; width: 15%">
					   		<a href="showQuanLyNhanVienServlet?sapXep=1" title="Sắp xếp theo mã nhân viên"
					     	   style="color: white; text-decoration: none;">
					     		<b>Mã nhân viên</b>
					     	</a>
					     </th>
					     <th style="text-align: center; color: white; width: 34%">
					     	<a href="showQuanLyNhanVienServlet?sapXep=2" title="Sắp xếp theo tên nhân viên"
					     	   style="color: white; text-decoration: none;">
					     		<b>Tên nhân viên</b>
					     	</a>
					     </th>
					     <th style="text-align: center; color: white; width: 10%">
					     	<a href="showQuanLyNhanVienServlet?sapXep=3" title="Sắp xếp theo giới tính"
					     	   style="color: white; text-decoration: none;">
					     		<b>Giới tính</b>
					     	</a>
					     </th>
					     <th style="text-align: center; color: white; width: 20%">
					     	<a href="showQuanLyNhanVienServlet?sapXep=9" title="Sắp xếp theo chức vụ"
					     	   style="color: white; text-decoration: none;">
					     		<b>Chức vụ</b>
					     	</a>
					     </th>
					     <th style="text-align: center; color: white; width: 20%">
					     	<a href="showQuanLyNhanVienServlet?sapXep=8" title="Sắp xếp theo lương"
					     	   style="color: white; text-decoration: none;">
					     		<b>Lương</b>
					     	</a>
					     </th>
					   </tr>
					</thead>
					<tbody>
         	<%
		      	for(NhanVien s : listNhanVien){
		      		index++;
		      		String tam=Long.toString(((long)s.getLuongcoban()));
					String luong="";
					int d=tam.length()%3;
					for(int i=0;i<tam.length();i++){
						if((i+1)%3==d && i!=tam.length()-1) luong+=tam.charAt(i)+".";
						else luong+=tam.charAt(i);
					}
         	   %>						        		
						<tr class="zzBody">
						  <td style="text-align: center; border-top: 2px solid #dddddd;">
					   	 	<input id='<%=s.getManv()%>' type="checkbox" 
					   	 		   maNV="<%=s.getManv()%>" tenNV="<%=s.getTennv()%>" ngaySinh="<%=s.getNgaysinh()%>" luongCoBan="<%=luong%> VNĐ"
					   	 		   queQuan="<%=s.getQuequan()%>" cmnd="<%=s.getCmnd()%>" dienThoai="<%=s.getDienthoai()%>"   
					   	 		   <%if(s.getGioitinh()==0){%>gioiTinh="Nữ"<%}else{%>gioiTinh="Nam"<%}%>
					   	 		   chucVu="<%
								  	  switch(s.getChucvu()){
								  	  case 1: out.print("Quản lý bán hàng"); break;
								  	  case 2: out.print("Bếp trưởng"); break;
								  	  case 3: out.print("Bếp phó"); break;
								  	  case 4: out.print("Đầu bếp"); break;
								  	  case 5: out.print("Phụ bếp"); break;
								  	  case 6: out.print("Bồi bàn"); break;
								  	  case 7: out.print("Bảo vệ"); 
							  		}
						  			%>">
						  </td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getManv()%></td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getTennv()%></td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;">
						  	<%if(s.getGioitinh() == 0){out.print("Nữ");}else{out.print("Nam");}%>
						  </td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;">
						  	<%
						  		switch(s.getChucvu()){
						  		case 1: out.print("Quản lý bán hàng"); break;
						  		case 2: out.print("Bếp trưởng"); break;
						  		case 3: out.print("Bếp phó"); break;
						  		case 4: out.print("Đầu bếp"); break;
						  		case 5: out.print("Phụ bếp"); break;
						  		case 6: out.print("Bồi bàn"); break;
						  		case 7: out.print("Bảo vệ"); 
						  		}
						  	%>
						  </td>		              
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=luong%> VNĐ</td>							     
						</tr>  				    	
		 	  <%}//for
		 	  %>
		 	     	</tbody>
				</table>
						
						
		  		<div id="pageNavPosition" align="center" style="margin-top: 50px"></div>
		  		<!-- PAGING TABLE -->
				<script type="text/javascript">
					var pager = new Pager('table', 10);
					pager.init();
					pager.showPageNav('pager', 'pageNavPosition');
					pager.showPage(1);
				</script>
		  <%}else{
			  %><h3 style="font-size: 13px; color: red; text-align: center; margin-left: -20px">Hiện tại chưa có nhân viên nào!</h3><%	
		  }%>
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
       
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>