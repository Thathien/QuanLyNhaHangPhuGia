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
		
		$("#xemChiTiet").click(function () {
		  	if($(":checkbox:checked").length == 1){
		  		var madonhang=$(":checkbox:checked").eq(0).attr('id');		  		
		  		$('#madonhang').val($(":checkbox:checked").eq(0).val());		  		
		  		$("#chiTiet").click();
		  	}else{
		  		alert("Hãy chọn 1 đơn hàng bạn muốn xem!");
		  	}		  		
		});
		
		$("#deleteHoaDon").click(function () {
				var listHoaDon = "";
		  		
		  		for(var i=0; i<$(":checkbox:checked").length;i++){
		  			if($(":checkbox:checked").eq(i).attr('id') != "checkAll"){
		  				listHoaDon+=$(":checkbox:checked").eq(i).attr('id')+",";
		  			}
		  		}
		  		
			   	if($(":checkbox:checked").length != 0){		  
			   		var x = confirm("Bạn muốn xóa?");
			   		if(x){
			   			$.post("quanLyNhapHangServlet",{
				  			listHoaDon: listHoaDon,
				  			action: "delete"
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
			  		alert("Hãy chọn ít nhất 1 đơn hàng trước khi click xóa đơn hàng!");
			  	} 	  		
		});
		
		$("#addHoaDon").click(function () {
			$("#addHoaDonModal").modal("show");		  		
		});
		
		$('#add').click(function(){
			var tendonhang = $('#tenDonHang').val();
			var ngaynhap = $('#ngayNhap').val();
			var date = new Date(ngaynhap);
			var now = new Date();
			
			//alert((now.getTime()+25200000)+" vs "+date.getTime());
		 	if(!isValidString(tendonhang)){
				alert("Mô tả đơn hàng trống hoặc có ký tự không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)");
				$("#tenDonHang").focus();
			}else if(ngaynhap==""){
				alert("Bạn chưa chọn ngày nhập hàng!");
				$("#ngayNhap").focus();
			}else if (date.getFullYear() < 2019 || date.getTime() > (now.getTime()+25200000)){
				alert("Thời gian nhập hàng phải nằm trong khoảng từ ngày 01/01/2019 đến thời gian hiện tại!");
				$("#ngayNhap").focus();
			}else{					
		 	 	$.post("quanLyNhapHangServlet",{
		 	 		tendonhang: tendonhang,
		  			ngaythang: ngaynhap,
		  			action: "add"
			    }, function(message){
					if(message=="error"){
						alert('Có lỗi xảy ra, không thể thêm đơn hàng!');
					}else{
						$('#madonhang2').val(message);
						$('#showAdd').click();
					}
				}); 
			}
		});
		
		$("#updateHoaDon").click(function () {
		  	if($(":checkbox:checked").length == 1){
		  		$('#madonhang3').val($(":checkbox:checked").eq(0).attr('id'));
		  		$("#btnUpdate").click();
		  	}else{
		  		alert("Hãy chọn 1 đơn hàng trước khi click cập nhật!");
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
	
	<!-- Modal thêm đơn hàng -->
	<div id="addHoaDonModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 135px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Thêm đơn hàng</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 135px; border-radius: 0px">
		      	<div>
		      		<table class="table table-hover table-condensed" style="border: 0px; width: 380px">
						<tr>
						     <th style="text-align: right; color: white; width: 28%; background-color: rgb(44, 133, 216);">
						     	<b>Mô tả đơn hàng</b>
						     </th>
						     <td style="text-align: left; border-top: 2px solid #dddddd;">
							   	 <p style="color: red; margin-top: 0px"><input id="tenDonHang" type="text" placeholder="Mô tả các mặt hàng có trong đơn hàng" style="width: 250px;">*</p>
							 </td>
						</tr>
						<tr>
						     <th style="text-align: right; color: white; width: 28%; background-color: rgb(44, 133, 216);">
						     	<b>Ngày nhập</b>
						     </th>
						     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
							   	 <p style="color: red; margin-top: 0px"><input id="ngayNhap" type="date" required style="width: 250px;">*</p>
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
	
	<!-- Form Xem chi tiết -->
	<form action="quanLyNhapHangServlet" method="post" style="display: none">
		<input type=submit id=chiTiet>
		<input type="hidden" name=action value="xemChiTiet">
		<input type=hidden name="madonhang" id=madonhang value="">
	</form>
	
	<!-- Form Thêm đơn hàng -->
	<form action="quanLyNhapHangServlet" method="post" style="display: none">
		<input type=submit id=showAdd>
		<input type="hidden" name=action value="showAdd">
		<input type=hidden name="madonhang2" id=madonhang2 value="">
	</form>
	
	<!-- Form cập nhật -->
	<form action="quanLyNhapHangServlet" method="post" style="display: none">
		<input type=submit id=btnUpdate>
		<input type="hidden" name=action value="showUpdate">
		<input type=hidden name="madonhang3" id=madonhang3 value="">
	</form>
	
	<!-- Refresh -->
	<form id="refreshForm" method="post" action="showQuanLyNhapHangServlet" style="display: none">
		<input type="submit" id="refresh">
	</form>	
	
	<header style="top: 0px;">
		<div id="headerWrapper">
			<div id="headerCenter">
				<div id="headerTitles">
					<h1><a href="homePageAdmin.jsp">NHÀ HÀNG PHÚ GIA</a></h1>
		   			<h2>Đ/C: LỘC TIẾN,PHÚ LỘC, THỪA THIÊN HUẾ</h2>
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
            	    <a class="groupTitle" href="showQuanLyNhapHangServlet" style="margin-top: 0px; display: block; opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">QUẢN LÝ NHẬP HÀNG</h3>
	       		    </a>
            	</div>
            	
            	<div id="divLeft">
            		<a id="xemChiTiet" class="tile" style="padding: 10px 15px; background-color: rgb(2, 176, 192);
	        		   margin-top: 0px; width: 100px; text-align: center;">
						Xem chi tiết			
					</a>	        		
	        		<a id="addHoaDon" class="tile" style="padding: 10px 15px; background-color: rgb(73, 62, 197);
	        		   margin-top: 50px; width: 100px; text-align: center;">
						Thêm đơn hàng			
					</a>
					<a id="updateHoaDon" class="tile" style="padding: 10px 15px; background-color: rgb(14, 196, 101);
	        		   margin-top: 100px; width: 100px; text-align: center;">
						Cập nhật			
					</a>	
					<a id="deleteHoaDon" class="tile" style="padding: 10px 15px; background-color: rgb(238, 78, 78);
	        		   margin-top: 150px; width: 100px; text-align: center;">
						Xóa đơn hàng			
					</a>
        		</div>
        		
        		<div id="divContent">        		
         <%
         	ArrayList<HoaDon> listHoaDon = (ArrayList<HoaDon>) request.getAttribute("listHoaDon");
         	if(listHoaDon != null){
         		if(listHoaDon.size() != 0){
	         	%>
					
					<table id='table' class="table table-hover table-condensed" style="border: 0px">
						<thead style="background-color: rgb(44, 133, 216);">
						   <tr>
						   	 <th style="text-align: center; color: white; width: 5%" title="Chọn tất cả">
						   	 	<input id='checkAll' type="checkbox" value="">
						   	 </th>
						     <th style="text-align: center; color: white; width: 25%"><b>Mã đơn hàng</b></th>
						     <th style="text-align: center; color: white; width: 45%"><b>Mô tả đơn hàng</b></th>
						     <th style="text-align: center; color: white; width: 25%" title="Thời gian nhập hàng">
						     	<b>Ngày nhập</b>
						     </th>
						   </tr>
						</thead>
						<tbody>
	         	<%
			      	for(HoaDon s : listHoaDon){
	         	   %>						        		
							<tr class="zzBody">
							  <td style="text-align: center; border-top: 2px solid #dddddd;">
						   	 	<input id='<%=s.getMadonhang()%>' type="checkbox" value="<%=s.getMadonhang()%>">
							  </td>
							  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getMadonhang()%></td>
							  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getTendonhang()%></td>	
							  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getNgaynhap()%></td>		              
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
				  %><h3 style="font-size: 13px; color: red; text-align: center; margin-left: -20px">Hiện tại chưa có đơn hàng nào!</h3><%	
			  	}
         	}%>
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
       
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>