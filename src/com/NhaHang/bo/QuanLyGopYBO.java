package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.dao.*;

public class QuanLyGopYBO {
	public static String updateDaDoc(String stt) {
		// TODO Auto-generated method stub
		return QuanLyGopYDAO.updateDaDoc(stt);
	}

	public static String deleteFeedBack(ArrayList<String> arrayFeedBack) {
		// TODO Auto-generated method stub
		return QuanLyGopYDAO.deleteFeedBack(arrayFeedBack);
	}
}
