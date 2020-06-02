package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;

import com.NhaHang.bean.FoodGuestCall;
import setting.ConnectDB;

public class showQuanLyGoiMonDAO {
	public static ArrayList<FoodGuestCall> getListFoodGuestCall() {
		// TODO Auto-generated method stub
		ArrayList<FoodGuestCall> listFoodGuestCall=new ArrayList<FoodGuestCall>();
		Connection con = ConnectDB.getConnection();
		try{
			String sql = "{call getListFoodGuestCall()}";
				
			CallableStatement stmt = con.prepareCall(sql);
						
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){	
				if(!"Hủy".equals(rs.getString("trangthaigoi")) 
						&& !"Chế biến xong".equals(rs.getString("trangthaigoi"))
						&& !"Từ chối".equals(rs.getString("trangthaigoi"))){
					FoodGuestCall foodGuestCall = new FoodGuestCall();
						
					foodGuestCall.setSoban(rs.getInt("soban"));
					foodGuestCall.setMagoimon(rs.getInt("magoimon"));
					foodGuestCall.setTenmon(rs.getString("tenmon"));
					foodGuestCall.setSoluong(rs.getInt("soluong"));
					foodGuestCall.setSoluongchebien(rs.getInt("soluongchebien"));
					foodGuestCall.setGia(rs.getFloat("gia"));
					foodGuestCall.setTrangthaigoi(rs.getString("trangthaigoi"));
					foodGuestCall.setPhanhoidaubep(rs.getString("phanhoidaubep"));
					
					String ngay=rs.getString("thoigian");
					ngay=ngay.substring(0,ngay.length()-2);
					String thoigian= ngay.substring(11,13)+":"+ngay.substring(14,16)+" "+ngay.substring(8,10)+"/"+ngay.substring(5,7)+"/"+ngay.substring(0,4);
					foodGuestCall.setThoigian(thoigian);
					
					foodGuestCall.setStt(rs.getInt("stt"));				
						
					listFoodGuestCall.add(foodGuestCall);
				}
			}	
				
			return listFoodGuestCall;
			
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

	public static ArrayList<FoodGuestCall> getListYeuCauThem(LinkedHashSet<Integer> hs) {
		// TODO Auto-generated method stub
		ArrayList<FoodGuestCall> listYeuCauThem=new ArrayList<FoodGuestCall>();
		Connection con = ConnectDB.getConnection();
		CallableStatement stmt = null;
		ResultSet rs = null;
		int soBan;
		try{
			String sql = "{call getYeuCauThem(?)}";
				
			for(Iterator<Integer> i = hs.iterator(); i.hasNext();){	
				soBan = i.next();
				stmt = con.prepareCall(sql);
				stmt.setInt(1, soBan);
				rs = stmt.executeQuery();
				
				while(rs.next()){	
					FoodGuestCall foodGuestCall = new FoodGuestCall();
					foodGuestCall.setSoban(rs.getInt("soban"));
					foodGuestCall.setYeucauthem(rs.getString("yeucauthem"));
					listYeuCauThem.add(foodGuestCall);
				}
				
				stmt.close();
			}
	
			return listYeuCauThem;
			
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
