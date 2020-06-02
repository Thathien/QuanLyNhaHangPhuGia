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
	
	function isValidString(v){
		var kt=0;
		for(var i=0;i<v.length;i++){
			if (v[i]!=" ") kt=1;
		}
		return (v.search(/[<]|[>]|[#]/ig) == -1) && (v.length>4) && (v.length<51) && (kt==1);
	};
	
	$(document).ready(function() {
		
		$("#deleteTaiKhoan").click(function () {
				var listUser = "";
		  		
		  		for(var i=0; i<$(":checkbox:checked").length;i++){
		  			listUser+=$(":checkbox:checked").eq(i).attr('id')+",";
		  		}
		  		
			   	if($(":checkbox:checked").length != 0){		  
			   		var x = confirm("Bạn muốn xóa?");
			   		if(x){
			   			$.post("thietLapTaiKhoanServlet",{
				  			listUser: listUser,
				  			action: "delete"
					    }, function(message){
							if(message == "error"){
								alert('Có lỗi xảy ra, không thể xóa!');
							}else if(message == "chunhahang"){
								alert('Không thể xóa tài khoản quyền quản trị: chunhahang');
							}else{
								alert('Xóa thành công!');
								$("#refresh").click();
							}
		  			    });
			   		}else{
			   			return false;
			   		}
			  		
			  	}else{
			  		alert("Hãy chọn ít nhất 1 tài khoản trước khi click xóa tài khoản!");
			  	} 	  		
		});
		
		$("#addTaiKhoan").click(function () {
			$("#addTaiKhoanModal").modal("show");		  		
		});
		
		$('#add').click(function(){
			var tenTaiKhoan = $('#tenTaiKhoan').val();
			var matKhau = $('#matKhau').val();
			var nhapLaiMatKhau = $('#nhapLaiMatKhau').val();
			var phanQuyen = $('#phanQuyen').val();
			
		 	if(!isValidString(tenTaiKhoan)){
				alert("Tên tài khoản trống hoặc có ký tự không hợp lệ!\n- Tối thiểu 5 ký tự.\n- Tối đa 50 ký tự.\n- Chỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.).");
				$("#tenTaiKhoan").focus();
			}else if(!isValidString(matKhau)){
				alert("Mật khẩu trống hoặc có ký tự không hợp lệ!\n- Tối thiểu 5 ký tự.\n- Tối đa 50 ký tự.\n- Chỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.).");
				$("#matKhau").focus();
			}else if (matKhau != nhapLaiMatKhau){
				alert("Mật khẩu nhập lại không khớp!");
				$("#nhapLaiMatKhau").focus();
			}else if (phanQuyen == 0){
				alert("Bạn chưa chọn quyền!");
				$("#phanQuyen").focus();
			}else{		
		 	 	$.post("thietLapTaiKhoanServlet",{
		 	 		tenTaiKhoan: tenTaiKhoan,
		 	 		matKhau: matKhau,
		 	 		phanQuyen: phanQuyen,
		  			action: "add"
			    }, function(message){
					if(message=="error"){
						alert('Có lỗi xảy ra, không thể thêm tài khoản!');
					}else if(message=="same"){
						alert('Tên tài khoản này đã được sử dụng!');
					}else{
						alert('Thêm tài khoản thành công!');
						$('#refresh').click();
					}
				}); 
			}
		});
		
		$("#changeMatKhau").click(function () {
		  	if($(":checkbox:checked").length == 1){
		  		$('#tenTaiKhoan2').val($(":checkbox:checked").eq(0).attr('id'));
		  		$("#changeMatKhauModal").modal("show");	
		  	}else{
		  		alert("Hãy chọn 1 tài khoản trước khi click đổi mật khẩu!");
		  	}		  		
		});
		
		$('#change').click(function(){
			var tenTaiKhoan = $('#tenTaiKhoan2').val();
			var matKhauHienTai = $('#matKhauHienTai').val();
			var matKhauMoi = $('#matKhauMoi').val();
			var nhapLaiMatKhauMoi = $('#nhapLaiMatKhauMoi').val();
			
			if(!isValidString(matKhauHienTai)){
				alert("Mật khẩu hiện tại không đúng!");
				$("#matKhauHienTai").focus();
			}else if (!isValidString(matKhauMoi)){
				alert("Mật khẩu mới trống hoặc có ký tự không hợp lệ!\n- Tối thiểu 5 ký tự.\n- Tối đa 50 ký tự.\n- Chỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.).");
				$("#matKhauMoi").focus();
			}else if (matKhauMoi != nhapLaiMatKhauMoi){
				alert("Mật khẩu nhập lại không khớp!");
				$("#nhapLaiMatKhauMoi").focus();
			}else{
				$.post("thietLapTaiKhoanServlet",{
		 	 		tenTaiKhoan: tenTaiKhoan,
		 	 		matKhauHienTai: matKhauHienTai,
		 	 		matKhauMoi: matKhauMoi,
		  			action: "change"
			    }, function(message){
					if(message=="error"){
						alert('Có lỗi xảy ra, không thể thay đổi mật khẩu!');
					}else if(message=="wrong"){
						alert("Mật khẩu cũ nhập vào không đúng!");
					}else{
						alert('Thay đổi mật khẩu thành công!');
						$('#refresh').click();
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
</style> 


<title>Thiết lập tài khoản</title>
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
	
	<!-- Modal thêm tài khoản -->
	<div id="addTaiKhoanModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 135px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Thêm tài khoản</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 215px; border-radius: 0px">
		      	<div>
		      		<table class="table table-hover table-condensed" style="border: 0px; width: 380px">
						<tr>
						     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
						     	<b>Tên tài khoản</b>
						     </th>
						     <td style="text-align: left; border-top: 2px solid #dddddd;">
							   	 <p style="color: red; margin-top: 0px"><input id="tenTaiKhoan" type="text" placeholder="Độ dài từ 5 đến 50 ký tự" style="width: 200px;">*</p>
							 </td>
						</tr>
						<tr>
						     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
						     	<b>Mật khẩu</b>
						     </th>
						     <td style="text-align: left; border-top: 2px solid #dddddd;">
							   	 <p style="color: red; margin-top: 0px"><input id="matKhau" type="password" placeholder="Độ dài từ 5 đến 50 ký tự" style="width: 200px;">*</p>
							 </td>
						</tr>
						<tr>
						     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
						     	<b>Nhập lại mật khẩu</b>
						     </th>
						     <td style="text-align: left; border-top: 2px solid #dddddd;">
							   	 <p style="color: red; margin-top: 0px"><input id="nhapLaiMatKhau" type="password" placeholder="Nhập lại mật khẩu" style="width: 200px;">*</p>
							 </td>
						</tr>
						<tr>
						     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
						     	<b>Phân quyền</b>
						     </th>
						     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
							   	 <p style="color: red; margin-top: 0px">
							   	 	<select id="phanQuyen">
							   	 		<option value=0>----------- Chọn quyền -----------</option>
							   	 		<option value=1>Chủ nhà hàng</option>
							   	 		<option value=2>Quản lý bán hàng</option>
							   	 		<option value=3>Đầu bếp</option>
							   	 		<option value=4>Khách hàng</option>
							   	 	</select>*</p>
							 </td>
						</tr>
			      	</table>
		      	</div>		      	
		      	
		      	<div style="float: right; margin-top: 5px">
		      		<input id="add" class="btn btn-primary" type="button" value="Thêm" style="padding: 7px 15px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Hủy</button>
		      	</div>		      
		      </div>
		    </div>
		</div>
	</div>
	
	<!-- Modal đổi mật khẩu -->
	<div id="changeMatKhauModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 135px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Đổi mật khẩu</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 215px; border-radius: 0px">
		      	<div>
		      		<table class="table table-hover table-condensed" style="border: 0px; width: 380px">
						<tr>
						     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
						     	<b>Tên tài khoản</b>
						     </th>
						     <td style="text-align: left; border-top: 2px solid #dddddd;">
							   	 <input id="tenTaiKhoan2" value="" readonly="readonly" type="text" style="width: 200px;">
							 </td>
						</tr>
						<tr>
						     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
						     	<b>Mật khẩu hiện tại</b>
						     </th>
						     <td style="text-align: left; border-top: 2px solid #dddddd;">
							   	 <p style="color: red; margin-top: 0px"><input id="matKhauHienTai" type="password" placeholder="Mật khẩu hiện tại" style="width: 200px;">*</p>
							 </td>
						</tr>
						<tr>
						     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
						     	<b>Mật khẩu mới</b>
						     </th>
						     <td style="text-align: left; border-top: 2px solid #dddddd;">
							   	 <p style="color: red; margin-top: 0px"><input id="matKhauMoi" type="password" placeholder="Mật khẩu mới" style="width: 200px;">*</p>
							 </td>
						</tr>
						<tr>
						     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
						     	<b>Nhập lại mật khẩu</b>
						     </th>
						     <td style="text-align: left; border-top: 2px solid #dddddd;">
							   	 <p style="color: red; margin-top: 0px"><input id="nhapLaiMatKhauMoi" type="password" placeholder="Nhập lại mật khẩu" style="width: 200px;">*</p>
							 </td>
						</tr>
			      	</table>
		      	</div>		      	
		      	
		      	<div style="float: right; margin-top: 5px">
		      		<input id="change" class="btn btn-primary" type="button" value="Đồng ý" style="padding: 7px 15px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Hủy</button>
		      	</div>		      
		      </div>
		    </div>
		</div>
	</div>
	
	<!-- Refresh -->
	<form id="refreshForm" method="post" action="showThietLapTaiKhoanServlet" style="display: none">
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
            	    <a class="groupTitle" href="showThietLapTaiKhoanServlet" style="margin-top: 0px; display: block; opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">THIẾT LẬP TÀI KHOẢN</h3>
	       		    </a>
            	</div>
            	
            	<div id="divLeft">        		
	        		<a id="addTaiKhoan" class="tile" style="padding: 10px 15px; background-color: rgb(73, 62, 197);
	        		   margin-top: 0px; width: 100px; text-align: center;">
						Thêm tài khoản			
					</a>
					<a id="changeMatKhau" class="tile" style="padding: 10px 15px; background-color: rgb(14, 196, 101);
	        		   margin-top: 50px; width: 100px; text-align: center;">
						Đổi mật khẩu			
					</a>	
					<a id="deleteTaiKhoan" class="tile" style="padding: 10px 15px; background-color: rgb(238, 78, 78);
	        		   margin-top: 100px; width: 100px; text-align: center;">
						Xóa tài khoản			
					</a>
        		</div>
        		
        		<div id="divContent">        		
         <%
         	ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
         	if(listUser != null){
	         	%>
					
					<table id='table' class="table table-hover table-condensed" style="border: 0px">
						<thead style="background-color: rgb(44, 133, 216);">
						   <tr>
						   	 <th style="text-align: center; color: white; width: 5%"></th>
						   	 <th style="text-align: center; color: white; width: 10%"><b>#</b></th>
						     <th style="text-align: center; color: white; width: 50%"><b>Tên tài khoản</b></th>
						     <th style="text-align: center; color: white; width: 35%"><b>Phân quyền</b></th>
						   </tr>
						</thead>
						<tbody>
	         	<%
	         		int index=0;
			      	for(User s : listUser){
			      		index++;
			      		if("chunhahang".equals(s.getUserName())){
			      		%>						        		
							<tr class="zzBody">
							  <td style="text-align: center; border-top: 2px solid #dddddd; color: red;">
							  	 <input id='<%=s.getUserName()%>' type="checkbox" value="<%=s.getUserName()%>">
							  </td>
							  <td style="text-align: center; border-top: 2px solid #dddddd; color: red;"><%=index%></td>
							  <td style="text-align: center; border-top: 2px solid #dddddd; color: red;"><%=s.getUserName()%></td>	 
							  <td style="text-align: center; border-top: 2px solid #dddddd; color: red;">
								  	<%
								  		switch(s.getQuyen()){
								  		case 1: out.print("Chủ nhà hàng"); break;
								  		case 2: out.print("Quản lý bán hàng"); break;
								  		case 3: out.print("Đầu bếp"); break;
								  		case 4: out.print("Khách hàng");
								  		}							  		
								  	%>
							  </td>	              
							</tr>			    	
				 	  <%
			      		}else{
	         	   %>						        		
							<tr class="zzBody">
							  <td style="text-align: center; border-top: 2px solid #dddddd;">
						   	 	<input id='<%=s.getUserName()%>' type="checkbox" value="<%=s.getUserName()%>">
							  </td>
							  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=index%></td>
							  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getUserName()%></td>	 
							  <td style="text-align: center; border-top: 2px solid #dddddd;">
							  	<%
							  		switch(s.getQuyen()){
							  		case 1: out.print("Chủ nhà hàng"); break;
							  		case 2: out.print("Quản lý bán hàng"); break;
							  		case 3: out.print("Đầu bếp"); break;
							  		case 4: out.print("Khách hàng");
							  		}							  		
							  	%>
							  </td>	              
							</tr>			    	
			 	  <%	}
			      	}//for
			 	  %>
			 	     	</tbody>
					</table>
			  <%}%>
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
       
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>