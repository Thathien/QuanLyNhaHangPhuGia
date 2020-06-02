package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.bean.*;
import com.NhaHang.dao.*;
public class ShowQuanLySuKienBO {
	public static ArrayList<SuKien> getEvent() {
		// TODO Auto-generated method stub
		return ShowQuanLySuKienDAO.getEvent();
	}

	public static ArrayList<SuKien> getEventForGuest() {
		// TODO Auto-generated method stub
		return ShowQuanLySuKienDAO.getEventForGuest();
	}

}
