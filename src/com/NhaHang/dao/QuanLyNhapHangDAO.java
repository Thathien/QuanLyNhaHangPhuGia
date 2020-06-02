package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class QuanLyNhapHangDAO {
	public static String deleteHoaDon(ArrayList<String> arrayHoaDon) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		try{
			
			System.out.print("Quản lý vừa xóa các đơn  nhập hàng vào kho có stt:   ");
			for(int i=0;i<arrayHoaDon.size();i++){
				sql = "{call deleteHoaDon(?)}";
				CallableStatement stmt = con.prepareCall(sql);
				stmt.setInt(1, Integer.parseInt(arrayHoaDon.get(i)));
				stmt.execute();
				stmt.close();
				
				System.out.print(arrayHoaDon.get(i)+"   ");
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

	public static ArrayList<HoaDon> getChiTietHoaDon(String madonhang) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		ArrayList<HoaDon> chiTietHoaDon = new ArrayList<HoaDon>();
		
		try{
			String sql = "{call getChiTietHoaDon(?)}";				
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(madonhang));
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){	
				HoaDon hoaDon = new HoaDon();
				
				hoaDon.setMadonhang(rs.getInt("madonhang"));
				hoaDon.setStt(rs.getInt("stt"));
				hoaDon.setTenhang(rs.getString("tenhang"));
				hoaDon.setDonvitinh(rs.getString("donvitinh"));
				hoaDon.setSoluong(rs.getInt("soluong"));
				hoaDon.setGia(rs.getFloat("gia"));
				
				chiTietHoaDon.add(hoaDon);
			}	
			
			return chiTietHoaDon;
			
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

	public static String addHoaDon(String tendonhang, String ngaythang) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		CallableStatement stmt=null;
		
		try{
			sql="{call addHoaDon(?,?,?)}";
			stmt = con.prepareCall(sql);
			stmt.setString(1, tendonhang);
			stmt.setString(2, ngaythang);
			stmt.setInt(3, 0); //daxoa
			
			ResultSet rs = stmt.executeQuery();
			rs.next();
			String madonhang = ""+rs.getInt("madonhang");
			
			System.out.println("Quản lý đã thêm 1 đơn hàng mới vào đơn nhập hàng !");
			
			return madonhang;
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

	public static HoaDon getDonHang(String madonhang) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		CallableStatement stmt=null;
		HoaDon hoaDon = null;
		try{
			sql="{call getDonHang(?)}";
			stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(madonhang));
			
			ResultSet rs = stmt.executeQuery();
				
			while(rs.next()){
				if(rs.getInt("daxoa") == 0){
					hoaDon = new HoaDon();
					
					hoaDon.setMadonhang(rs.getInt("madonhang"));
					hoaDon.setTendonhang(rs.getString("tendonhang"));
					
					String ngay=rs.getString("ngaynhap");
					ngay=ngay.substring(0,ngay.length()-5);
					String thoigian=ngay.substring(8,10)+"/"+ngay.substring(5,7)+"/"+ngay.substring(0,4);
					
					hoaDon.setNgaynhap(thoigian);
				}
			}
			
			return hoaDon;
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

	public static void addMatHang(String madonhang, String tenhang, String donvitinh, String soluong, String gia) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		CallableStatement stmt=null;
		java.util.Date date = new java.util.Date();
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		String sdate=dateFormat.format(date);
		try{
			sql="{call addMatHang(?,?,?,?,?)}";
			stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(madonhang));
			stmt.setString(2, tenhang);
			stmt.setString(3, donvitinh);
			stmt.setInt(4, Integer.parseInt(soluong));
			stmt.setDouble(5, Double.parseDouble(gia));
			
			stmt.execute();
			
			System.out.println("Quản lý đã thêm 1 mặt hàng mới vào đơn hàng có mã: "+madonhang +" vào ngày " +sdate);
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static String deleteMatHang(ArrayList<String> arrayMatHang) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		try{
			
			System.out.print("Quản lý vừa xóa các mặt hàng có stt:   ");
			for(int i=0;i<arrayMatHang.size();i++){
				sql = "{call deleteMatHang(?)}";
				CallableStatement stmt = con.prepareCall(sql);
				stmt.setInt(1, Integer.parseInt(arrayMatHang.get(i)));
				stmt.execute();
				stmt.close();
				
				System.out.print(arrayMatHang.get(i)+"   ");
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

	public static void updateHoaDon(String madonhang, String tendonhang, String ngaythang) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		CallableStatement stmt=null;
		
		try{
			sql="{call updateHoaDon(?,?,?)}";
			stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(madonhang)); 
			stmt.setString(2, tendonhang);
			stmt.setString(3, ngaythang);
			
			stmt.execute();
			
			System.out.println("Quản lý đã cập nhật đơn hàng có mã: "+madonhang);

		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
