package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import setting.ConnectDB;

public class thietLapTaiKhoanDAO {
	public static String deleteUser(ArrayList<String> arrayUser) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		try{
			for(int i=0;i<arrayUser.size();i++){
				if("chunhahang".equals(arrayUser.get(i))) return "chunhahang";
			}
			
			System.out.print("Administrator vừa xóa các tài khoản:   ");
			for(int i=0;i<arrayUser.size();i++){
				sql = "{call deleteUser(?)}";
				CallableStatement stmt = con.prepareCall(sql);
				stmt.setString(1, arrayUser.get(i));
				stmt.execute();
				stmt.close();
				
				System.out.print(arrayUser.get(i)+"   ");
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

	public static String addUser(String tenTaiKhoan, String matKhau, String phanQuyen) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		PreparedStatement stmt=null;
		CallableStatement stmt2=null;
		
		try{
			
			sql="SELECT tentaikhoan FROM TAIKHOAN";
			stmt = con.prepareStatement(sql);			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				if(tenTaiKhoan.equals(rs.getString("tentaikhoan"))) return "same";
			}
						
			sql="{call addUser(?,?,?)}";
			stmt2 = con.prepareCall(sql);
			stmt2.setString(1, tenTaiKhoan);
			stmt2.setString(2, matKhau);
			stmt2.setInt(3, Integer.parseInt(phanQuyen));
			
			stmt2.execute();
			
			System.out.println("Administrator đã thêm 1 tài khoản "+phanQuyen+" mới!");
			
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

	public static String changePassword(String tenTaiKhoan, String matKhauHienTai, String matKhauMoi) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		PreparedStatement stmt=null;
		CallableStatement stmt2=null;
		
		try{
			
			sql="SELECT matkhau FROM TAIKHOAN WHERE tentaikhoan = ?";
			stmt = con.prepareStatement(sql);			
			stmt.setString(1, tenTaiKhoan);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				if(!matKhauHienTai.equals(rs.getString("matkhau"))) return "wrong";
			}
						
			sql="{call changePassword(?,?)}";
			stmt2 = con.prepareCall(sql);
			stmt2.setString(1, tenTaiKhoan);
			stmt2.setString(2, matKhauMoi);
			
			stmt2.execute();
			
			System.out.println("Administrator đã thay đổi mật khẩu tài khoản: "+tenTaiKhoan);
			
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
