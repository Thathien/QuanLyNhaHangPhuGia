<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="com.NhaHang.bean.FoodGuestCall"%>
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
	function regIsDigit(fData)
	{
		   var reg = new RegExp("^[0-9]*[0-9]?$");
		   return (reg.test(fData));
	}

	$(document).ready(function() {		
		 
		$('#btn1').click(function(){
			$('html,body').animate({ scrollTop: $('#div1').offset().top }, 'slow');			 
		}); 
		$('#btn2').click(function(){
			$('html,body').animate({ scrollTop: $('#div2').offset().top }, 'slow');			 
		}); 
		$('#btn3').click(function(){
			$('html,body').animate({ scrollTop: $('#div3').offset().top }, 'slow');			 
		}); 
		$('#btn4').click(function(){
			$('html,body').animate({ scrollTop: $('#div4').offset().top }, 'slow');			 
		}); 
		$('#btn5').click(function(){
			$('html,body').animate({ scrollTop: $('#div5').offset().top }, 'slow');			 
		}); 
		$('#btn6').click(function(){
			$('html,body').animate({ scrollTop: $('#div6').offset().top }, 'slow');			 
		}); 
		$('#btn7').click(function(){
			$('html,body').animate({ scrollTop: $('#div7').offset().top }, 'slow');			 
		}); 
		$('#btn8').click(function(){
			$('html,body').animate({ scrollTop: $('#div8').offset().top }, 'slow');			 
		}); 
		$('#btn9').click(function(){
			$('html,body').animate({ scrollTop: $('#div9').offset().top }, 'slow');			 
		}); 
		$('#btn10').click(function(){
			$('html,body').animate({ scrollTop: $('#div10').offset().top }, 'slow');			 
		}); 
		$('#btn11').click(function(){
			$('html,body').animate({ scrollTop: $('#div11').offset().top }, 'slow');			 
		}); 
		$('#btn12').click(function(){
			$('html,body').animate({ scrollTop: $('#div12').offset().top }, 'slow');			 
		}); 
		$('#btn13').click(function(){
			$('html,body').animate({ scrollTop: $('#div13').offset().top }, 'slow');			 
		}); 
		$('#btn14').click(function(){
			$('html,body').animate({ scrollTop: $('#div14').offset().top }, 'slow');			 
		}); 
		$('#btn15').click(function(){
			$('html,body').animate({ scrollTop: $('#div15').offset().top }, 'slow');			 
		}); 
		$('#btn16').click(function(){
			$('html,body').animate({ scrollTop: $('#div16').offset().top }, 'slow');			 
		}); 
		$('#btn17').click(function(){
			$('html,body').animate({ scrollTop: $('#div17').offset().top }, 'slow');			 
		}); 
		$('#btn18').click(function(){
			$('html,body').animate({ scrollTop: $('#div18').offset().top }, 'slow');			 
		}); 
		$('#btn19').click(function(){
			$('html,body').animate({ scrollTop: $('#div19').offset().top }, 'slow');			 
		}); 
		$('#btn20').click(function(){
			$('html,body').animate({ scrollTop: $('#div20').offset().top }, 'slow');			 
		}); 
		$('#btn21').click(function(){
			$('html,body').animate({ scrollTop: $('#div21').offset().top }, 'slow');			 
		}); 
		$('#btn22').click(function(){
			$('html,body').animate({ scrollTop: $('#div22').offset().top }, 'slow');			 
		}); 
		$('#btn23').click(function(){
			$('html,body').animate({ scrollTop: $('#div23').offset().top }, 'slow');			 
		}); 
		$('#btn24').click(function(){
			$('html,body').animate({ scrollTop: $('#div24').offset().top }, 'slow');			 
		}); 
		$('#btn25').click(function(){
			$('html,body').animate({ scrollTop: $('#div25').offset().top }, 'slow');			 
		}); 
		$('#btn26').click(function(){
			$('html,body').animate({ scrollTop: $('#div26').offset().top }, 'slow');			 
		}); 
		$('#btn27').click(function(){
			$('html,body').animate({ scrollTop: $('#div27').offset().top }, 'slow');			 
		}); 
		$('#btn28').click(function(){
			$('html,body').animate({ scrollTop: $('#div28').offset().top }, 'slow');			 
		}); 
		$('#btn29').click(function(){
			$('html,body').animate({ scrollTop: $('#div29').offset().top }, 'slow');			 
		}); 
		$('#btn30').click(function(){
			$('html,body').animate({ scrollTop: $('#div30').offset().top }, 'slow');			 
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
		
		
		//Cập nhật
		$('.chefsBarLeft').find('button').click(function() {
			var stt = $(this).val();
			var tenMon = $(this).attr("tenMon");
			var thoiGian = $(this).attr("thoiGian");
			var trangThaiGoi = $(this).attr("trangThaiGoi");
			var phanHoiDauBep = $(this).attr("phanHoiDauBep");
			var soLuong = $(this).attr("soLuong");
			var soLuongCheBien = $(this).attr("soLuongCheBien");

			$("#sttModal").val(stt);			
			$("#tenMonModal").text(tenMon);			
			$("#thoiGianModal").text(thoiGian);			
			$("#optionTTGModal").text(trangThaiGoi);
			$("#optionTTGModal").val(trangThaiGoi);			
			$("#optionPHDBModal").text(phanHoiDauBep);
			$("#optionPHDBModal").val(phanHoiDauBep);			
			$("#soLuongCheBienUpdateModal").val(soLuongCheBien);
			$("#soLuongHienTai").val(soLuong);
			$("#soLuongCheBien").val(soLuongCheBien);
			
			if(trangThaiGoi == "Đang chờ..." || trangThaiGoi == "Từ chối"){
				$("#soLuongModal").html('<input name="soLuongCheBien" value="0" type="text" readonly="readonly" style="width: 100px;"> / '+soLuong);
			}else if(trangThaiGoi == "Chế biến xong"){
				$("#soLuongModal").html('<input name="soLuongCheBien" value="'+soLuong+'" type="text" readonly="readonly" style="width: 100px;"> / '+soLuong);
			}else{
				$("#soLuongModal").html('<input id="soLuongCheBienUpdateModal"  value="'+soLuongCheBien+'" name="soLuongCheBien" type="number" min=1 max=99 placeholder="Số lượng" style="width: 100px;"> / '+soLuong);
			}
			
			$("#updateModal").modal("show");
			
			$("#updateBtn").click(function(){
				var trangThaiGoi = $("#trangThaiGoiModal option:selected").text();
				
				if(trangThaiGoi == "Đang chế biến"){
					var soLuong = $('#soLuongCheBienUpdateModal').val()*1;
					if(soLuong>=100){
						alert('Số lượng nhập vào không hợp lệ!\nSố lượng tối thiểu: 1\nSố lượng tối đa: 99');
						$("#soLuongCheBienUpdateModal").focus();
					}else if( !regIsDigit($('#soLuongCheBienUpdateModal').val()) || $('#soLuongCheBienUpdateModal').val()==0){
							  alert('Số lượng nhập vào không hợp lệ!\nSố lượng tối thiểu: 1\nSố lượng tối đa: 99');
							  $("#soLuongCheBienUpdateModal").focus();
						  }else{
							  $("#formUpdateFood").submit();
						  }
				}else{
					$("#formUpdateFood").submit();
				}
			});
		});	
	});
	
	function changeSoLuongModal(){
		var trangThaiGoi = $("#trangThaiGoiModal option:selected").text();
		var soLuongHienTai = $("#soLuongHienTai").val();
		var soLuongCheBien = $("#soLuongCheBien").val();
		if(trangThaiGoi == "Đang chờ..."){
			$("#soLuongModal").html('<input name="soLuongCheBien" value="0" type="text" readonly="readonly" style="width: 100px;"> / '+soLuongHienTai);
			$("#optionPHDBModal").text('Quý khách vui lòng đợi trong chốc lát');
			$("#optionPHDBModal").val('Quý khách vui lòng đợi trong chốc lát');	
		}else if(trangThaiGoi == "Từ chối"){
			$("#soLuongModal").html('<input name="soLuongCheBien" value="0" type="text" readonly="readonly" style="width: 100px;"> / '+soLuongHienTai);
			$("#optionPHDBModal").text('Xin lỗi, hiện tại món ăn này đã hết');
			$("#optionPHDBModal").val('Xin lỗi, hiện tại món ăn này đã hết');	
		}else if(trangThaiGoi == "Chế biến xong"){
			$("#soLuongModal").html('<input name="soLuongCheBien" value="'+soLuongHienTai+'" type="text" readonly="readonly" style="width: 100px;"> / '+soLuongHienTai);
			$("#optionPHDBModal").text('Chúc quý khách ngon miệng');
			$("#optionPHDBModal").val('Chúc quý khách ngon miệng');	
		}else{
			$("#soLuongModal").html('<input id="soLuongCheBienUpdateModal"  value="'+soLuongCheBien+'" name="soLuongCheBien" type="number" min=1 max=99 placeholder="Số lượng" style="width: 100px;"> / '+soLuongHienTai);
			$("#optionPHDBModal").text('Quý khách vui lòng đợi trong chốc lát');
			$("#optionPHDBModal").val('Quý khách vui lòng đợi trong chốc lát');	
		}
	}
	
	function xacNhan(){
		return confirm("Bạn muốn đăng xuất?");
	}
	
	
	//Tự động tải lại trang sau 40s
	window.onload = function() {
	   setInterval(
	       function(){
	        	$("#refresh").click();
	       },
	       40000
	   );
	};
</script>

<style>

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
html,body{
	background:#F8F8F8  repeat fixed !important; /* Main background color */}
#bttop:hover{
	border:1px solid #ffa789;
	background:#ff6734;
}
</style>
<title>Quản lý gọi món</title>
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
			case 4:
				requestDispatcher=request.getRequestDispatcher("showGoiMonServlet");
				requestDispatcher.forward(request, response);
			}
		}else{
			requestDispatcher=request.getRequestDispatcher("showDangNhapServlet");
			requestDispatcher.forward(request, response);
		}
	%>

	<!-- Modal update -->
	<div id="updateModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 215px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Cập nhật trạng thái món ăn</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 260px; border-radius: 0px">
		      	<div>
		      		<form id="formUpdateFood" action="updateCallFoodServlet" method="post">
		      			<input type="hidden" id="soLuongHienTai" value="">
		      			<input type="hidden" id="soLuongCheBien" value="">
		      			<input type="hidden" name="actor" value="chefs">
		      			<input type="hidden" id="sttModal" name="stt" value="">
			      		<table class="table table-hover table-condensed" style="border: 0px; width: 380px; border-spacing: 0">
							<tr>
							     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
							     	<b>Tên món ăn</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								   	 <p id=tenMonModal style="margin-top: 0px"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
							     	<b>Thời gian gọi</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								   	 <p id="thoiGianModal" style="margin-top: 0px"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);" title="Số lượng đang chế biến / Số lượng yêu cầu">
							     	<b>Số lượng</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;" title="Số lượng đang chế biến / Số lượng yêu cầu">
								   	 <p id="soLuongModal" style="margin-top: 0px; padding: 0px;"></p>
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
							     	<b>Trạng thái</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd;">
								    <select id="trangThaiGoiModal" name="trangthaigoi" onchange="changeSoLuongModal();">
								    	<optgroup label="Hiện tại">
								    		<option id="optionTTGModal" value=""></option>
								    	</optgroup>
								    	<optgroup label="Chọn cập nhật">
								    		<option value="2">Đang chế biến</option>
								     		<option value="3">Chế biến xong</option>
								     		<option value="1">Đang chờ...</option>
								     		<option value="4">Từ chối</option>
								    	</optgroup>						     		
							     	</select>
							     	
								 </td>
							</tr>
							<tr>
							     <th style="text-align: right; color: white; width: 38%; background-color: rgb(44, 133, 216);">
							     	<b>Phản hồi</b>
							     </th>
							     <td style="text-align: left; border-top: 2px solid #dddddd; border-bottom: 2px solid #dddddd;">
								    <select id="phanHoiDauBepModal" name="phanhoidaubep">
								    	<optgroup label="Hiện tại">
								    		<option id="optionPHDBModal" value=""></option>
								    	</optgroup>
								    	<optgroup label="Chọn cập nhật">
								    		<option value="1">Quý khách vui lòng đợi trong chốc lát</option>
								     		<option value="2">Chúc quý khách ngon miệng</option>
								     		<option value="3">Xin lỗi, hiện tại món ăn này đã hết</option>
								     		<option value="4">Quý khách vui lòng nhập số lượng thật</option>
								    	</optgroup>
							     	</select>
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
		if("error".equals(message)){
	%>
		<script type="text/javascript">
			alert('Khách hàng đã hủy gọi món ăn này, không thể cập nhật!');
		</script>
	<%		
		}else if("wrong".equals(message)){
	%>
		<script type="text/javascript">
			alert('Không thể cập nhật!\nSố lượng yêu cầu không được lớn hơn số lượng đang chế biến.');
		</script>
	<%
		}
	%>

	<header>
		<div id="headerWrapper">
			<div id="headerCenter">
				<a href="showDangNhapServlet" class="tile" style="margin-top:14px; right: 15px; height: 32px; width: 32px" onclick="return xacNhan();">
					<img src="./admin/img/logout.ico" title="Đăng xuất" style="background-color: #0A99D1; margin-bottom: 0px">					
				</a>
				<div id="headerTitles">
					<h1 style="margin-top: 0px; margin-bottom: 0px;"><a href="showQuanLyGoiMonServlet" title="Refresh">NHÀ HÀNG PHÚ GIA</a></h1>
		    	</div>
			</div>			
    	</div>
    </header>
	
	<form id="refreshForm" method="post" action="showQuanLyGoiMonServlet" style="display: none">
		<input type="submit" id="refresh">
	</form>
	<%
		ArrayList<FoodGuestCall> listFoodGuestCall = (ArrayList<FoodGuestCall>) request.getAttribute("listFoodGuestCall");
		ArrayList<FoodGuestCall> listYeuCauThem = (ArrayList<FoodGuestCall>) request.getAttribute("listYeuCauThem");
		
		LinkedHashSet<Integer> hs = (LinkedHashSet<Integer>) request.getAttribute("hs");
		if(listFoodGuestCall != null && listFoodGuestCall.size() != 0){
	%>
	
			<div id="eventBar" style="text-align: center; padding-top: 0px; padding-bottom: 0px; color: red">
				Các bàn gọi món: 
				<%
					int banTemp2;
					int index2 = 0; 
					
					for(Iterator<Integer> i = hs.iterator(); i.hasNext();){		
						banTemp2 = i.next();
						index2++;
						%><input type="button" id="btn<%=index2%>" value="Bàn <%=banTemp2%>"><%
					}
				%>
			</div>
	
	<%
		}//if
		
		int index=0;
		int banTemp;		
		if(listFoodGuestCall != null){
			for(Iterator<Integer> i = hs.iterator(); i.hasNext();){			
				banTemp = i.next();
				index++;				
	%>
				<div class="chefsBarLeft" id="div<%=index%>">
					<table style="width: 98%; margin: 0% 1%;">
						<tr style="background-color: #B9DEEC">
							<td style="text-align: left; width: 50%; color: red; 
								padding: 0px;"><b>Bàn <%=banTemp%></b></td>
							<td style="text-align: right; width: 50%; color: red; 
								padding: 0px;"><b>#<%=index%></b></td>
						</tr>
					</table>
					<hr style="border-top: 3px solid #0DA5E0; margin-bottom: 10px; margin-top: 2px;">						
					<table class="table table-hover table-condensed" style="border: 0px; border-collapse: separate; border-spacing: 0;">
				        <thead style="background-color: rgb(44, 133, 216);">
				          <tr>
				            <th style="text-align: center; color: white; width: 18%">Tên món</th>
				            <th style="text-align: center; color: white; width: 10%">Số lượng</th>
				            <th style="text-align: center; color: white; width: 15%">Trạng thái</th>
				            <th style="text-align: center; color: white; width: 30%">Phản hồi</th>
				          	<th style="text-align: center; color: white; width: 15%">Thời gian gọi</th>
				          	<th style="text-align: center; color: white; width: 12%"></th>
				          </tr>
				        </thead>
				        <tbody>	
	<%
				for(FoodGuestCall s : listFoodGuestCall){
					if(s.getSoban() == banTemp){
			%>
						  <tr>
						     <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getTenmon()%></td>		              
						     <td style="text-align: center; border-top: 2px solid #dddddd;" title="Số lượng đang chế biến / Số lượng yêu cầu">
						     	<%=s.getSoluongchebien()%> / <%=s.getSoluong()%>
						     </td>
						     <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getTrangthaigoi()%></td>
						     <td style="text-align: center; border-top: 2px solid #dddddd;">
						     	<%if(s.getPhanhoidaubep()!=null){%>
						     		<%=s.getPhanhoidaubep()%>
						     	<%}else{%>
						     		Chưa có phản hồi
						     	<%}%>
						     </td>
						     <td style="text-align: center; border-top: 2px solid #dddddd;"><%=s.getThoigian()%></td>
						     <td style="text-align: center; border-top: 2px solid #dddddd; padding-top: 0px; padding-bottom: 0px;">
						     	<button style="padding: 7px 7px" value="<%=s.getStt()%>" trangThaiGoi="<%=s.getTrangthaigoi()%>"
						     			tenMon="<%=s.getTenmon()%>" thoiGian="<%=s.getThoigian()%>" soLuong="<%=s.getSoluong()%>" 
						     			soLuongCheBien="<%=s.getSoluongchebien()%>"	phanHoiDauBep="<%if(s.getPhanhoidaubep()!=null){%>
						     							 												<%=s.getPhanhoidaubep()%>
						     						   											   <%}else{%>
						     							   												Chưa có phản hồi
						     						   											   <%}%>" >
						     			Cập nhật
						     	</button>
						     </td>
					      </tr>    
			<%
					}//if
				}//for
			%>
			    	   </tbody>
				   </table>
				<%
					for(FoodGuestCall y : listYeuCauThem){
						if(y.getSoban()==banTemp && !" ".equals(y.getYeucauthem())){
				%>
					 <table style="width: 98%; margin: 0% 1%;">
						<tr style="background-color: #B9DEEC">
							<td style="width: 12%; color: red; padding: 0px;">
								<b>Yêu cầu thêm:</b>
							</td>
							<td style="width: 88%; color: red; padding: 0px;">
								<p style="margin-top: 0px; padding: 0px;"><%=y.getYeucauthem()%></p>
							</td>
						</tr>
					 </table>			
				<%			
						}
					}
				%>   
				</div>
	<%
			}//for LinkedHashSet	
		}//if
		
		if(index==0){
	%>
    		<div class="left-col" style="background-color: white">
    			<h3 style="font-size: 18px; color: rgb(0, 0, 247);">Hiện tại chưa có yêu cầu gọi món nào từ khách hàng!</h3>
    		</div>
    <%
		}
	%>
	
	<div class="clearfix"></div>	
	<div id='bttop'>Về đầu trang</div>		
	<footer></footer>
</body>
</html>