<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
<!-- For mobile devises  -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1 ">
<!-- jQuery 1.8.3 -->
<script src="./admin/js/jquery-1.8.3.min.js"></script>
<!-- site style -->
<link href="./admin/css/style.css" rel="stylesheet" type="text/css" media="screen" />
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
			break;
		case 4:
			requestDispatcher=request.getRequestDispatcher("showGoiMonServlet");
			requestDispatcher.forward(request, response);
		}
	}
%>
	<!-- Image that triggers the background configuration bar -->
<img src="./admin/img/picture.png" id="OptionBack">

<!-- Image that triggers the color configuration bar -->
<img src="./admin/img/gear.png" id="OptionColor">

<!-- Login Box -->
<div class="LoginBox">

	<a href="homePageGuest.jsp" style="margin-left: -35px; margin-right: 5px; ">
	   	<img id="arrowLeft" class="navArrows" src="./admin/img/leftArrow.png" title="Trở về" style="margin-bottom: 121px;">   		
	</a>
	
	<!-- live avatar -->
	<img src="./admin/img/login.png" style="width: 40%">

	<!-- Login Message -->
	<h2 class="loginMessage"></h2>

	<!-- Form Fields -->
    <div class="fields">
		<form id="frmLogin">
			<input type="text" id="txtUser" name="txtUser" placeholder="Tên tài khoản" class="formss"/>
			<p></p>
			<input type="password" id="txtPassword" name="txtPassword" placeholder="Mật khẩu" />
			<!-- buttons eye and  -->
			<button id="botLogIn" style="margin-top: 6px"></button>
			<img src="./admin/img/eye.PNG" class="seePass" style="top: -31px">
		</form>
	</div>
	
	<form action="checkLoginServlet" method="post" style="display: none;">
		<input type="submit" id="getSecurity" name="quyen" value="">
		<input type="hidden" name="action" value="form">
	</form>
	<%
		String message = (String) request.getAttribute("message");
		if("ok".equals(message)){
	%>
		<script type="text/javascript">
			alert('Quản lý đã xóa bàn này!');
		</script>
	<%	} %>
	</div>
	<!-- javascript for login -->
<script src="./admin/js/MetroLogin.js"></script>
</body>
</html>