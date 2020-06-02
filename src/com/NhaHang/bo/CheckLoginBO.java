package com.NhaHang.bo;

import com.NhaHang.bean.User;
import com.NhaHang.dao.CheckLoginDAO;

public class CheckLoginBO {
	public static User checkLogin(String username,String password) {
		return CheckLoginDAO.checkLogin(username, password);
	}
}
