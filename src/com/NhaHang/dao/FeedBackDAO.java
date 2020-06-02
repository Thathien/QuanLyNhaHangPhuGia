package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import setting.ConnectDB;

public class FeedBackDAO {
	public static String insertFeedBack(String feedBack) {
		// TODO Auto-generated method stub
		Connection con = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();	
		String thoigian=dateFormat.format(date);
		try{
			con = ConnectDB.getConnection();
			String sql = "{call insertFeedBack(?,?)}";
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setString(1, feedBack);
			stmt.setString(2, thoigian);
			stmt.execute();
			
			System.out.println("Khách hàng vừa gửi góp ý: "+feedBack);
			
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
