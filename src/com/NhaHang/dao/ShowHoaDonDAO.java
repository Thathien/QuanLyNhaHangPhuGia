package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.NhaHang.bean.Food;
import setting.ConnectDB;

public class ShowHoaDonDAO {
	public static ArrayList<Food> getListFood(String tableNumber) {
		// TODO Auto-generated method stub
		ArrayList<Food> listFood=new ArrayList<Food>();
		Connection con = ConnectDB.getConnection();
		try{
			String sql = "{call getListFood(?)}";
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(tableNumber));
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){				
				if("Chế biến xong".equals(rs.getString("trangthaigoi")) || "Đang chế biến".equals(rs.getString("trangthaigoi"))){
					Food food=new Food();
					food.setTenmon(rs.getString("tenmon"));
					food.setSoluongchebien(rs.getInt("soluongchebien"));
					food.setGia(rs.getFloat("gia"));
					food.setMagoimon(rs.getInt("magoimon"));
					food.setSoban(rs.getInt("soban"));
					food.setGhichu("................................");
					listFood.add(food);
				}
			}	
			
			System.out.println("Quản lý vừa tính tiền cho khách hàng bàn "+tableNumber);
			return listFood;
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

	public static void updateTrangThaiTinhTien(ArrayList<Integer> listMaGoiMon) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		try{
			System.out.print("Cập nhật trạng thái tính tiền lên 1 cho các mã gọi món:   ");
			for(int i=0;i<listMaGoiMon.size();i++){
				String sql = "{call updateTrangThaiTinhTien(?,?,?)}";
				CallableStatement stmt = con.prepareCall(sql);
				stmt.setInt(1, listMaGoiMon.get(i));	
				stmt.setString(2, "Hủy");	
				stmt.setString(3, "Chế biến xong");	
				stmt.execute();
				
				System.out.print(listMaGoiMon.get(i)+"   ");
			}			
			System.out.println();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void luuLichSuBanHang(ArrayList<Integer> listMaGoiMon) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql= "";
		PreparedStatement stmt = null;
		CallableStatement stmt2 = null;
		ResultSet rs = null; 
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();	
		String thoigian=dateFormat.format(date);
		thoigian = thoigian + " 00:00:00.000";
		int kt = 0;
		double tongtien = 0;
		int sohoadon = 0;
		try{
			//Kiểm tra xem ngày này đã có trong CSDL chưa
			sql = "SELECT ngaythang FROM LICHSUBANHANG WHERE ngaythang = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, thoigian);			
			rs = stmt.executeQuery();
			while(rs.next()){				
				kt = 1;
			}	
			stmt.close();
			
			//Nếu chưa có ngày này trong CSDL thì INSERT
			if(kt == 0){
				sql = "INSERT INTO LICHSUBANHANG (ngaythang, tongtien,sohoadon) VALUES (?,?,?)";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, thoigian);			
				stmt.setInt(2, 0); //tongtien
				stmt.setInt(3, 0); //sohoadon
				stmt.execute();
				stmt.close();
			}
			
			//Lấy tổng tiền và số hóa đơn hiện tại trong CSDL
			sql = "SELECT tongtien, sohoadon FROM LICHSUBANHANG WHERE ngaythang = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, thoigian);			
			rs = stmt.executeQuery();
			rs.next();
			tongtien = rs.getFloat("tongtien");
			sohoadon = rs.getInt("sohoadon");
			
			//Lấy tổng tiền cập nhật sau khi thanh toán
			for(int i=0;i<listMaGoiMon.size();i++){
				sql = "{call getTien(?)}";
				stmt2 = con.prepareCall(sql);
				stmt2.setInt(1, listMaGoiMon.get(i));		
				rs = stmt2.executeQuery();
				
				while(rs.next()){
					tongtien += rs.getFloat("gia")*rs.getInt("soluongchebien");
				}
				
				stmt2.close();
			}	
			
			//Cập nhật tổng tiền và số hóa đơn vào CSDL
			sql = "UPDATE LICHSUBANHANG SET tongtien = ?, sohoadon = ? WHERE ngaythang = ?";
			stmt = con.prepareStatement(sql);
			stmt.setDouble(1, tongtien);
			stmt.setInt(2, sohoadon+1);
			stmt.setString(3, thoigian);			
			stmt.execute();
			
			System.out.println("Đã cập nhật lịch sử bán hàng!");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
