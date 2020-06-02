package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import setting.ConnectDB;

public class BaoThanhToanDAO {
	public static String baoThanhToan(String tableNumber) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		try{
			String sql="{call checkBaoThanhToan(?)}";		
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(tableNumber));
			ResultSet rs = stmt.executeQuery();

			if(!rs.next()){		
				//Nếu không có món ăn nào được gọi thì hủy báo thanh toán
				return "error";				
			}else{
				String sql2="{call baoThanhToan(?,?,?)}";				
				CallableStatement stmt2 = con.prepareCall(sql2);
				stmt2.setInt(1, Integer.parseInt(tableNumber));
				stmt2.setString(2, "Hủy");
				stmt2.setString(3, "Chế biến xong");
				stmt2.execute();
				
				System.out.println("Khách hàng bàn "+tableNumber+" vừa báo thanh toán!");
				
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
