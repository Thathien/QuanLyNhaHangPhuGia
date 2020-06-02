package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.bean.*;
import com.NhaHang.dao.*;

public class QuanLyNhapHangBO {
	public static String deleteHoaDon(ArrayList<String> arrayHoaDon) {
		// TODO Auto-generated method stub
		return QuanLyNhapHangDAO.deleteHoaDon(arrayHoaDon);
	}

	public static ArrayList<HoaDon> getChiTietHoaDon(String madonhang) {
		// TODO Auto-generated method stub
		return QuanLyNhapHangDAO.getChiTietHoaDon(madonhang);
	}

	public static String addHoaDon(String tendonhang, String ngaythang) {
		// TODO Auto-generated method stub
		return QuanLyNhapHangDAO.addHoaDon(tendonhang, ngaythang);
	}

	public static HoaDon getDonHang(String madonhang) {
		// TODO Auto-generated method stub
		return QuanLyNhapHangDAO.getDonHang(madonhang);
	}

	public static void addMatHang(String madonhang, String tenhang,
			String donvitinh, String soluong, String gia) {
		// TODO Auto-generated method stub
		QuanLyNhapHangDAO.addMatHang(madonhang, tenhang, donvitinh, soluong, gia);
	}

	public static String deleteMatHang(ArrayList<String> arrayMatHang) {
		// TODO Auto-generated method stub
		return QuanLyNhapHangDAO.deleteMatHang(arrayMatHang);
	}

	public static void updateHoaDon(String madonhang, String tendonhang,
			String ngaythang) {
		// TODO Auto-generated method stub
		QuanLyNhapHangDAO.updateHoaDon(madonhang, tendonhang, ngaythang);
	}
}
