package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.bean.Food;
import com.NhaHang.dao.ShowGoiMonDAO;

public class ShowGoiMonBO {
	public static ArrayList<Food> getListFood() {
		// TODO Auto-generated method stub
		return ShowGoiMonDAO.getListFood();
	}

	public static ArrayList<String> getListTypeFood() {
		// TODO Auto-generated method stub
		return ShowGoiMonDAO.getListTypeFood();
	}

	public static boolean checkTable(String tableNumberSession) {
		// TODO Auto-generated method stub
		return ShowGoiMonDAO.checkTable(tableNumberSession);
	}
}
