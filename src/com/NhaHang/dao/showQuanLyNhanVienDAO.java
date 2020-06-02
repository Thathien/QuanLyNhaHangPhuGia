package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class showQuanLyNhanVienDAO {
	public static ArrayList<NhanVien> getListNhanVien(int sapXep) {
		// TODO Auto-generated method stub
		ArrayList<NhanVien> listNhanVien=new ArrayList<NhanVien>();
		Connection con = ConnectDB.getConnection();
		try{
			String sql = "{call getListNhanVien(?)}";
				
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setInt(1, sapXep);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){	
				if(rs.getInt("daxoa") == 0){
					NhanVien nhanVien = new NhanVien();
						
					nhanVien.setManv(rs.getInt("manv"));
					nhanVien.setTennv(rs.getString("tennv"));
					nhanVien.setGioitinh(rs.getInt("gioitinh"));
					nhanVien.setQuequan(rs.getString("quequan"));
					nhanVien.setCmnd(rs.getString("cmnd"));
					nhanVien.setDienthoai(rs.getString("dienthoai"));
					nhanVien.setLuongcoban(rs.getFloat("luongcoban"));
					nhanVien.setChucvu(rs.getInt("chucvu"));
					
					String ngay=rs.getString("ngaysinh");
					ngay=ngay.substring(0,ngay.length()-5);
					String thoigian=ngay.substring(8,10)+"/"+ngay.substring(5,7)+"/"+ngay.substring(0,4);
					nhanVien.setNgaysinh(thoigian);
					
					
					listNhanVien.add(nhanVien);
				}
			}	
			
			return listNhanVien;
			
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
