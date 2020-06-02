package com.NhaHang.bo;

import com.NhaHang.dao.updateCallFoodDAO;

public class updateCallFoodBO {
	public static String updateCallFoodChefs(int stt, String trangthaigoi,
			String phanhoidaubep, int soLuongCheBien) {
		// TODO Auto-generated method stub
		switch (trangthaigoi) {
			case "1": trangthaigoi = "Đang chờ...";			
				break;
			case "2": trangthaigoi = "Đang chế biến";			
				break;
			case "3": trangthaigoi = "Chế biến xong";			
				break;
			case "4": trangthaigoi = "Từ chối";			
		}
		
		switch (phanhoidaubep) {
			case "1": phanhoidaubep = "Quý khách vui lòng đợi trong chốc lát";			
				break;
			case "2": phanhoidaubep = "Chúc quý khách ngon miệng";			
				break;
			case "3": phanhoidaubep = "Xin lỗi, hiện tại món ăn này đã hết";			
				break;
			case "4": phanhoidaubep = "Quý khách vui lòng nhập số lượng thật";			
		}
		
		return updateCallFoodDAO.updateCallFoodChefs(stt,trangthaigoi,phanhoidaubep, soLuongCheBien);
	}

	public static String updateCallFoodGuest(int stt, String soLuong) {
		// TODO Auto-generated method stub
		return updateCallFoodDAO.updateCallFoodGuest(stt,soLuong);
	}
}
