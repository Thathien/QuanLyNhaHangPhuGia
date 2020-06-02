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
		  		var stt=$(":checkbox:checked").eq(0).attr('id');		  		
		  		$('#noiDung').text($(":checkbox:checked").eq(0).val());
		  		
		  		$.post("quanLyGopYServlet",{
		  			stt: stt,
		  			action: "xemChiTiet"
			    }, function(message){
					if(message!="ok"){
						alert('Có lỗi xảy ra, không thể cập nhật xem chi tiết!');
					}else{
						$("#xemChiTietModal").modal("show");
					}
  			    });
		  	}else{
		  		alert("Hãy chọn 1 góp ý bạn muốn xem!");
		  	}		  		
		});
		
		$("#deleteFeedBack").click(function () {
			var listFeedBack = "";
	  		
	  		for(var i=0; i<$(":checkbox:checked").length;i++){
	  			if($(":checkbox:checked").eq(i).attr('id') != "checkAll"){
	  				listFeedBack+=$(":checkbox:checked").eq(i).attr('id')+",";
	  			}
	  		}
	  		
		  	if($(":checkbox:checked").length != 0){		  		
		  		$.post("quanLyGopYServlet",{
		  			listFeedBack: listFeedBack,
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
		  		alert("Hãy chọn ít nhất 1 góp ý trước khi click xóa góp ý!");
		  	}		  		
		});
		
		$('#close').click(function(){
			$("#refresh").click();
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


<title>Quản lý góp ý</title>
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

	<!-- Modal Xem chi tiết góp ý -->
	<div id="xemChiTietModal" class="modal fade" style="width: 420px; margin-left: -200px; height: 215px; display: none;">
		<div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h3 class="modal-title" style="font-size: 18px; font-weight: 400; text-align: left;">Chi tiết góp ý</h3>
		      </div>
		      
		      <div class="modal-footer" style="height: 88px;">
		      	<div>
		      		<textarea id="noiDung" rows="5" style="width: 350px; margin-left: 20px; margin-right: 30;" disabled="disabled"></textarea>
		      	</div>		      	
		      	
		      	<div style="float: right; margin-top: 12px">
		      		<input id="close" class="btn btn-primary" type="button" value="Đóng" style="padding: 7px 15px">
		      	</div>		      
		      </div>
		    </div>
		</div>
	</div>
	
	<!-- Refresh -->
	<form id="refreshForm" method="post" action="showQuanLyGopYServlet" style="display: none">
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
            	    <a class="groupTitle" href="showQuanLyGopYServlet" style="margin-top: 0px; display: block; opacity: 1;">
	       		       <h3 style="margin-left: 170px; width: 700px; text-align: center;">QUẢN LÝ GÓP Ý</h3>
	       		    </a>
            	</div>
            	
            	<div id="divLeft">	        		
	        		<a id="xemChiTiet" class="tile" style="padding: 10px 15px; background-color: rgb(2, 176, 192);
	        		   margin-top: 0px; width: 100px; text-align: center;">
						Xem chi tiết			
					</a>
					<a id="deleteFeedBack" class="tile" style="padding: 10px 15px; background-color: rgb(238, 78, 78);
					   margin-top: 50px; width: 100px; text-align: center;">
						Xóa góp ý	
					</a>	
        		</div>
        		
        		<div id="divContent">        		
         <%
        	int index=0;
         	ArrayList<GopY> listFeedBack = (ArrayList<GopY>) request.getAttribute("listFeedBack");
         	if(listFeedBack.size() != 0){
         	%>
				
				<table id='table' class="table table-hover table-condensed" style="border: 0px">
					<thead style="background-color: rgb(44, 133, 216);">
					   <tr>
					   	 <th style="text-align: center; color: white; width: 5%" title="Chọn tất cả">
					   	 	<input id='checkAll' type="checkbox" value="">
					   	 </th>
					     <th style="text-align: center; color: white; width: 5%"><b>#</b></th>
					     <th style="text-align: center; color: white; width: 70%"><b>Nội dung</b></th>
					     <th style="text-align: center; color: white; width: 20%"><b>Thời gian</b></th>
					   </tr>
					</thead>
					<tbody>
         	<%
		      	for(GopY s : listFeedBack){
		      		index++;
         	   %>						        		
						<tr class="zzBody">
						  <td style="text-align: center; border-top: 2px solid #dddddd;
						  	<%if(s.getDadoc()==0){%>background-color: rgb(255, 122, 0);" title="Góp ý chưa đọc"<%}else{%>"<%}%>>
					   	 	<input id='<%=s.getStt()%>' type="checkbox" value="<%=s.getNoidung()%>">
						  </td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;
						  	<%if(s.getDadoc()==0){%>background-color: rgb(255, 122, 0);" title="Góp ý chưa đọc"<%}else{%>"<%}%>>
						  	<%=index%>
						  </td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;
						 	<%if(s.getDadoc()==0){%>background-color: rgb(255, 122, 0);" title="Góp ý chưa đọc"<%}else{%>"<%}%>>
						 	<%=s.getNoidung().length() >=61 ? s.getNoidung().substring(0,60)+"..." : s.getNoidung()%>
						  </td>
						  <td style="text-align: center; border-top: 2px solid #dddddd;
						  	<%if(s.getDadoc()==0){%>background-color: rgb(255, 122, 0);" title="Góp ý chưa đọc"<%}else{%>"<%}%>>
						  	<%=s.getNgay()%>
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
			  %><h3 style="font-size: 13px; color: red; text-align: center; margin-left: -20px">Hiện tại chưa có góp ý nào!</h3><%	
		  }%>
        		</div>
        		
			</div> <!-- tileContainer -->
       </div> <!-- centerWrapper -->

	   <footer></footer>
	   
	</div> <!-- wrapper -->	
	<div id="catchScroll"></div>
</body>
</html>