<%@page import="com.NhaHang.bean.Food"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hóa đơn thanh toán</title>
<style>
body{
    font-family: Arial, Tahoma;
    font-size: 12px;
}

#main{
    width: 70%;
    padding: 0;
    margin-left: auto;
    margin-right: auto;
}

#head{
    height: 100px;
    margin-bottom:5px;
}

#headName{
    height: 60px;
    margin-bottom:5px;
}

#headInfoLeft{
	float: left;
	width:49.75%;
    height: 20px;
    margin-bottom:5px;
}

#headInfoRight{
	float: right;
	width:49.75%;
    height: 20px;
    margin-bottom:5px;
}

#content{
     width: 99.8%;
     min-height: 300px;
     float:left;
     margin-bottom: 5px;
}

#footer{
     height: 50px;
     clear: both;
}
</style>

</head>
<body>	
	
	<div id=main>
    	<div id=head>
			<h1 style="font-family: time new roman; font-size: 32px; margin-bottom: 0px; margin-top: 15px;">NHÀ HÀNG PHÚ GIA</h1>
			<h4 style="margin-top: 0px; margin-bottom: 2px; margin-left: 1px">Địa chỉ: LỘC TIẾN,PHÚ LỘC,THỪA THIÊN HUẾ</h4>
			<h4 style="margin-top: 0px; margin-left: 1px">Điện thoại: 0122 XXX XXX - Email: XXXXXX@gmail.com</h4>
    	</div>
    	<div id=headName>
			<h1 style="font-family: monospace; font-size: 35px; margin-bottom: 0px; margin-top: 0px; margin-bottom: 0px; text-align: center;">
				HÓA ĐƠN THANH TOÁN
			</h1>
  		</div>
  		<%
  				long tongGia=0;
				int index=0;
				ArrayList<Food> listFood = (ArrayList<Food>) request.getAttribute("listFood");
				String gioHienTai = (String) request.getAttribute("gioHienTai");
				String tableNumber = (String) request.getAttribute("tableNumber");
		%>
  		<div id=headInfoLeft>
			<h4 style="margin-top: 0px; margin-bottom: 2px;">Bàn số: <%=tableNumber%></h4>
  		</div>
  		<div id=headInfoLeft>
			<h4 style="margin-top: 0px; margin-bottom: 2px; text-align: right">Thời gian: <%=gioHienTai%></h4>
  		</div>
  		<div id=content>
  			<%
				if(listFood != null){  			
  			%>
  			
  			<table border="1" style="width: 100%; border: 0px; border-collapse: collapse; border-spacing: 0;">
  				<thead>
  					<tr style="height: 40px">
	  					<th style="width: 10%; text-align: center; background-color: whitesmoke; "><b>STT</b></th>
	  					<th style="width: 35%; background-color: whitesmoke; text-align: center"><b>Tên món ăn</b></th>
	  					<th style="width: 15%; background-color: whitesmoke; text-align: center"><b>Số lượng</b></th>
	  					<th style="width: 20%; background-color: whitesmoke; text-align: center"><b>Đơn giá</b></th>
	  					<th style="width: 20%; background-color: whitesmoke; text-align: center"><b>Ghi chú</b></th>
  					</tr>
  				</thead>
  				<tbody>
  				<%  					
  					for(Food s : listFood){
	  					index++;
	  					tongGia+=(long)s.getGia()*s.getSoluongchebien();
	  				    String tam=Long.toString(((long)s.getGia()));
	  					String gia="";
	  					int d=tam.length()%3;
	  					for(int i=0;i<tam.length();i++){
	  						if((i+1)%3==d && i!=tam.length()-1) gia+=tam.charAt(i)+".";
	  						else gia+=tam.charAt(i);
	  					}
  				%>
	  					<tr style="height: 35px" class="zzBody">
		  					<td style="text-align: center"><%=index%></td>
		  					<td style="text-align: center"><%=s.getTenmon()%></td>
		  					<td style="text-align: center"><%=s.getSoluongchebien()%></td>
		  					<td style="text-align: center"><%=gia%> VNĐ</td>
		  					<td style="text-align: center"><%=s.getGhichu()%></td>
	  					</tr>
  			   	<%
  			   		}//for
  			   	%>
  				</tbody>
  			</table>
  			<br>
  				<%
		  			String tam=Long.toString(tongGia);
				    String gia="";
				    int d=tam.length()%3;
				    for(int i=0;i<tam.length();i++){
						if((i+1)%3==d && i!=tam.length()-1) gia+=tam.charAt(i)+".";
						else gia+=tam.charAt(i);
				 	}
  				%>
  			<table style="width: 100%;">
  				<tr>
  					<td style="width: 65%"></td>
	  				<td style="width: 15%; background-color: whitesmoke; text-align: center"><b>TỔNG TIỀN</b></td>
	  				<td style="width: 20%; background-color: whitesmoke; text-align: center"><b><%=gia%> VNĐ</b></td>
  				</tr>
  			</table>
  			<%
  			   }//if
  			%>
  		</div>
  		<div id=footer>
  			<h4 style="margin-top: 0px; text-align: center">Cảm ơn quý khách đã ủng hộ nhà hàng Phú Gia !</h4>
  		</div>
  	</div>
</body>
</html>