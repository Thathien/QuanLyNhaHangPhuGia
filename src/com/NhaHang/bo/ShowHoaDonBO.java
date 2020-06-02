package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.bean.Food;
import com.NhaHang.dao.ShowHoaDonDAO;

public class ShowHoaDonBO {
	public static ArrayList<Food> getListFood(String tableNumber) {
		// TODO Auto-generated method stub
		return ShowHoaDonDAO.getListFood(tableNumber);
	}

	public static void updateTrangThaiTinhTien(ArrayList<Integer> listMaGoiMon) {
		// TODO Auto-generated method stub
		ShowHoaDonDAO.updateTrangThaiTinhTien(listMaGoiMon);
	}

	public static void luuLichSuBanHang(ArrayList<Integer> listMaGoiMon) {
		// TODO Auto-generated method stub
		ShowHoaDonDAO.luuLichSuBanHang(listMaGoiMon);
	}
}
