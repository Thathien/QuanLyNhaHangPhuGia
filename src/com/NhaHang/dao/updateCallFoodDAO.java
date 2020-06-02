package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import setting.ConnectDB;

public class updateCallFoodDAO {
	public static String updateCallFoodChefs(int stt, String trangthaigoi,
			String phanhoidaubep, int soLuongCheBien) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		try{
			//kiểm tra trạng thái món ăn
			// cập nhật trạng thái món ăn theo từng trạng thái
			
			String sql = "SELECT trangthaigoi, soluong FROM CHITIETGOIMON WHERE stt= ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, stt);
			ResultSet rs = stmt.executeQuery();
			rs.next();					
			String status=rs.getString("trangthaigoi");
			
			if(!"Hủy".equals(status)){
				if("Đang chế biến".equals(trangthaigoi)){
					if(soLuongCheBien <= rs.getInt("soluong")){
						String sql2="{call updateCallFood(?,?,?,?)}";				
						CallableStatement stmt2 = con.prepareCall(sql2);
						stmt2.setInt(1, stt);
						stmt2.setString(2, trangthaigoi);
						stmt2.setString(3, phanhoidaubep);
						stmt2.setInt(4, soLuongCheBien);
						stmt2.execute();
						
						System.out.println("Đầu bếp vừa cập nhật 1 yêu cầu: ");
						System.out.println("Id: "+stt);
						System.out.println("Số lượng chế biến: "+soLuongCheBien);
						System.out.println("Trạng thái gọi: "+trangthaigoi);
						System.out.println("Phản hồi đầu bếp: "+phanhoidaubep);
					}else{
						return "wrong";
					}
				}else if("Chế biến xong".equals(trangthaigoi)){
					String sql2="{call updateCallFood(?,?,?,?)}";				
					CallableStatement stmt2 = con.prepareCall(sql2);
					stmt2.setInt(1, stt);
					stmt2.setString(2, trangthaigoi);
					stmt2.setString(3, phanhoidaubep);
					stmt2.setInt(4, rs.getInt("soluong"));
					stmt2.execute();
					
					System.out.println("Đầu bếp vừa cập nhật 1 yêu cầu: ");
					System.out.println("Id: "+stt);
					System.out.println("Số lượng chế biến: "+rs.getInt("soluong"));
					System.out.println("Trạng thái gọi: "+trangthaigoi);
					System.out.println("Phản hồi đầu bếp: "+phanhoidaubep);
				}else{
					String sql2="{call updateCallFood(?,?,?,?)}";				
					CallableStatement stmt2 = con.prepareCall(sql2);
					stmt2.setInt(1, stt);
					stmt2.setString(2, trangthaigoi);
					stmt2.setString(3, phanhoidaubep);
					stmt2.setInt(4, 0);
					stmt2.execute();
					
					System.out.println("Đầu bếp vừa cập nhật 1 yêu cầu: ");
					System.out.println("Id: "+stt);
					System.out.println("Số lượng chế biến: 0");
					System.out.println("Trạng thái gọi: "+trangthaigoi);
					System.out.println("Phản hồi đầu bếp: "+phanhoidaubep);
				}
				
				return "ok";
			}else{
				return "error";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static String updateCallFoodGuest(int stt, String soLuong) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		try{			
			String sql = "SELECT soluongchebien, mamon, soluong FROM CHITIETGOIMON WHERE stt= ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, stt);
			ResultSet rs = stmt.executeQuery();
			rs.next();					
			
			//Kiểm tra món ăn này đã bị xóa hay chưa
			String sqlCheck="SELECT daxoa FROM MONAN WHERE mamon = ?";
			PreparedStatement stmtCheck = con.prepareStatement(sqlCheck);
			stmtCheck.setInt(1, rs.getInt("mamon"));
			ResultSet rsCheck = stmtCheck.executeQuery();
			rsCheck.next();
			
			if(rsCheck.getInt("daxoa") == 1 && Integer.parseInt(soLuong) > rs.getInt("soluong")){
				return "error";
			}			
			
			stmtCheck.close();
			
			//Kiểm tra số lượng thay đổi có lớn hơn số lượng đang chế biến hay không
			int soLuongCheBien = rs.getInt("soLuongCheBien");
			if(soLuongCheBien > Integer.parseInt(soLuong)){
				return "wrong";
			}else{
				String sql2="{call updateCallFoodGuest(?,?)}";				
				CallableStatement stmt2 = con.prepareCall(sql2);
				stmt2.setInt(1, stt);
				stmt2.setInt(2, Integer.parseInt(soLuong));
				stmt2.execute();
				
				System.out.println("Khách hàng vừa cập nhật số lượng món ăn có stt: "+stt);
				
				return "ok";
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
