package com.NhaHang.bo;

import java.util.ArrayList;

import com.NhaHang.bean.*;
import com.NhaHang.dao.*;

public class showQuanLyNhanVienBO {
	public static ArrayList<NhanVien> getListNhanVien(int sapXep) {
		// TODO Auto-generated method stub
		return showQuanLyNhanVienDAO.getListNhanVien(sapXep);
	}
}
