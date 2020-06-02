package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class QuanLyThucDonDAO {
	public static String addFoodInMenu(String tenmon, int maloai, double gia,	int khuyendung, String anh) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		CallableStatement stmt=null;
//		PreparedStatement stmt2=null;
		
		try{
		
//			 //Kiểm tra trùng tên món
//			 sql="select tenmon from MONAN";
//			 stmt2= con.prepareStatement(sql);
//			 ResultSet rs =stmt2.executeQuery();
//			 while(rs.next()) {
//				 if(tenmon.equals(rs.getString("tenmon"))) return "same";
//			 }
//			 
			
			 //Tên món ăn không bị trùng
			sql="{call addFoodInMenu(?,?,?,?,?,?)}";
			stmt = con.prepareCall(sql);
			stmt.setString(1, tenmon);
			stmt.setDouble(2, gia);
			stmt.setInt(3, maloai);
			stmt.setInt(4, khuyendung);
			stmt.setString(5, anh);
			stmt.setInt(6, 0);
			
			stmt.execute();
			stmt.close();
			System.out.println("Đã thêm món ăn: "+tenmon);
			
			return "ok";
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return "error";
	}

	public static String deleteListFood(ArrayList<String> arrayFood) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		try{
			
			System.out.print("Quản lý vừa xóa các món:   ");
			for(int i=0;i<arrayFood.size();i++){
				sql = "{call deleteFoodInMenu(?)}";
				CallableStatement stmt = con.prepareCall(sql);
				stmt.setInt(1, Integer.parseInt(arrayFood.get(i)));
				stmt.execute();
				stmt.close();
				
				System.out.print(arrayFood.get(i)+"   ");
			}
			
			System.out.println();				
			return "ok";

		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return "error";
	}

	public static String updateFoodInMenu(String mamon, String tenmon, int maloai, double gia, int khuyendung, String anh) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		CallableStatement stmt=null;
		try{
			sql="{call updateFoodInMenu(?,?,?,?,?,?,?)}";
			stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(mamon));
			stmt.setString(2, tenmon);
			stmt.setDouble(3, gia);
			stmt.setInt(4, maloai);
			stmt.setInt(5, khuyendung);
			stmt.setString(6, anh);
			stmt.setInt(7, 0);
			
			stmt.execute();
				
			System.out.println("Đã cập nhật món ăn: "+tenmon+" | Mã món: "+mamon);
			
			return "ok2";
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return "error2";
	}
}
