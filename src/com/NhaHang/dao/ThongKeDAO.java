package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class ThongKeDAO {
	public static ArrayList<LichSuBanHang> getListLichSu(String nam) {
		// TODO Auto-generated method stub
		ArrayList<LichSuBanHang> listLichSu=new ArrayList<LichSuBanHang>();
		Connection con = ConnectDB.getConnection();
		
		double tien[] = {0,0,0,0,0,0,0,0,0,0,0,0,0};
		int hoadon[] = {0,0,0,0,0,0,0,0,0,0,0,0,0};
		
		try{
			String sql = "{call getListLichSu(?)}";
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(nam));
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){							
				switch(rs.getInt("thang")){
				case 1:	tien[1] = rs.getFloat("tongtientrongthang"); hoadon[1] = rs.getInt("tongsohoadon"); break;
				case 2: tien[2] = rs.getFloat("tongtientrongthang"); hoadon[2] = rs.getInt("tongsohoadon"); break;
				case 3: tien[3] = rs.getFloat("tongtientrongthang"); hoadon[3] = rs.getInt("tongsohoadon"); break;
				case 4: tien[4] = rs.getFloat("tongtientrongthang"); hoadon[4] = rs.getInt("tongsohoadon"); break;
				case 5: tien[5] = rs.getFloat("tongtientrongthang"); hoadon[5] = rs.getInt("tongsohoadon"); break;
				case 6: tien[6] = rs.getFloat("tongtientrongthang"); hoadon[6] = rs.getInt("tongsohoadon"); break;
				case 7: tien[7] = rs.getFloat("tongtientrongthang"); hoadon[7] = rs.getInt("tongsohoadon"); break;
				case 8: tien[8] = rs.getFloat("tongtientrongthang"); hoadon[8] = rs.getInt("tongsohoadon"); break;
				case 9: tien[9] = rs.getFloat("tongtientrongthang"); hoadon[9] = rs.getInt("tongsohoadon"); break;
				case 10: tien[10] = rs.getFloat("tongtientrongthang"); hoadon[10] = rs.getInt("tongsohoadon"); break;
				case 11: tien[11] = rs.getFloat("tongtientrongthang"); hoadon[11] = rs.getInt("tongsohoadon"); break;
				case 12: tien[12] = rs.getFloat("tongtientrongthang"); hoadon[12] = rs.getInt("tongsohoadon");
				}		
			}	
			
			for(int i=1;i<=12;i++){
				LichSuBanHang lichSu=new LichSuBanHang();
				lichSu.setThang(i);
				lichSu.setTongtien(tien[i]);
				lichSu.setSohoadon(hoadon[i]);
				listLichSu.add(lichSu);
			}
			
			return listLichSu;
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

	public static ArrayList<LichSuBanHang> getListLichSuNam(String namBatDau, String namKetThuc) {
		// TODO Auto-generated method stub
		ArrayList<LichSuBanHang> listLichSu=new ArrayList<LichSuBanHang>();
		Connection con = ConnectDB.getConnection();
		String sql = "";
		CallableStatement stmt = null;
		ResultSet rs = null;
		
		int d = Integer.parseInt(namKetThuc) - Integer.parseInt(namBatDau);
		
		try{			
			sql = "{call getListLichSuNam(?)}";
			
			for(int i=0;i<=d;i++){
				stmt = con.prepareCall(sql);
				stmt.setInt(1, Integer.parseInt(namBatDau)+i);
				rs = stmt.executeQuery();
				
				if(rs.next()){
					LichSuBanHang lichSu=new LichSuBanHang();
					lichSu.setNam(Integer.parseInt(namBatDau)+i);
					lichSu.setTongtien(rs.getFloat("tongtientrongnam"));
					lichSu.setSohoadon(rs.getInt("tongsohoadon"));
					listLichSu.add(lichSu);
				}else{
					LichSuBanHang lichSu=new LichSuBanHang();
					lichSu.setNam(Integer.parseInt(namBatDau)+i);
					lichSu.setTongtien(0);
					lichSu.setSohoadon(0);
					listLichSu.add(lichSu);
				}
				
				stmt.close();
			}
			
			return listLichSu;
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

	public static ArrayList<LichSuBanHang> getListLichSuKTG(String tuNgay, String denNgay) {
		// TODO Auto-generated method stub
		ArrayList<LichSuBanHang> listLichSu=new ArrayList<LichSuBanHang>();
		Connection con = ConnectDB.getConnection();
		String sql = "";
		CallableStatement stmt = null;
		ResultSet rs = null;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatOut = new SimpleDateFormat("dd/MM/yyyy");
		Date d1 = null;
		Date d2 = null;
		Date iDate = null;
		long diff = 0;
		long iMs = 0;
		
		try {
			d1 = format.parse(tuNgay);
			d2 = format.parse(denNgay);	
			diff = (d2.getTime() - d1.getTime())/(24 * 60 * 60 * 1000);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		try{			
			sql = "{call getListLichSuKTG(?)}";
			for(long i=0;i<=diff;i++){
				iMs = d1.getTime() + i*(24 * 60 * 60 * 1000); // Số ms giây của ngày i
				iDate = new Date(iMs); 
				stmt = con.prepareCall(sql);
				//System.out.println(iMs+"  "+format.format(iDate));
				stmt.setString(1, format.format(iDate)+" 00:00:00.000");
				rs = stmt.executeQuery();
				
				if(rs.next()){
					LichSuBanHang lichSu=new LichSuBanHang();
					lichSu.setNgaythang(formatOut.format(iDate));
					lichSu.setTongtien(rs.getFloat("tongtien"));
					lichSu.setSohoadon(rs.getInt("sohoadon"));
					listLichSu.add(lichSu);
				}else{
					LichSuBanHang lichSu=new LichSuBanHang();
					lichSu.setNgaythang(formatOut.format(iDate));
					lichSu.setTongtien(0);
					lichSu.setSohoadon(0);
					listLichSu.add(lichSu);
				}
				
				stmt.close();
			}
			
			return listLichSu;
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

	public static ArrayList<FoodInThongKe> getListThongKeMonAn(String startDay, String endDay, int sapXep, int top, int type) {
		// TODO Auto-generated method stub
		ArrayList<FoodInThongKe> listFood=new ArrayList<FoodInThongKe>();
		Connection con = ConnectDB.getConnection();
		String sql = "";
		CallableStatement stmt = null;
		ResultSet rs = null;
		
		try{		
			
			if(type==1){
				sql = "{call thongKeMonAn(?,?,?,?)}";
				stmt = con.prepareCall(sql);
				stmt.setString(1, startDay);
				stmt.setString(2, endDay);
				stmt.setInt(3, sapXep);
				stmt.setInt(4, top);
				rs = stmt.executeQuery();
			}else{
				sql = "{call thongKeThucUong(?,?,?,?)}";
				stmt = con.prepareCall(sql);
				stmt.setString(1, startDay);
				stmt.setString(2, endDay);
				stmt.setInt(3, sapXep);
				stmt.setInt(4, top);
				rs = stmt.executeQuery();
			}
			
			
			while(rs.next()){
				FoodInThongKe food = new FoodInThongKe();
				food.setTenmon(rs.getString("tenmon"));
				food.setSoluong(rs.getInt("soluong"));
				
				listFood.add(food);
			}
			
			return listFood;
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
