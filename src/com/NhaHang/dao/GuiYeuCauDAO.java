package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import setting.ConnectDB;

public class GuiYeuCauDAO {
	public static String insertFeedBack(String soBan, String noiDungYeuCau) {
		// TODO Auto-generated method stub
		Connection con = null;
		try{
			con = ConnectDB.getConnection();
			String sql = "{call insertYeuCau(?,?)}";
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setString(1, noiDungYeuCau);
			stmt.setInt(2, Integer.parseInt(soBan));
			stmt.execute();
			
			System.out.println("Khách hàng bàn "+soBan+" vừa gửi yêu cầu thêm đến bộ phận đầu bếp.");
			
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
}
