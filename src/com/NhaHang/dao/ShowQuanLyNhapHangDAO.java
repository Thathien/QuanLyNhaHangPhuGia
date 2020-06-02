package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class ShowQuanLyNhapHangDAO {
	public static ArrayList<HoaDon> getListHoaDon() {
		// TODO Auto-generated method stub
		ArrayList<HoaDon> listHoaDon=new ArrayList<HoaDon>();
		Connection con = ConnectDB.getConnection();
		try{
			String sql = "{call getListHoaDon()}";
				
			CallableStatement stmt = con.prepareCall(sql);
						
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){	
				if(rs.getInt("daxoa") == 0){
					HoaDon hoaDon = new HoaDon();
						
					hoaDon.setMadonhang(rs.getInt("madonhang"));
					hoaDon.setTendonhang(rs.getString("tendonhang"));
					
					String ngay=rs.getString("ngaynhap");
					ngay=ngay.substring(0,ngay.length()-5);
					String thoigian=ngay.substring(8,10)+"/"+ngay.substring(5,7)+"/"+ngay.substring(0,4);
					hoaDon.setNgaynhap(thoigian);
					
					listHoaDon.add(hoaDon);
				}
			}	
			
			return listHoaDon;
			
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
