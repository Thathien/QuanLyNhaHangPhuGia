package com.NhaHang.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.NhaHang.bean.*;
import setting.ConnectDB;

public class QuanLyNhanVienDAO {
	public static String deleteNhanVien(ArrayList<String> arrayNhanVien) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		CallableStatement stmt = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		String sql="";
		int check;
		try{
			
			for(int i=0;i<arrayNhanVien.size();i++){
				sql = "{call checkNhanVienBeforeDelete(?)}";
				stmt = con.prepareCall(sql);
				stmt.setInt(1, Integer.parseInt(arrayNhanVien.get(i)));
				rs = stmt.executeQuery();
				check = -1;
				
				if(rs.next()){		
					check = 0;				
				}	

				stmt.close();
				
				//Nếu có bất kỳ 1 đầu bếp nào đang làm việc thì hủy thao tác xóa
				if(check != -1) return "wrong";
			}
			
			System.out.print("Quản lý vừa xóa các nhân viên có mã:   ");
			for(int i=0;i<arrayNhanVien.size();i++){
				
				//Nếu là đầu bếp/phó bếp/trưởng bếp thì xóa tên trong CSDL BEP
				sql = "SELECT chucvu FROM NHANVIEN WHERE manv = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(arrayNhanVien.get(i)));
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					if(rs.getInt("chucvu") == 2 || rs.getInt("chucvu") == 3 || rs.getInt("chucvu") == 4){
						sql = "DELETE FROM BEP WHERE manv = ?";
						pstmt2 = con.prepareStatement(sql);
						pstmt2.setInt(1, Integer.parseInt(arrayNhanVien.get(i)));
						pstmt2.execute();						
						pstmt2.close();
					}				
				}
				
				pstmt.close();
				
				sql = "{call deleteNhanVien(?)}";
				stmt = con.prepareCall(sql);
				stmt.setInt(1, Integer.parseInt(arrayNhanVien.get(i)));
				stmt.execute();
				stmt.close();
				
				System.out.print(arrayNhanVien.get(i)+"   ");
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

	public static String addNhanVien(String tenNV, String gioiTinh, String ngaySinh, String queQuan,  
									 String cmnd, String dienThoai, String chucVu, String luongCoBan) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		CallableStatement stmt=null;
		PreparedStatement stmt2=null;
		
		try{
			//kiểm tra trùng chứng minh nhân dân
			sql="select cmnd from NHANVIEN where daxoa <>1";
			stmt2=con.prepareStatement(sql);
			ResultSet rs= stmt2.executeQuery();
			while(rs.next()) {
				if(rs.getString("cmnd").equals(cmnd)) return "same"; 
			}
			//
			sql="{call addNhanVien(?,?,?,?,?,?,?,?,?)}";
			stmt = con.prepareCall(sql);
			stmt.setString(1, tenNV);
			stmt.setInt(2, Integer.parseInt(gioiTinh));
			stmt.setString(3, ngaySinh);
			stmt.setString(4, queQuan);
			stmt.setString(5, cmnd);
			stmt.setString(6, dienThoai);
			stmt.setDouble(7, Double.parseDouble(luongCoBan));
			stmt.setInt(8, Integer.parseInt(chucVu));
			stmt.setInt(9, 0); //daxoa
			
			stmt.execute();
				
			System.out.println("Quản trị viên đã thêm nhân viên : "+tenNV);
			
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

	public static NhanVien getNhanVien(String maNV) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		NhanVien nhanVien = new NhanVien();
		try{
			String sql = "{call getNhanVien(?)}";
			CallableStatement stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(maNV));
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){			
				nhanVien.setManv(rs.getInt("manv"));
				nhanVien.setTennv(rs.getString("tennv"));
				nhanVien.setGioitinh(rs.getInt("gioitinh"));
				nhanVien.setQuequan(rs.getString("quequan"));
				nhanVien.setCmnd(rs.getString("cmnd"));
				nhanVien.setDienthoai(rs.getString("dienthoai"));
				nhanVien.setLuongcoban(rs.getFloat("luongcoban"));
				nhanVien.setChucvu(rs.getInt("chucvu"));
				
				String ngay=rs.getString("ngaysinh");
				ngay=ngay.substring(0,ngay.length()-5);
				String thoigian=ngay.substring(8,10)+"/"+ngay.substring(5,7)+"/"+ngay.substring(0,4);
				nhanVien.setNgaysinh(thoigian);			
			}	
			
			return nhanVien;
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

	public static String updateNhanVien(String maNV, String tenNV,
			String gioiTinh, String ngaySinh, String queQuan, String cmnd,
			String dienThoai, String chucVu, String chucVuOld, String luongCoBan) {
		// TODO Auto-generated method stub
		Connection con = ConnectDB.getConnection();
		String sql="";
		CallableStatement stmt=null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
//		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
//		ResultSet rs2 = null;
		
		try{
			if(!chucVu.equals(chucVuOld)){
				if(Integer.parseInt(chucVu) == 2 || Integer.parseInt(chucVu) == 3 || Integer.parseInt(chucVu) == 4){
					//Kiểm tra xem trong CSDL BEP đã có nhân viên này hay chưa, nếu chưa có thì thêm nhân viên vào CSDL BEP
					sql="SELECT manv FROM BEP WHERE manv = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(maNV));
					rs = pstmt.executeQuery();
					
					if(!rs.next()){
						sql="INSERT INTO BEP(manv,soluongmon) VALUES(?,?)";
						pstmt2 = con.prepareStatement(sql);
						pstmt2.setInt(1, Integer.parseInt(maNV));
						pstmt2.setInt(2, 0);
						pstmt2.execute();
						pstmt2.close();
					}
					
					pstmt.close();
					
				}else if(Integer.parseInt(chucVuOld) == 2 || Integer.parseInt(chucVuOld) == 3 || Integer.parseInt(chucVuOld) == 4){
					//Kiểm tra xem nhân viên đó có đang làm việc không, nếu không thì xóa nhân viên ra khỏi CSDL BEP
					sql="SELECT soluongmon FROM BEP WHERE manv = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(maNV));
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						if(rs.getInt("soluongmon") == 0){
							sql = "DELETE FROM BEP WHERE manv = ?";
							pstmt2 = con.prepareStatement(sql);
							pstmt2.setInt(1, Integer.parseInt(maNV));
							pstmt2.execute();						
							pstmt2.close();
						}else{
							return "wrong";
						}
					}
					
					pstmt.close();
				}
			}			
//			sql="select cmnd from NHANVIEN where manv <> ?";
//			pstmt3=con.prepareStatement(sql);
//			pstmt3.setInt(1,Integer.parseInt(maNV));
//			rs2=pstmt3.executeQuery();
//			while(rs2.next()) {
//				if(rs.getString("cmnd").equals(cmnd)) return "same";
//			}
//			rs2.close();
//			pstmt3.close();
			
			sql="{call updateNhanVien(?,?,?,?,?,?,?,?,?)}";
			stmt = con.prepareCall(sql);
			stmt.setInt(1, Integer.parseInt(maNV));
			stmt.setString(2, tenNV);
			stmt.setInt(3, Integer.parseInt(gioiTinh));
			stmt.setString(4, ngaySinh);
			stmt.setString(5, queQuan);
			stmt.setString(6, cmnd);
			stmt.setString(7, dienThoai);
			stmt.setDouble(8, Double.parseDouble(luongCoBan));
			stmt.setInt(9, Integer.parseInt(chucVu));
			
			stmt.execute();
				
			System.out.println("Quản trị đã cập nhật thông tin nhân viên có mã: "+maNV);
			
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
