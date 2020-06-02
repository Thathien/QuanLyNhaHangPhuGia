package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.bean.*;
import com.NhaHang.dao.*;

public class QuanLyNhanVienBO {
	public static String deleteNhanVien(ArrayList<String> arrayNhanVien) {
		// TODO Auto-generated method stub
		return QuanLyNhanVienDAO.deleteNhanVien(arrayNhanVien);
	}

	public static String addNhanVien(String tenNV, String gioiTinh,
			String ngaySinh, String queQuan, String cmnd, String dienThoai,
			String chucVu, String luongCoBan) {
		// TODO Auto-generated method stub
		return QuanLyNhanVienDAO.addNhanVien(tenNV, gioiTinh, ngaySinh, queQuan, cmnd, dienThoai, chucVu, luongCoBan);
	}

	public static NhanVien getNhanVien(String maNV) {
		// TODO Auto-generated method stub
		return QuanLyNhanVienDAO.getNhanVien(maNV);
	}

	public static String updateNhanVien(String maNV, String tenNV,
			String gioiTinh, String ngaySinh, String queQuan, String cmnd,
			String dienThoai, String chucVu, String chucVuOld, String luongCoBan) {
		// TODO Auto-generated method stub
		return QuanLyNhanVienDAO.updateNhanVien(maNV, tenNV, gioiTinh, ngaySinh, queQuan, cmnd, dienThoai, chucVu, chucVuOld, luongCoBan);
	}
}
