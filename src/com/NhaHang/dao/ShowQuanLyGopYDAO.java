package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class ShowQuanLyGopYDAO {
	public static ArrayList<GopY> getListFeedBack() {
		// TODO Auto-generated method stub
		ArrayList<GopY> listFeedBack=new ArrayList<GopY>();

		Connection con = ConnectDB.getConnection();
		try{
			String sql = "{call getListFeedBack()}";
			CallableStatement stmt = con.prepareCall(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){			
				if(rs.getInt("daxoa") == 0){
					GopY feedBack=new GopY();
					feedBack.setStt(rs.getInt("stt"));
					feedBack.setNoidung(rs.getString("noidung"));
					feedBack.setDadoc(rs.getInt("dadoc"));
					
					String ngay=rs.getString("ngay");
					ngay=ngay.substring(0,ngay.length()-5);
					String thoigian=ngay.substring(11)+" - "+ngay.substring(8,10)+"/"+ngay.substring(5,7)+"/"+ngay.substring(0,4);
					
					feedBack.setNgay(thoigian);
					listFeedBack.add(feedBack);
				}				
			}	
			return listFeedBack;
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
