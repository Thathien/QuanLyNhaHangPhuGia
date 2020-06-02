package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.NhaHang.bean.User;

import setting.ConnectDB;

public class CheckLoginDAO {
	public static User checkLogin(String username,String password) {
		Connection con=null;
		
		CallableStatement stmt;
		try {
			con=ConnectDB.getConnection();
			String sql="{call checklogin(?,?)}";
			stmt = con.prepareCall(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs=stmt.executeQuery();
			if(rs.next()) {
				User user= new User();
				user.setUserName(rs.getString("tentaikhoan"));
				user.setQuyen(rs.getInt("quyen"));
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	
}
