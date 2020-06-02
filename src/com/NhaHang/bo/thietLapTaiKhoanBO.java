package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.dao.*;

public class thietLapTaiKhoanBO {
	public static String deleteUser(ArrayList<String> arrayUser) {
		// TODO Auto-generated method stub
		return thietLapTaiKhoanDAO.deleteUser(arrayUser);
	}

	public static String addUser(String tenTaiKhoan, String matKhau, String phanQuyen) {
		// TODO Auto-generated method stub
		return thietLapTaiKhoanDAO.addUser(tenTaiKhoan, matKhau, phanQuyen);
	}

	public static String changePassword(String tenTaiKhoan,	String matKhauHienTai, String matKhauMoi) {
		// TODO Auto-generated method stub
		return thietLapTaiKhoanDAO.changePassword(tenTaiKhoan, matKhauHienTai, matKhauMoi);
	}
}
