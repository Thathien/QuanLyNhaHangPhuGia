package com.NhaHang.bo;

import com.NhaHang.dao.GuiYeuCauDAO;

public class GuiYeuCauBO {
	public static String insertFeedBack(String soBan, String noiDungYeuCau) {
		// TODO Auto-generated method stub
		return GuiYeuCauDAO.insertFeedBack(soBan,noiDungYeuCau);
	}
}
