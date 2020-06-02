package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.bean.*;
import com.NhaHang.dao.*;

public class QuanLySuKienBO {
	public static String deleteEvent(ArrayList<String> arrayEvent) {
		// TODO Auto-generated method stub
		return QuanLySuKienDAO.deleteEvent(arrayEvent);
	}

	public static String addEvent(String noidung, String hienthi) {
		// TODO Auto-generated method stub
		return QuanLySuKienDAO.addEvent(noidung, hienthi);
	}

	public static SuKien getEvent(String stt) {
		// TODO Auto-generated method stub
		return QuanLySuKienDAO.getEvent(stt);
	}

	public static String updateEvent(String stt2, String noidung2, String hienthi2) {
		// TODO Auto-generated method stub
		return QuanLySuKienDAO.updateEvent(stt2, noidung2, hienthi2);
	}

}
