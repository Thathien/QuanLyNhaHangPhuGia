package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class ShowQuanLyBanHangDAO {
	public static ArrayList<Table> getInfoListTable() {
		// TODO Auto-generated method stub
		Connection conn = ConnectDB.getConnection();
		ArrayList<Table> listTable=new ArrayList<Table>();
		try{
			String sql = "{call getInfoListTable()}";
			CallableStatement stmt = conn.prepareCall(sql);
			ResultSet rs = stmt.executeQuery();
		    Table s;
		    
		    while(rs.next()){
			   s = new Table();
			   s.setSoban(rs.getInt("soban")); 
			   s.setTrangthaiban(rs.getInt("trangthaiban"));
			   s.setXoaban(rs.getInt("xoaban"));
			   s.setGoiphucvu(rs.getInt("goiphucvu"));
			   listTable.add(s);
		    }
		    
		    return listTable;		    
		}catch (SQLException e) {
		   e.printStackTrace();
		}finally{
		   try{
		      conn.close();
		   } catch (SQLException e) {
		      e.printStackTrace();
		   }
		}
		return null; 
	}
}
