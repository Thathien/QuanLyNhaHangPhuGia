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
	function xacNhanXoa(){
		return confirm("Bạn muốn xóa");
	}
	function isValidString(v){
		var kt=0;
		for(var i=0;i<v.length;i++){
			if (v[i]!=" ") kt=1;
		}
		return (v.search(/[<]|[>]|[#]/ig) == -1) && (v.length>0) && (kt==1);
	};
	
	$(document).ready(function() {
		$("#updateEventModal").modal("show");
		
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
		  		$('#noiDung').text($(":checkbox:checked").eq(0).val());		  		
		  		$("#xemChiTietModal").modal("show");
		  	}else{
		  		alert("Hãy chọn 1 sự kiện bạn muốn xem!");
		  	}		  		
		});
		
		$("#deleteEvent").click(function () {
				var listEvent = "";
		  		
		  		for(var i=0; i<$(":checkbox:checked").length;i++){
		  			if($(":checkbox:checked").eq(i).attr('id') != "checkAll"){
		  				listEvent+=$(":checkbox:checked").eq(i).attr('id')+",";
		  			}
		  		}
		  		
			  	if($(":checkbox:checked").length != 0){		  
			  		var x = confirm("Bạn muốn xóa?");
			  		if(x){
			  			$.post("quanLySuKienServlet",{
				  			listEvent: listEvent,
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
			  		alert("Hãy chọn ít nhất 1 sự kiện trước khi click xóa sự kiện!");
			  	}		  		
			
		});
		
		$("#addEvent").click(function () {
			$("#addEventModal").modal("show");		  		
		});
		
		$('#add').click(function(){
			var noidung = $('#noidung').val();
			
			if(!isValidString(noidung)){
				alert("Nội dung trống hoặc có ký tự không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)");
				$("#noidung").focus();
			}else{			
		 		$.post("quanLySuKienServlet",{
		  			noidung: noidung,
		  			hienthi: $('#hienthi').val(),
		  			action: "add"
			    }, function(message){
			    	if(message=="error"){
						alert('Có lỗi xảy ra, không thể thêm sự kiện!');
					}else if(message=="same"){
						alert('Sự kiện này đã được thêm vào CSDL không thể thêm lần 2!');
					}else{
						alert('Đã thêm thành công!');
						$("#refresh").click();
					}
				});
			}
		});
		
		$("#updateEvent").click(function () {
		  	if($(":checkbox:checked").length == 1){
		  		$('#stt').val($(":checkbox:checked").eq(0).attr('id'));
		  		$("#update").click();
		  	}else{
		  		alert("Hãy chọn 1 sự kiện trước khi click cập nhật!");
		  	}		  		
		});
		
		$('#updateButton').click(function(){
			var noidung2 = $('#noidung2').val();
			
			if(!isValidString(noidung2)){
				alert("Nội dung trống hoặc có ký tự không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)");
				$("#noidung2").focus();
			}else{			
		 		$.post("quanLySuKienServlet",{
		  			noidung2: noidung2,
		  			hienthi2: $('#hienthi2').val(),
		  			stt2: $('#stt2').val(),
		  			action: "update"
			    }, function(message){
					if(message!="ok"){
						alert('Có lỗi xảy ra, không thể cập nhật sự kiện!');
					}else{
						alert('Cập nhật thành công!');
						$("#refresh").click();
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
.modal.fade.in {
	top: 12%;
}
</style> 


<title>Quản lý sự kiện</title>
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

	<!-- Modal Xem chi tiết sự kiện -->
	<div id="xemChiTietModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 215px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Chi tiết sự kiện</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 88px;">
		      	<div>
		      		<textarea id="noiDung" rows="5" style="width: 350px; margin-left: 20px; margin-right: 30;" disabled="disabled"></textarea>
		      	</div>		      	
		      	
		      	<div style="float: right; margin-top: 12px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Đóng</button>
		      	</div>		      
		      </div>
		    </div>
		</div>
	</div>
	
	<!-- Modal thêm sự kiện -->
	<div id="addEventModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 215px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Thêm sự kiện</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 170px; border-radius: 0px">
		      	<div>
		      		<textarea id="noidung" placeholder="Nhập nội dung sự kiện" 
		      				  rows="5" style="width: 350px; margin-left: 20px; margin-right: 30;"></textarea>
		      	</div>		      	
		      	<div style="float: left; margin-left: 17px;">
		      		<!-- <input type="checkbox" id="hienthiCheckbox" checked="checked"> -->
		      		<select id="hienthi">
		      			<option value="1">Có</option>
		      			<option value="0">Không</option>
		      		</select>
		      		hiển thị thông báo đến khách hàng
		      	</div>
		      	
		      	<div style="float: right; margin-top: 5px">
		      		<input id="add" class="btn btn-primary" type="button" value="Thêm" style="padding: 7px 15px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Hủy</button>
		      	</div>		      
		      </div>
		    </div>
		</div>
	</div>
	
	<%
		SuKien event = (SuKien) request.getAttribute("event");
	%>
	<!-- Modal update sự kiện -->
	<div id="updateEventModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 215px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Cập nhật sự kiện</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 170px; border-radius: 0px">
		      	<div>
		      		<textarea id="noidung2" placeholder="Nhập nội dung sự kiện" 
		      				  rows="5" style="width: 350px; margin-left: 20px; margin-right: 30;"><%=event.getNoidung()%></textarea>
		      	</div>		      	
		      	<div style="float: left; margin-left: 17px;">
		      		<input type="hidden" id=stt2 value="<%=event.getStt()%>">
		      		<!-- <input type="checkbox" id="hienthiCheckbox" checked="checked"> -->
		      		<select id="hienthi2">
		      			<%
		      				if(event.getHienthi() == 1){
		      				%>
		      					<option value="1">Có</option>
		      					<option value="0">Không</option>
		      				<%
		      				}else{
		      				%>
		      					<option value="0">Không</option>
		      					<option value="1">Có</option>
		      				<%
		      				}
		      			%>
		      		</select>
		      		hiển thị thông báo đến khách hàng
		      	</div>
		      	
		      	<div style="float: right; margin-top: 5px">
		      		<input id="updateButton" class="btn btn-primary" type="button" value="Cập nhật" style="padding: 7px 15px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Hủy</button>
		      	</div>		      
		      </div>
		    </div>
		</div>
	</div>
	
	<!-- UpdateEvent Form -->
	<form action="quanLySuKienServlet" method="post" style="display: none">
		<input type=submit id=update>
		<input type="hidden" name=action value="showUpdate">
		<input type=hidden name="stt" id=stt value="">
	</form>
	
	<!-- Refresh -->
	<form id="refreshForm" method="post" action="showQuanLySuKienServlet" style="display: none">
		<input type="submit" id="refresh">
	</form>	
	
	<header style="top: 0px;">
		<div id="headerWrapper">
			<div id="headerCenter">
				<div id="headerTitles">
					<h1><a href="homePageAdmin.jsp">NHÀ HÀNG PHÚ GIA</a></h1>
		   			<h2>Đ/C: LỘC TIẾN ,PHÚ LỘC,THỪA THIÊN HUẾ</h2>
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
            	    <a class="groupTitle" href="showQuanLySuKienServlet" style="margin-top: 0px; display: block; opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">QUẢN LÝ SỰ KIỆN</h3>
	       		    </a>
            	</div>
            	
            	<div id="divLeft">
            		<a id="xemChiTiet" class="tile" style="padding: 10px 15px; background-color: rgb(2, 176, 192);
	        		   margin-top: 0px; width: 100px; text-align: center;">
						Xem chi tiết			
					</a>	        		
	        		<a id="addEvent" class="tile" style="padding: 10px 15px; background-color: rgb(73, 62, 197);
	        		   margin-top: 50px; width: 100px; text-align: center;">
						Thêm sự kiện			
					</a>
					<a id="updateEvent" class="tile" style="padding: 10px 15px; background-color: rgb(14, 196, 101);
					   margin-top: 100px; width: 100px; text-align: center;">
						Cập nhật		
					</a>	
					<a id="deleteEvent" class="tile" style="padding: 10px 15px; background-color: rgb(238, 78, 78);
	        		   margin-top: 150px; width: 100px; text-align: center;" onclick="return xacNhanXoa()">
						Xóa sự kiện				
					</a>
        		</div>
        		
        		<div id="divContent">        		
         <%
        	int index=0;
         	ArrayList<SuKien> listEvent = (ArrayList<SuKien>) request.getAttribute("listEvent");
         	if(listEvent.size() != 0){
         	%>
				
				<table id='table' class="table table-hover table-condensed" style="border: 0px">
					<thead style="background-color: rgb(44, 133, 216);">
					   <tr>
					   	 <th style="text-align: center; color: white; width: 5%" title="Chọn tất cả">
					   	 	<input id='checkAll' type="checkbox" value="">
					   	 </th>
					     <th style="text-align: center; color: white; width: 5%"><b>#</b></th>
					     <th style="text-align: center; color: white; width: 55%"><b>Nội dung</b></th>
					     <th style="text-align: center; color: white; width: 20%" title="Thời gian quản lý thêm hoặc cập nhật sự kiện">
					     	<b>Thời gian</b>
					     </th>
					     <th style="text-align: center; color: white; width: 15%" title="Hiển thị trên giao diện gọi món của khách hàng">
					     	<b>Hiển thị</b>
					     </th>
					   </tr>
					</thead>
					<tbody>
         	<%
		      	for(SuKien s : listEvent){
		      		index++;
         	   %>						        		
						<tr class="zzBody">
						  <td style="text-align: center; border-top: 2px solid #dddddd;">
					   	 	<input id='<%=s.getStt()%>' type="checkbox" value="<%=s.getNoidung()%>">
						  </td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=index%></td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;">
						 	<%=s.getNoidung().length() >=51 ? s.getNoidung().substring(0,50)+"..." : s.getNoidung()%>
						  </td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getNgaythang()%></td>	
						  <td style="text-align: center; border-top: 2px solid #dddddd;">
						  	<%if(s.getHienthi() == 1){out.print("Có");}else{out.print("Không");}%>
						  </td>		              
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
			  %><h3 style="font-size: 13px; color: red; text-align: center; margin-left: -20px">Hiện tại chưa có sự kiện nào!</h3><%	
		  }%>
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
       
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>