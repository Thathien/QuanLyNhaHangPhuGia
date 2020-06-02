package com.NhaHang.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import setting.ConnectDB;

public class GoiPhucVuDAO {
	public static String goiPhucVu(String tableNumber) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		try{
			String sql="UPDATE BAN SET goiphucvu = 1 WHERE soban = ?";				
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(tableNumber));
			stmt.execute();
				
			System.out.println("Khách hàng bàn "+tableNumber+" vừa yêu cầu gọi phục vụ!");
				
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
		return null;
	}
}
