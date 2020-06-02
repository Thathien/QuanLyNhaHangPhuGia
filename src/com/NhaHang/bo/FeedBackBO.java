package com.NhaHang.bo;

import com.NhaHang.dao.FeedBackDAO;

public class FeedBackBO {
	public static String insertFeedBack(String feedBack) {
		// TODO Auto-generated method stub
		return FeedBackDAO.insertFeedBack(feedBack);
	}
}
