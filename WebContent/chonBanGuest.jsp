<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="com.NhaHang.bean.Table"%>
	<%@page import="com.NhaHang.bean.Food"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="./admin/css/tiles.css">
	<script type="text/javascript" src="./admin/js/jquery-2.0.2.js"></script>
	<script type="text/javascript" src="./admin/js/bootstrap.js"></script>
	<link href="./admin/css/css.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="./admin/css/nav.css">
	<link rel="stylesheet" type="text/css" href="./admin/css/theme.css">
	<link href="./admin/css/responsive.css" rel="stylesheet" type="text/css">
	<script src="./admin/js/jquery.min.js"></script>
	<script type="text/javascript">
		function xacNhan(){
			return confirm("Bạn muốn đăng xuất?\n\nLưu ý: \n   - Quý khách vui lòng không dùng chức năng này.\n   - Liên hệ với quản lý nhà hàng nếu lỡ đăng xuất.");
			
		}
	/*
		function xacNhanVao(){
			var x =  confirm("Lưu ý: \n   - Quý khách vui lòng không dùng chức năng này.\n   - Chức năng này chỉ dùng cho những khách hàng đã lỡ đăng xuất.");
			if(x){
				$('.tableStyle').find('a').click(function() {
					var id = $(this).attr("id");
					$('#showGoiMon').val(id);
					$('#showGoiMon').click();			
				});	
			}else{
				return false;
			}
		}
		function xacNhanChonBan(){
			$('.tableStyle').find('a').click(function() {
				var id = $(this).attr("id");
				$('#showGoiMon').val(id);
				$('#showGoiMon').click();			
			});	
		}
		
	*/

		$(document).ready(function() {
			$('.tableStyle').find('a').click(function() {
				var id = $(this).attr("id");
				$('#showGoiMon').val(id);
				$('#showGoiMon').click();			
			});
			
		});
	/*
		$(document).ready(function() {
			$('.tableStyle').find('a').click(function() {
				var id = $(this).attr("id");
				$('#showGoiMon').val(id);
				$('#showGoiMon').click();			
			});		
		
		});
	*/
		
	</script>
	<style>
	html,body{
	background:#F8F8F8  repeat fixed !important; /* Main background color */}
		.left-col{
			background : #0A99D1;
		}
		.not-active {
	  pointer-events: none;
	  cursor: default;
	  text-decoration: none;
	  color: black;
	}
	</style>
	<title>Chọn bàn</title>
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
	<header>
		<div id="headerWrapper">
			<div id="headerCenter">
				<a href="showDangNhapServlet" class="tile" style="margin-top:14px; right: 15px; height: 32px; width: 32px" onclick="return xacNhan();">
					<img src="./admin/img/logout.ico" title="Đăng xuất" style="background-color: #0A99D1; margin-bottom: 0px">					
				</a>
				<div id="headerTitles">
					<h1 style="margin-top: 0px; margin-bottom: 0px;"><a href="showChonBanGuestServlet" title="Refresh">Nhà Hàng Phú Gia</a></h1>
		    	</div>
			</div>			
    	</div>
    </header>
    
    <div id="tableBar">
				<!-- Hiển thị danh sách các bàn -->	
	<%
        	int index=0;
        	ArrayList<Table> listTable = (ArrayList<Table>) request.getAttribute("listTable");
        	if(listTable != null){
        	   for(Table s : listTable){
        		  if(s.getXoaban()==0){
        			index++;
        %>
        <div class="tableStyle">
						<a id="<%=s.getSoban()%>" style="text-decoration: none; width: 105px; height: 105px; border-radius: 2px;" 
						   <%if(s.getTrangthaiban()==0){%> 
						   		class="tile tableFree"  onclick="return xacNhanChonBan()"
						   <%}else {%>
						   		class="tile tableUse" onclick="return false;"
						   <%}%>> 
						   
						  
							<span>
								<%if(s.getTrangthaiban()==0){%>
									<h1 style="color: white; margin-top: 30%; font-weight: 400; font-size: 30px;">
										<%=s.getSoban()%>
									</h1>
								<%}else{%>
									<span style="font-size: 12px; color: white; font-weight: bold">Bàn đã được dùng</span>
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
        			<h3 style="text-align: center; font-size: 18px; color: rgb(0, 0, 247);">Hiện tại chưa có bàn nào!</h3>
          <%}%>
    </div>
	
	<form action="showGoiMonServlet" method="post" style="display: none">
		<input id=showGoiMon type="submit" name="tableNumber" value="">
	</form>
	
	<div class="clearfix"></div>	
	<footer></footer>
</body>
</html>