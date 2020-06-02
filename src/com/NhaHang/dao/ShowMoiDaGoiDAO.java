package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.Food;
import setting.ConnectDB;

public class ShowMoiDaGoiDAO {
	public static ArrayList<Food> getListFoodCall(String tableNumber) {
		// TODO Auto-generated method stub
		ArrayList<Food> listFoodCall=new ArrayList<Food>();
		Connection con = ConnectDB.getConnection();
		try{
			String sql = "{call getListFoodCall(?)}";
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(tableNumber));
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){				
				if(!"Hủy".equals(rs.getString("trangthaigoi"))){
					Food food=new Food();
					food.setTenmon(rs.getString("tenmon"));
					food.setSoluong(rs.getInt("soluong"));
					food.setSoluongchebien(rs.getInt("soluongchebien"));
					food.setTrangthaigoi(rs.getString("trangthaigoi"));
					food.setPhanhoidaubep(rs.getString("phanhoidaubep"));
					food.setGia(rs.getFloat("gia"));
					food.setStt(rs.getInt("stt"));
					listFoodCall.add(food);
				}
			}	
			return listFoodCall;
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
