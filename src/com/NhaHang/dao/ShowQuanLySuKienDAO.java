package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class ShowQuanLySuKienDAO {
	public static ArrayList<SuKien> getEvent() {
		// TODO Auto-generated method stub
		ArrayList<SuKien> listEvent=new ArrayList<SuKien>();

		Connection con = ConnectDB.getConnection();
		try{
			String sql = "{call getListEvent()}";
			CallableStatement stmt = con.prepareCall(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){			
				if(rs.getInt("daxoa") == 0){
					SuKien event = new SuKien();
					event.setStt(rs.getInt("stt"));
					event.setNoidung(rs.getString("noidung"));
					event.setHienthi(rs.getInt("hienthi"));
					
					String ngay=rs.getString("ngaythang");
					ngay=ngay.substring(0,ngay.length()-5);
					String thoigian=ngay.substring(11)+" - "+ngay.substring(8,10)+"/"+ngay.substring(5,7)+"/"+ngay.substring(0,4);
					
					event.setNgaythang(thoigian);
					listEvent.add(event);
				}				
			}	
			return listEvent;
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

	public static ArrayList<SuKien> getEventForGuest() {
		// TODO Auto-generated method stub
		ArrayList<SuKien> listEvent=new ArrayList<SuKien>();

		Connection con = ConnectDB.getConnection();
		try{
			String sql = "{call getListEvent()}";
			CallableStatement stmt = con.prepareCall(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){			
				if(rs.getInt("daxoa") == 0 && rs.getInt("hienthi") == 1){
					SuKien event = new SuKien();
					event.setNoidung(rs.getString("noidung"));

					listEvent.add(event);
				}				
			}	
			return listEvent;
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
