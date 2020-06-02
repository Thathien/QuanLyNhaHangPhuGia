package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import setting.ConnectDB;

public class goiMonDAO {
	public static String callFood(String tableNumber, int maMon, String soLuong) {
		Connection con = ConnectDB.getConnection();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();	
		String thoigian=dateFormat.format(date);
		try{
			
			String sqlCheck="SELECT daxoa FROM MONAN WHERE mamon = ?";
			PreparedStatement stmtCheck = con.prepareStatement(sqlCheck);
			stmtCheck.setInt(1, maMon);
			ResultSet rsCheck = stmtCheck.executeQuery();
			rsCheck.next();
			
			if(rsCheck.getInt("daxoa") == 0){
				String sql = "{call callFood(?,?,?,?,?,?,?,?)}";
				CallableStatement stmt = con.prepareCall(sql);
		
				stmt.setInt(1, Integer.parseInt(tableNumber)); //soban
				stmt.setInt(2, 0); //trangthaitinhtien
				stmt.setString(3, thoigian); //ngaygoi
				stmt.setInt(4, maMon); //mamon
				stmt.setInt(5, Integer.parseInt(soLuong)); //soluong
				stmt.setInt(6, 0); //soluongchebien
				stmt.setString(7, "Đang chờ..."); //trangthaigoi
				stmt.setInt(8, 0); //baodoilauthanhtoan
				stmt.execute();
//				System.out.println("Khách hàng tại bàn số :" +tableNumber+" Đã gọi món có stt:"+maMon+" Số lượng "+ soLuong);
				return "ok";
			}else{
				return "no";
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
		
		return "error";
	}
}
