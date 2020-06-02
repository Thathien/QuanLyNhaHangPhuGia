package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.dao.*;

public class QuanLyThucDonBO {
	public static String addFoodInMenu(String tenmon, int maloai, double gia, int khuyendung, String anh) {
		// TODO Auto-generated method stub
		return QuanLyThucDonDAO.addFoodInMenu(tenmon, maloai, gia, khuyendung, anh);
	}

	public static String deleteListFood(ArrayList<String> arrayFood) {
		// TODO Auto-generated method stub
		return QuanLyThucDonDAO.deleteListFood(arrayFood);
	}

	public static String updateFoodInMenu(String mamon, String tenmon, int maloai, double gia, int khuyendung, String anh) {
		// TODO Auto-generated method stub
		return QuanLyThucDonDAO.updateFoodInMenu(mamon, tenmon, maloai, gia, khuyendung, anh);
	}

}
