package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import setting.ConnectDB;

public class deleteFoodCallDAO {
	public static String deleteFoodCall(int stt) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		try{
			String sql = "SELECT trangthaigoi FROM CHITIETGOIMON WHERE stt= ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, stt);
			ResultSet rs = stmt.executeQuery();
			rs.next();					
			String status=rs.getString("trangthaigoi");
			
			if("Đang chờ...".equals(status) || "Từ chối".equals(status)){
				String sql2="{call deleteFoodCall(?,?)}";				
				CallableStatement stmt2 = con.prepareCall(sql2);
				stmt2.setInt(1, stt);
				stmt2.setString(2, "Hủy");
				stmt2.execute();
				
				System.out.println("Khách hàng vừa hủy gọi món ăn có id: "+stt);
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
}
