package com.NhaHang.bo;

import com.NhaHang.dao.goiMonDAO;

public class goiMonBO {
	public static String callFood(String tableNumber, int maMon, String soLuong) {
		// TODO Auto-generated method stub
		return goiMonDAO.callFood(tableNumber, maMon, soLuong);
	}
}
