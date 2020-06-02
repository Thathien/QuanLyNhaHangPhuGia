package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.Food;
import setting.ConnectDB;

public class ShowGoiMonDAO {
		public static ArrayList<Food> getListFood() {
			// TODO Auto-generated method stub
			ArrayList<Food> listFood=new ArrayList<Food>();
			Connection con = ConnectDB.getConnection();
			try{
				String sql = "{call getMenu()}";
				CallableStatement stmt = con.prepareCall(sql);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()){				
					if(rs.getInt("daxoa") == 0){
						Food food=new Food();
						food.setMaloai(rs.getInt("maloai"));
						food.setTenmon(rs.getString("tenmon"));
						food.setGia(rs.getFloat("gia"));
						food.setKhuyendung(rs.getInt("khuyendung"));
						food.setAnh(rs.getString("anh"));
						food.setTenloai(rs.getString("tenloai"));
						food.setMamon(rs.getInt("mamon"));
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
		public static ArrayList<String> getListTypeFood() {
			// TODO Auto-generated method stub
			Connection con = ConnectDB.getConnection();
			ArrayList<String> listTypeFood = new ArrayList<String>();
			try{
				String sql = "{call getListTypeFood()}";
				CallableStatement stmt = con.prepareCall(sql);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()){					
					listTypeFood.add(rs.getString("tenloai"));
				}	
				return listTypeFood;
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
		public static boolean checkTable(String tableNumberSession) {
			// TODO Auto-generated method stub
			Connection con = ConnectDB.getConnection();
			try{
				String sql = "{call checkTable(?)}";
				CallableStatement stmt = con.prepareCall(sql);
				stmt.setInt(1, Integer.parseInt(tableNumberSession));
				ResultSet rs = stmt.executeQuery();
				rs.next();
				if(rs.getInt("xoaban") == 0){
					return true;
				}else{
					return false;
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
			return false;
		}

}
