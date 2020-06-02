package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.dao.*;

public class QuanLyBanBO {
	public static String deleteListTable(ArrayList<String> arrayTable) {
		// TODO Auto-generated method stub
		return QuanLyBanDAO.deleteListTable(arrayTable);	
	}

	public static String addTable(int soLuong) {
		// TODO Auto-generated method stub
		return QuanLyBanDAO.addTable(soLuong);
	}

	public static void changeTable(int from, int to) {
		// TODO Auto-generated method stub
		QuanLyBanDAO.changeTable(from,to);
	}
}
