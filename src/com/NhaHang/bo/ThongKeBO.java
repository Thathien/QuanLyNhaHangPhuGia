package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.bean.*;
import com.NhaHang.dao.*;

public class ThongKeBO {
	public static ArrayList<LichSuBanHang> getListLichSu(String nam) {
		// TODO Auto-generated method stub
		return ThongKeDAO.getListLichSu(nam);
	}

	public static ArrayList<LichSuBanHang> getListLichSuNam(String namBatDau, String namKetThuc) {
		// TODO Auto-generated method stub
		return ThongKeDAO.getListLichSuNam(namBatDau, namKetThuc);	
	}

	public static ArrayList<LichSuBanHang> getListLichSuKTG(String tuNgay, String denNgay) {
		// TODO Auto-generated method stub		
		return ThongKeDAO.getListLichSuKTG(tuNgay, denNgay);	
	}

	public static ArrayList<FoodInThongKe> getListThongKeMonAn(String startDay, String endDay, int sapXep, int top, int type) {
		// TODO Auto-generated method stub
		return ThongKeDAO.getListThongKeMonAn(startDay, endDay, sapXep, top, type);	
	}
}	
