package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.dao.*;

import com.NhaHang.bean.*;
import com.NhaHang.dao.*;

public class ShowQuanLyThucDonBO {
	public static ArrayList<Food> getListFood(int sapXep) {
		// TODO Auto-generated method stub
		return ShowQuanLyThucDonDAO.getListFood(sapXep);
	}

	public static Food getFood(String mamon) {
		// TODO Auto-generated method stub
		return ShowQuanLyThucDonDAO.getFood(mamon);
	}
}
