package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class QuanLySuKienDAO {
	public static String deleteEvent(ArrayList<String> arrayEvent) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		PreparedStatement stmt=null;
		String sql="";
		try{
			System.out.print("Quản lý vừa xóa các sự kiện :   ");
			for(int i=0;i<arrayEvent.size();i++){
//				sql = "{call deleteEvent(?)}";
				sql="update SUKIEN set daxoa=1 where stt=?";
//				CallableStatement stmt = con.prepareCall(sql);
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, Integer.parseInt(arrayEvent.get(i)));
				stmt.execute();
				stmt.close();
				
				System.out.print(arrayEvent.get(i)+"   ");
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

	public static String addEvent(String noidung, String hienthi) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
//		CallableStatement stmt=null;
		PreparedStatement stmt=null;
		PreparedStatement stmt2=null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();	
		String thoigian=dateFormat.format(date);
		
		try{
			sql="select noidung from SUKIEN where daxoa <>1";
			stmt2=con.prepareStatement(sql);
			ResultSet rs=stmt2.executeQuery();
			while(rs.next()) {
				if(noidung.equals(rs.getString("noidung"))) return "same";
			}
//			sql="{call addEvent(?,?,?,?)}";
			sql="insert into SUKIEN(ngaythang,noidung,daxoa,hienthi) values (?,?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, thoigian);
			stmt.setString(2, noidung);
			stmt.setInt(3, 0); //daxoa
			stmt.setInt(4, Integer.parseInt(hienthi));
			
			stmt.execute();
			
			System.out.println("Quản lý đã thêm 1 sự kiện vào lúc: "+thoigian);
			
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

	public static SuKien getEvent(String stt) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		SuKien event = new SuKien();
		try{
			String sql = "{call getEvent(?)}";
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(stt));
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){			
				event.setStt(rs.getInt("stt"));
				event.setNoidung(rs.getString("noidung"));
				event.setHienthi(rs.getInt("hienthi"));			
			}	
			return event;
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

	public static String updateEvent(String stt2, String noidung2, String hienthi2) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		CallableStatement stmt=null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();	
		String thoigian=dateFormat.format(date);
		
		try{
			sql="{call updateEvent(?,?,?,?)}";
			stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(stt2));
			stmt.setString(2, thoigian);
			stmt.setString(3, noidung2);
			stmt.setInt(4, Integer.parseInt(hienthi2));
			
			stmt.execute();
				
			System.out.println("Quản lý đã cập nhật 1 sự kiện vào lúc: "+thoigian);
			
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
