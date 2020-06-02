package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import setting.ConnectDB;

public class QuanLyBanDAO {
	public static String deleteListTable(ArrayList<String> arrayTable) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		int maChiTietGoiMon;
		try{
		
			for(int i=0;i<arrayTable.size();i++){
				sql = "{call checkTableBeforeDelete(?)}";
				CallableStatement stmt = con.prepareCall(sql);
				stmt.setInt(1, Integer.parseInt(arrayTable.get(i)));
				ResultSet rs = stmt.executeQuery();
				
				maChiTietGoiMon = -1;
				
				if(rs.next()){		
					maChiTietGoiMon = 0;				
				}	

				stmt.close();
				
				//Nếu có bất kỳ 1 bàn nào đang sử dụng thì hủy thao tác xóa bàn
				if(maChiTietGoiMon != -1) return "error";
			}
			
			System.out.print("Quản lý vừa xóa các bàn:   ");
			for(int i=0;i<arrayTable.size();i++){
				sql="{call deleteTable(?)}";				
				CallableStatement stmt2 = con.prepareCall(sql);
				stmt2.setInt(1, Integer.parseInt(arrayTable.get(i)));
				stmt2.execute();
					
				stmt2.close();
				System.out.print(arrayTable.get(i)+"   ");				
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
		return null;
	}

	public static String addTable(int soLuong) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		int table = 0;
		ResultSet rs=null;
		PreparedStatement stmt=null;
		String message="";
		try{
			System.out.print("Quản lý vừa thêm các bàn:  ");
			for(int i=0;i<soLuong;i++){
				sql = "SELECT TOP 1 soban FROM BAN WHERE xoaban= ?";
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, 1);
				rs = stmt.executeQuery();
				
				if(rs.next()){		
					//Nếu có bàn xoaban=1 thì UPDATE bàn đó xoaban=0
					table=rs.getInt("soban");				
				}else{
					//Nếu không có bàn nào xoaban=1 thì INSERT bàn mới
					sql = "SELECT soban FROM BAN";
					stmt = con.prepareStatement(sql);
					rs = stmt.executeQuery();
					int tam=0;
					while(rs.next()){
						tam++;
					}
					table=tam+1;;	
				}
					
				stmt.close();
				
				sql="{call addTable(?)}";				
				CallableStatement stmt2 = con.prepareCall(sql);
				stmt2.setInt(1, table);
				stmt2.execute();
				
				stmt2.close();
				System.out.print(table+"   ");
				message+=" "+table+" ";
			}
			System.out.println();
			
			return message;

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

	public static void changeTable(int from, int to) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		try{
			sql="{call changeTable(?,?)}";				
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setInt(1, from);
			stmt.setInt(2, to);
			stmt.execute();
				
			System.out.println("Quản lý hoặc admin đã chuyển bàn số  "+from+" sang bàn "+to);

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
