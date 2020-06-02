package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class ShowChiTietBanDAO {
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
					food.setStt(rs.getInt("stt"));
					listFood.add(food);
				}
			}	
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
}
