package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.bean.*;
import com.NhaHang.dao.*;

public class ShowChiTietBanBO {
	public static ArrayList<Food> getListFood(String tableNumber) {
		// TODO Auto-generated method stub
		return ShowChiTietBanDAO.getListFood(tableNumber);
	}
}
