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
	
	$(document).ready(function() {
		$('.tableStyle1').find('a').click(function() {
			var id = $(this).attr("id");
			
			if($('#checkBox'+id).is(":checked")){
				$('#checkBox'+id).click();				
				$('#'+id).removeClass("tableChoose");
			}else{
				$('#checkBox'+id).click();				
				$('#'+id).addClass("tableChoose");
			}		
			
		});		
		
		$('.tableStyle1').find('a').dblclick(function() {
			var id = $(this).attr("id");
			
			$('#chiTietBan').val(id);
			$('#chiTietBan').click();			
		});		
		
		$("#changeTable").click(function () {
		  	if($(":checkbox:checked").length == 2){
		  		$("#ChangeModal").modal("show");
		  		//alert($(":checkbox:checked").eq(0).val()+" va "+$(":checkbox:checked").eq(1).val());
		  		$("#fromto").val("Chuyển bàn "+$(":checkbox:checked").eq(0).val() + " sang bàn " + $(":checkbox:checked").eq(1).val());
		  		$("#tofrom").val("Chuyển bàn "+$(":checkbox:checked").eq(1).val() + " sang bàn " + $(":checkbox:checked").eq(0).val());
		  		
		  	}else{
		  		alert("Hãy chọn 2 bàn trước khi click chuyển bàn.");
		  	}		  		
		});
		
		$("#deleteTable").click(function () {
				if($(":checkbox:checked").length != 0){
			  		var listTable = "";
			  		
			  		for(var i=0; i<$(":checkbox:checked").length;i++){
			  			listTable+=$(":checkbox:checked").eq(i).val()+",";
			  		}
			  		var x = confirm("Bạn muốn xóa?");
			  		if(x){
			  			$.post("quanLyBanServlet_quanly",{
					  		listTable: listTable,
							action: "delete"
					    }, function(message){
							if(message!="ok"){
								alert('Không thể xóa!\nMột trong những bàn bạn chọn đang được sử dụng.');
							}else{
								$("#refresh").click();
							}
		  			    });
			  		}else{
						return false;
					}
			  		
			  	}else{
			  		alert("Hãy chọn ít nhất 1 bàn trước khi click xóa bàn.");
			  	}		  		
			
		  	
		});
				
		$("#fromto").click(function () {
			$("#ChangeModal").modal("show");
	  		$("#from").val($(":checkbox:checked").eq(0).val());
	  		$("#to").val($(":checkbox:checked").eq(1).val());
	  		$("#change").click();
		});
		
		$("#tofrom").click(function () {
			$("#ChangeModal").modal("show");
	  		$("#from").val($(":checkbox:checked").eq(1).val());
	  		$("#to").val($(":checkbox:checked").eq(0).val());
	  		$("#change").click();
		});
		
		$("#addTable").click(function () {			
			$("#addTableModal").modal("show");			
		});
		
		$("#add").click(function () {
			var soLuong = $('#number').val()*1;
			if(soLuong>=100){
				alert('Giá trị nhập vào không hợp lệ!\nSố lượng tối thiểu: 1\nSố lượng tối đa: 99');
				$("#number").focus();
			}else if( !regIsDigit($('#number').val()) || $('#number').val()==0){
					  alert('Giá trị nhập vào không hợp lệ!\nSố lượng tối thiểu: 1\nSố lượng tối đa: 99');
					  $("#number").focus();
				  }else{
						$.post("quanLyBanServlet_quanly",{
							action: "add",
							soLuong: soLuong
				    	}, function(message){
							if(message == "error"){
								alert('Có lỗi xảy ra, không thể thêm bàn!');
							}else{
								$("#addTableModal").modal("hide");		
								alert('Đã thêm bàn '+message);
								$("#refresh").click();
							}
						});	
				  }
		});
		
		//Tự động tải lại trang sau 30s
		window.onload = function() {
		   setInterval(
		       function(){
		        	$("#refresh").click();
		       },
		       30000
		   );
		};
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
.alert{
	font-weight: bold;
	color: rgb(255, 76, 76);
	font-size: x-large;
	width: 34px;
	text-align: center;
	font-family: serif;
	margin-bottom: 0px;
}
html,body{
	background:#F8F8F8  repeat fixed !important; /* Main background color */}
</style> 


<title>Quản lý bán hàng</title>
</head>
<body class="full desktop">
	<%
		String security = (String) session.getAttribute("security");
		RequestDispatcher requestDispatcher;
		if (security != null){
			switch(Integer.parseInt(security)){
			case 1:
				requestDispatcher=request.getRequestDispatcher("homePageAdmin.jsp");
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
	
   <!-- Modal Change table -->
	   <div id="ChangeModal" class="modal fade" style="width: 420px; margin-left: -200px">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400;">Chuyển bàn</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 40px; text-align: center;">
		       	<input id="fromto" class="btn btn-primary" type="button" value="" style="padding: 7px 7px">
		        <input id="tofrom" class="btn btn-primary" type="button" value="" style="padding: 7px 7px">
		      </div>
		    </div>
		  </div>
	</div>
	
	<!-- Modal Add table -->
	   <div id="addTableModal" class="modal fade" style="width: 420px; margin-left: -200px">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400;">Thêm bàn</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 88px;">
		      	<div style="float: left">
		      		Nhập số lượng bàn muốn thêm: 
		      		<input type="number" id="number" min=1 max=99 style="width: 100px" value="1">
		      	</div>		      	
		      	<br><br><br>
		      	<div style="float: right">
		      		<input id="add" class="btn btn-primary" type="button" value="Thêm" style="padding: 7px 15px">
		      		<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 7px 15px">Hủy</button>
		      	</div>		      
		      </div>
		    </div>
		  </div>
	</div>
	
	<!-- Form chi tiết bán hàng -->
	<form method="post" action="showChiTietBanServlet_quanly" style="display: none">
		<input type="submit" id="chiTietBan" name="tableNumber" value="">
	</form>	
	
	<!-- Change Table Form -->
	<form method="post" action="quanLyBanServlet_quanly" style="display: none">
		<input type="submit" id="change" name="action" value="change">
		<input type="hidden" id="from" name="from" value="">
		<input type="hidden" id="to" name="to" value="">
	</form>	
	
	<!-- Refresh -->
	<form id="refreshForm" method="post" action="showQuanLyBanHangServlet_quanly" style="display: none">
		<input type="submit" id="refresh">
	</form>		
	
	<header style="top: 0px;">
		<div id="headerWrapper">
			<div id="headerCenter">
				<div id="headerTitles">
					<h1><a href="showQuanLyBanHangServlet_quanly">NHÀ HÀNG PHÚ GIA</a></h1>
		   			<h2>Đ/C: LỘC TIẾN,PHÚ LỘC,THỪA THIÊN HUẾ</h2>
		    	</div>
			</div>
			<a href="showDangNhapServlet" class="tile" style="margin-top: 2px; right: 1px;" onclick="return xacNhan();">
				<img src="./admin/img/logout.ico" height="50" width="50" title="Đăng xuất" style="background-color: #0A99D1;">					
			</a>			
    	</div>
    </header>
    
	<div id="wrapper" style="padding-top: 84px;">
		<div id="centerWrapper" style="display: block;">
  		    <div id="tileContainer" class="" style="width: 100%; height: 500px; display: block;">
            	<div id="divHeader" style="display: block;">
            	    <a href="showQuanLyBanHangServlet_quanly" class="groupTitle" style="margin-top: 0px; display: block; 
	       		       opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">QUẢN LÝ BÀN</h3>
	       		    </a>
            	</div>
            	
            	<div id="divLeft">	        		
	        		<a id="changeTable" class="tile" style="padding: 10px 15px; background-color: rgb(14, 196, 101);
	        		   margin-top: 0px; width: 100px; text-align: center;">
						Chuyển bàn				
					</a>
					<a id="addTable" class="tile" style="padding: 10px 15px; background-color: rgb(73, 62, 197);
					   margin-top: 50px; width: 100px; text-align: center;">
						Thêm bàn		
					</a>	
	        		<a id="deleteTable" class="tile" style="padding: 10px 15px; background-color: rgb(238, 78, 78);
	        		   margin-top: 100px; width: 100px; text-align: center;">
						Xóa bàn				
					</a>
					
					<table style="margin-top: 331px; width: 130px; border: 1px solid rgb(150, 150, 150);">
						<tr>
							<td style="text-align: center; background-color: rgb(100, 100, 100); 
								padding: 5px 0px; color: white">
								CHÚ THÍCH
							</td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: rgb(74, 212, 213); 
								padding: 2px 0px; color: rgb(54, 53, 53)">
								Bàn chưa có khách
							</td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: rgb(238, 65, 65); 
								padding: 2px 0px; color: rgb(54, 53, 53)">
								Bàn đã có khách
							</td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: rgb(240, 215, 38); 
								padding: 2px 0px; color: rgb(54, 53, 53)">
								Yêu cầu thanh toán
							</td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: rgb(67, 201, 83);
								padding: 2px 0px; color: rgb(54, 53, 53)">
								Bàn đang chọn
							</td>
						</tr>
					</table>
        		</div>
        		
        		<div id="divContent">
        			<!-- Hiển thị danh sách các bàn -->	
        <%
        	int index=0;
        	ArrayList<Table> listTable = (ArrayList<Table>) request.getAttribute("listTable");
        	if(listTable.size() != 0){
        	   for(Table s : listTable){
        		  if(s.getXoaban()==0){
        			index++;
        %>
        			<div class="tableStyle1">
						<a id="<%=s.getSoban()%>" style="text-decoration: none; width: 105px; height: 105px; border-radius: 2px;" 
						   <%if(s.getTrangthaiban()==0){%> 
						   		class="tile tableFree"
						   <%}else if(s.getTrangthaiban()==1){%>
						   		class="tile tableUse"
						   <%}else if(s.getTrangthaiban()==2){%>
						   		class="tile tableAlert"
						   <%}%>> 
						   
						    <input id="checkBox<%=s.getSoban()%>" value="<%=s.getSoban()%>" type="checkbox" style="display: none;"/>
							<span>
								<%if(s.getGoiphucvu() == 0){%>
									<h1 style="color: white; margin-top: 30%; font-weight: 400; font-size: 30px;">
										<%=s.getSoban()%>
									</h1>
								<%}else if(s.getTrangthaiban()==2){%>
									<span style="font-size: 12px; color: white; font-weight: bold">BÁO THANH TOÁN</span>
									<h1 style="color: white; margin-top: -8%; font-weight: 400; font-size: 30px;">
										<%=s.getSoban()%>
									</h1>
								<%}else{%>
									<span style="font-size: 12px; color: white; font-weight: bold">GỌI PHỤC VỤ</span>
									<h1 style="color: white; margin-top: -8%; font-weight: 400; font-size: 30px;">
										<%=s.getSoban()%>
									</h1>
								<%}%>
							</span>							
						</a>
					</div>
			  	 <%}
        	   }
        	}
        	
        	if(index==0){%>
        			<h3 style="text-align: center; width:700px; font-size: 18px; color: rgb(0, 0, 247);">Hiện tại chưa có bàn nào!</h3>
          <%}%>
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->
		
	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>