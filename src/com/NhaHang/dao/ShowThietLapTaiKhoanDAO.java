package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class ShowThietLapTaiKhoanDAO {
	public static ArrayList<User> getListUser() {
		// TODO Auto-generated method stub
		ArrayList<User> listUser=new ArrayList<User>();

		Connection con = ConnectDB.getConnection();
		try{
			String sql = "{call getListUser()}";
			CallableStatement stmt = con.prepareCall(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){			
				User user = new User();
				user.setUserName(rs.getString("tentaikhoan"));
				user.setPassword(rs.getString("matkhau"));
				user.setQuyen(rs.getInt("quyen"));
					
				listUser.add(user);				
			}	
			return listUser;
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
