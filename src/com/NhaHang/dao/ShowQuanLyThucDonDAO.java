package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class ShowQuanLyThucDonDAO {
	public static ArrayList<Food> getListFood(int sapXep) {
		// TODO Auto-generated method stub
		Connection conn = ConnectDB.getConnection();
		ArrayList<Food> listFood=new ArrayList<Food>();
		try{
			String sql = "{call getListFoodInQuanLyThucDon(?)}";
			CallableStatement stmt = conn.prepareCall(sql);
			stmt.setInt(1, sapXep);
			ResultSet rs = stmt.executeQuery();
		    Food s;
		    
		    while(rs.next()){
		       if(rs.getInt("daxoa") == 0){	       
				   s = new Food();
				   s.setMamon(rs.getInt("mamon")); 
				   s.setTenmon(rs.getString("tenmon"));
				   s.setTenloai(rs.getString("tenloai"));
				   s.setGia(rs.getFloat("gia")); 
				   s.setKhuyendung(rs.getInt("khuyendung")); 
				   s.setAnh(rs.getString("anh")); 
				   listFood.add(s);
		       }
		    }
		    
		    return listFood;		    
		}catch (SQLException e) {
		   e.printStackTrace();
		}finally{
		   try{
		      conn.close();
		   } catch (SQLException e) {
		      e.printStackTrace();
		   }
		}
		return null; 
	}

	public static Food getFood(String mamon) {
		// TODO Auto-generated method stub
		Connection conn = ConnectDB.getConnection();
		try{
			String sql = "{call getFoodUpdate(?)}";
			CallableStatement stmt = conn.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(mamon));
			ResultSet rs = stmt.executeQuery();
		    Food  s = new Food();
		    
		    while(rs.next()){     				  
				   s.setMamon(rs.getInt("mamon")); 
				   s.setMaloai(rs.getInt("maloai")); 
				   s.setTenmon(rs.getString("tenmon"));
				   s.setTenloai(rs.getString("tenloai"));
				   s.setGia(rs.getFloat("gia")); 
				   s.setKhuyendung(rs.getInt("khuyendung")); 
				   s.setAnh(rs.getString("anh")); 
		    }
		    
		    return s;		    
		}catch (SQLException e) {
		   e.printStackTrace();
		}finally{
		   try{
		      conn.close();
		   } catch (SQLException e) {
		      e.printStackTrace();
		   }
		}
		return null; 
	}
}
