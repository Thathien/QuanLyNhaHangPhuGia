package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.bean.Food;
import com.NhaHang.dao.ShowMoiDaGoiDAO;

public class ShowMoiDaGoiBO {
	public static ArrayList<Food> getListFoodCall(String tableNumber) {
		// TODO Auto-generated method stub
		return ShowMoiDaGoiDAO.getListFoodCall(tableNumber);
	}
}
