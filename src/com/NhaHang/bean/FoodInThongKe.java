package com.NhaHang.bean;

public class FoodInThongKe {
	private String mamon;
	private String tenmon;
	private int soluong;
	private double tongtien;
	public FoodInThongKe() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FoodInThongKe(String mamon, String tenmon, int soluong, double tongtien) {
		super();
		this.mamon = mamon;
		this.tenmon = tenmon;
		this.soluong = soluong;
		this.tongtien = tongtien;
	}
	public String getMamon() {
		return mamon;
	}
	public void setMamon(String mamon) {
		this.mamon = mamon;
	}
	public String getTenmon() {
		return tenmon;
	}
	public void setTenmon(String tenmon) {
		this.tenmon = tenmon;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public double getTongtien() {
		return tongtien;
	}
	public void setTongtien(double tongtien) {
		this.tongtien = tongtien;
	}
	
}
