package com.NhaHang.bo;

import java.util.ArrayList;
import java.util.LinkedHashSet;

import com.NhaHang.bean.FoodGuestCall;
import com.NhaHang.dao.showQuanLyGoiMonDAO;

public class showQuanLyGoiMonBO {
	public static ArrayList<FoodGuestCall> getListFoodGuestCall() {
		// TODO Auto-generated method stub
		return showQuanLyGoiMonDAO.getListFoodGuestCall();
	}

	public static ArrayList<FoodGuestCall> getListYeuCauThem(LinkedHashSet<Integer> hs) {
		// TODO Auto-generated method stub
		return showQuanLyGoiMonDAO.getListYeuCauThem(hs);
	}
}
