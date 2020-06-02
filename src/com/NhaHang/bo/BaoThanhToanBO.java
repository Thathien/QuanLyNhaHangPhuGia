package com.NhaHang.bo;

import com.NhaHang.dao.BaoThanhToanDAO;

public class BaoThanhToanBO {
	public static String baoThanhToan(String tableNumber) {
		// TODO Auto-generated method stub
		return BaoThanhToanDAO.baoThanhToan(tableNumber);
	}

}
