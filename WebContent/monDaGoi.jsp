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
<script type="text/javascript" src="./admin/js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="./admin/js/bootstrap.js"></script>
<link href="./admin/css/responsive.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function isValidString(v){
		var kt=0;
		for(var i=0;i<v.length;i++){
			if (v[i]!=" ") kt=1;
		}
		return (v.search(/[<]|[>]|[#]|[-]/ig) == -1) && (v.length>0) && (kt==1);
	};
	
	function regIsDigit(fData)
	{
		   var reg = new RegExp("^[0-9]*[0-9]?$");
		   return (reg.test(fData));
	}
	
	$(document).ready(function() {
		
		$('.listFoodCalledBar').find('button').click(function() {
			var stt = $(this).val();
			var id = $(this).attr("id");
			//alert("Check: "+id+"  "+stt);
			
			if(id == "deleteId"){
				var x = confirm("Bạn muốn xóa món ăn này?");
				if(x){
					$.post("deleteFoodCallServlet",{
						stt: stt,
					}, function(message){
						if(message!="ok"){
							alert('Món ăn này đã được chế biến, không thể xóa!');
							$("#refresh").click();
						}else{
							alert('Xóa món ăn thành công!');
							$("#refresh").click();
						}
					});
				}else{
					return false;
				}
				
			}else{
				var soLuong = $(this).attr("soLuong");
				var soLuongCheBien = $(this).attr("soLuongCheBien");
				var tenMon = $(this).attr("tenMon");
				var soBan = $(this).attr("soBan");
				
				$("#sttModal").val(stt);
				$("#soBan").val(soBan);
				$("#tenMonModal").text(tenMon);
				$("#soLuongModal").text(soLuongCheBien+" / "+soLuong);
				$("#updateModal").modal("show");		
			}
		});
		
		$("#updateBtn").click(function(){
			var soLuong = $('#soLuongUpdateModal').val()*1;
			if(soLuong>=100){
				alert('Số lượng nhập vào không hợp lệ!\nSố lượng tối thiểu: 1\nSố lượng tối đa: 99');
			}else if( !regIsDigit($('#soLuongUpdateModal').val()) || $('#soLuongUpdateModal').val()==0){
					  alert('Số lượng nhập vào không hợp lệ!\nSố lượng tối thiểu: 1\nSố lượng tối đa: 99');
				  }else{
					  $("#formUpdateFood").submit();
				  }
		});
		
		$('#baoThanhToan').click(function(){

			$.post("baoThanhToanServlet",{
				tableNumber: $('#tableNumber').val(),
			}, function(message){
				if(message!="ok"){
					alert('Bạn chưa dùng món ăn nào, không thể báo thanh toán!');
					$("#refresh").click();
				}else{
					alert('Yêu cầu thanh toán đã được gửi đến quản lý!\nRất hân hạnh được phục vụ quý khách.');
					$("#refresh").click();
				}
			});			
		});
		
		$('#goiPhucVu').click(function(){

			$.post("goiPhucVuServlet",{
				tableNumber: $('#tableNumber').val(),
			}, function(message){
				if(message!="ok"){
					alert('Có lỗi xảy ra không thể gọi phục vụ!');
					$("#refresh").click();
				}else{
					alert('Yêu cầu đã được gửi đến quản lý!');
					$("#refresh").click();
				}
			});			
		});
		
		$('#gopY').click(function(){
			$("#feedBackModal").modal("show");	
		});
		
		$('#send').click(function(){
			var feedBack = $('#feedBack').val();
			if(!isValidString(feedBack)){
				alert("Nội dung trống hoặc có ký tự không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)");
			}else{
				$.post("feedBackServlet",{
					feedBack: feedBack,
				}, function(message){
					if(message!="ok"){
						alert('Có lỗi xảy ra, không thể gửi góp ý!');
						$("#refresh").click();
					}else{
						alert('Góp ý của quý khách đã được gửi đến quản lý.\nCảm ơn đóng góp của quý khách.');
						$("#refresh").click();
					}
				});
			}
			
		});
		
		$('#guiYeuCau').click(function(){
			$("#guiYeuCauModal").modal("show");	
		});
		
		$('#sendYeuCau').click(function(){
			var noiDungYeuCau = $('#noiDungYeuCau').val();
			
			if(!isValidString(noiDungYeuCau)){
				alert("Nội dung trống hoặc có ký tự không hợp lệ!\nChỉ cho phép các ký tự (a-z,A-Z,0-9,-,_,.)");
			}else{
				$.post("guiYeuCauServlet",{
					noiDungYeuCau: noiDungYeuCau,
					tableNumber: $('#tableNumber').val(),
				}, function(message){
					if(message!="ok"){
						alert('Có lỗi xảy ra, không thể gửi yêu cầu!');
						$("#refresh").click();
					}else{
						alert('Yêu cầu của quý khách đã được gửi đến bộ phận đầu bếp!');
						$("#refresh").click();
					}
				});
			}
			
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
	});

	//Tự động tải lại trang sau 40s
	window.onload = function() {
	   setInterval(
	       function(){
	        	$("#refresh").click();
	       },
	       40000
	   );
	};
	
	function xacNhan(){
		return confirm("Bạn muốn đăng xuất?\n\nLưu ý: \n   - Quý khách vui lòng không dùng chức năng này.\n   - Liên hệ với quản lý nhà hàng nếu lỡ đăng xuất.");
	}
	
</script>

<style>

.left-col{
	background : #0A99D1;
}
html,body{
	background:#F8F8F8  repeat fixed !important; /* Main background color */}
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

.btnXoa{	
	border: none;
	background: url(./admin/img/btnDelete.png) no-repeat center center;
	height: 20px;
	width: 20px;
	position: relative;
	opacity: 0.8;
}

.btnXoa:HOVER{	
	opacity: 1;
}

.btnUpdate{	
	border: none;
	background: url(./admin/img/btnUpdate.png) no-repeat center center;
	height: 20px;
	width: 20px;
	position: relative;
	opacity: 0.8;
}

.btnUpdate:HOVER{	
	opacity: 1;
}
</style>
<title>Món đã gọi</title>
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
	
	<!-- Modal Feedback -->
	<div id="feedBackModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 215px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Góp ý</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 88px;">
		      	<div>
		      		<textarea id="feedBack" rows="5" placeholder="Nhập ý kiến đóng góp của quý khách" 
		      				  style="width: 350px; margin-left: 20px; margin-right: 30;"></textarea>
		      	</div>		      	
		      	
		      	<div style="float: right; margin-top: 12px">
		      		<input id="send" class="btn btn-primary" type="button" value="Gửi" style="padding: 7px 15px">
		      	</div>		      
		      </div>
		    </div>
		</div>
	</div>
	
	<!-- Modal gửi yêu cầu đến bộ phận đầu bếp -->
	<div id="guiYeuCauModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 215px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Yêu cầu thêm về món ăn</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 88px;">
		      	<div>
		      		<textarea id="noiDungYeuCau" rows="5" placeholder="Nhập yêu cầu thêm về món ăn của quý khách" 
		      				  style="width: 350px; margin-left: 20px; margin-right: 30;"></textarea>
		      	</div>		      	
		      	
		      	<div style="float: right; margin-top: 12px">
		      		<input id="sendYeuCau" class="btn btn-primary" type="button" value="Gửi" style="padding: 7px 15px">
		      	</div>		      
		      </div>
		    </div>
		</div>
	</div>
	
	<!-- Modal update -->
	<div id="updateModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 215px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Cập nhật số lượng món ăn</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 175px; border-radius: 0px;">
		      	<div>
		      		<form id="formUpdateFood" action="updateCallFoodServlet" method="post">
						<input type="hidden" id="soBan" name="soBan" value="">
		      			<input type="hidden" name="actor" value="guest">
		      			<input type="hidden" id="sttModal" name="stt" value="">
			      		<table class="table table-hover table-condensed" style="border: 0px; width: 380px; border-spacing: 0">
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Tên món ăn</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								   	 <p id=tenMonModal style="margin-top: 0px"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);" 
							     	 title="Số lượng đang chế biến / Số lượng yêu cầu">
							     	<b>Số lượng hiện tại</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;" title="Số lượng đang chế biến / Số lượng yêu cầu">
								   	 <p id="soLuongModal" style="margin-top: 0px"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 35%; background-color: rgb(44, 133, 216);">
							     	<b>Số lượng thay đổi</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
								   <input id="soLuongUpdateModal" name="soLuong" type="number" min=1 max=99 placeholder="Số lượng" style="width: 100px;">								     	
								 </td>
							</tr>
				      	</table>
				     </form>
		      	</div>		      	
		      	
		      	<div style="float: right;">
		      		<input id="updateBtn" class="btn btn-primary" type="button" value="Cập nhật" style="padding: 7px 15px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px; margin-left: 0px">Hủy</button>
		      	</div>		      
		      </div>
		    </div>
		</div>
	</div>
	
	<%
		String message= (String) request.getAttribute("message");
		if("wrong".equals(message)){
	%>
		<script type="text/javascript">
			alert('Không thể cập nhật!\nSố lượng yêu cầu không được bé hơn số lượng đang chế biến.');
		</script>
	<%		
		}else if("error".equals(message)){
	%>
		<script type="text/javascript">
			alert('Nhà hàng đã ngưng phục vụ món ăn này.\nKhông thể gọi thêm!');
		</script>
	<%
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
					<input type="hidden" id="tableNumber" value="<%=tableNumberSession%>">
					<h1 style="margin-top: 0px; margin-bottom: 0px;"><a href="showGoiMonServlet">NHÀ HÀNG PHÚ GIA</a></h1>
		    		<a href="showDangNhapServlet" class="tile" style="right: 15px; height: 32px; width: 32px" onclick="return xacNhan();">
						<img src="./admin/img/logout.ico" title="Đăng xuất" style="background-color: #0A99D1; margin-bottom: 0px">					
					</a>
					<!-- <a href="showChonBanGuestServlet" class="tile" style="right: 52px; height: 32px; width: 32px">
						<img src="./admin/img/chonBan.png" title="Chọn bàn" style="background-color: #0A99D1; margin-bottom: 0px">					
					</a> -->
		    	</div>
		    	<nav style="float: inherit;">
            		<a class="" href="showGoiMonServlet">
						Thực đơn
					</a>
					<a class="active" href="showMonDaGoiServlet">
						Món đã gọi
 					</a>					
				</nav>
			</div>			
    	</div>
    </header>

	<form id="refreshForm" method="post" action="showMonDaGoiServlet" style="display: none">
		<input type="submit" id="refresh">
	</form>		
		
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
	
	<%
		int stt=0;
	 	ArrayList<Food> listFoodCall = (ArrayList<Food>)request.getAttribute("listFoodCall");
    	if(listFoodCall.size()!=0){	
    	%>
    	
	    	<div class="menuLeftBar">
				<a id="baoThanhToan" class="tile" style="padding: 12px 7px; margin-top: 0px; width: 105px;
	        		   background-color: rgb(73, 62, 197); text-align: center;" title="Gửi yêu cầu thanh toán">
					Báo thanh toán					
				</a>
				<a id="guiYeuCau" class="tile" style="padding: 12px 7px; background-color: rgb(14, 196, 101);
					   margin-top: 50px; width: 105px; text-align: center;" title="Gửi yêu cầu về món ăn đến đầu bếp">
					Gửi yêu cầu
				</a>	
				<a id="goiPhucVu" class="tile" style="padding: 12px 7px; background-color: rgb(14, 196, 101);
					   margin-top: 100px; width: 105px; text-align: center;" title="Gọi nhân viên phục vụ">
					Gọi phục vụ			
				</a>
				<a id="gopY" class="tile" style="padding: 12px 7px; background-color: rgb(14, 196, 101);
					   margin-top: 150px; width: 105px; text-align: center;" title="Gửi góp ý">
					Góp ý				
				</a>	
			</div>
		
    	  	<div class="listFoodCalledBar">
    	  	
    	  		<table style="width: 10%; margin: 0% 1%; font-size: 13px; border-spacing: 0;">
				  <tr style="color: white">
				      <td style="text-align: center; background-color: rgb(44, 133, 216);">
				      	  <strong>BÀN <%=tableNumberSession%></strong>
				      </td>	
				  </tr>
				</table>
				
				<table class="table table-hover table-condensed" style="border: 0px; border-collapse: separate; border-spacing: 0;">
	       			<thead style="background-color: rgb(44, 133, 216);">
	          			<tr>
	          				<th style="text-align: center; color: white; width: 4%">#</th>
	            			<th style="text-align: center; color: white; width: 18%">Tên món</th>
	            			<th style="text-align: center; color: white; width: 10%" title="Số lượng đang chế biến / Số lượng yêu cầu">Số lượng</th>
	            			<th style="text-align: center; color: white; width: 15%">Đơn giá</th>
	            			<th style="text-align: center; color: white; width: 15%">Trạng thái gọi</th>
	            			<th style="text-align: center; color: white; width: 30%">Phản hồi của đầu bếp</th>
	           				 <th style="text-align: center; color: white; width: 8%"></th>
	         			</tr>
	       			</thead>
	        		<tbody>
	      	<%
	      	long tongGia=0;
	      	for(Food s : listFoodCall){
	      		tongGia+=(long)s.getGia()*s.getSoluong();
	      		String tam=Long.toString(((long)s.getGia()));
				String gia="";
				int d=tam.length()%3;
				for(int i=0;i<tam.length();i++){
					if((i+1)%3==d && i!=tam.length()-1) gia+=tam.charAt(i)+".";
					else gia+=tam.charAt(i);
				}
	    	%>
	    	    		<tr class="zzBody" style="height: 32px;">
		      	 			<td style="text-align: center; border-top: 2px solid #dddddd;"><%=++stt%></td>		
			     			<td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getTenmon()%></td>		              
			     			<td style="text-align: center; border-top: 2px solid #dddddd;" title="Số lượng đang chế biến / Số lượng yêu cầu">
			     				<%=s.getSoluongchebien()%> / <%=s.getSoluong()%>
			     			</td>
			     			<td style="text-align: center; border-top: 2px solid #dddddd;"><%=gia%> VNĐ</td>
			     			<td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getTrangthaigoi()%></td>
			     			<td style="text-align: center; border-top: 2px solid #dddddd;">
			     				<%if(s.getPhanhoidaubep()!=null){%>
						     		<%=s.getPhanhoidaubep()%>
						     	<%}else{%>
						     		Chưa có phản hồi
						     	<%}%>
			    			</td>
			     			<td style="text-align: center; border-top: 2px solid #dddddd;">
			     			<%if(!"Chế biến xong".equals(s.getTrangthaigoi()) && !"Từ chối".equals(s.getTrangthaigoi())){%>
			     				<button id="updateId" class="btnUpdate" soLuong="<%=s.getSoluong()%>" soLuongCheBien="<%=s.getSoluongchebien()%>"
			     						tenMon="<%=s.getTenmon()%>" value="<%=s.getStt()%>" soBan="<%=tableNumberSession%>" title="Cập nhật số lượng"></button>
			     			<%}%>
			     			<%if("Đang chờ...".equals(s.getTrangthaigoi())){%>
			     				<button id="deleteId" class="btnXoa" value="<%=s.getStt()%>" title="Xóa món ăn này"></button>
			    			<%}%>
			    			</td>
		      			</tr> 	    	  
	    	 <%
	      	 }//for	         
	      	
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
				
				<table style="width: 98%; margin: 0% 1%; font-size: 13px; border-spacing: 0">
		  			<tr style="color: white">
		         		<td width=65%></td>
		         		<td width=15% style="text-align: center; background-color: rgb(204, 61, 95);"><strong>TỔNG TIỀN</strong></td>	
		         		<td width="20%" style="text-align: center; background-color: rgb(204, 61, 95);"><strong><%=gia%> VNĐ</strong></td>
		 		    </tr>
				</table>
			</div>
    	<%
    	}else{
    		%>
    			<div class="left-col" style="background-color: white">
    				 <h3 style="font-size: 18px; color: rgb(0, 0, 247);">Qúy khách vẫn chưa gọi món ăn nào!</h3>
    			</div>
    		<%
    	}	
	%>
	       
		
			 	
	
	
	<div class="clearfix"></div>	
	<div id='bttop'>Về đầu trang</div>		
	<footer></footer>
</body>
</html>