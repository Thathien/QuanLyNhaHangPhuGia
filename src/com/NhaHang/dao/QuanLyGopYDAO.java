package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import setting.ConnectDB;

public class QuanLyGopYDAO {
	public static String updateDaDoc(String stt) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		try{
			String sql = "{call checkReadFeedBack(?)}";
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(stt));
			stmt.execute();
			System.out.println("Góp ý có stt "+stt+" đã được xem!");
			
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

	public static String deleteFeedBack(ArrayList<String> arrayFeedBack) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		try{
			
			System.out.print("Quản lý vừa xóa các góp ý có stt:   ");
			for(int i=0;i<arrayFeedBack.size();i++){
				sql = "{call deleteFeedBack(?)}";
				CallableStatement stmt = con.prepareCall(sql);
				stmt.setInt(1, Integer.parseInt(arrayFeedBack.get(i)));
				stmt.execute();
				stmt.close();
				
				System.out.print(arrayFeedBack.get(i)+"   ");
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

}
