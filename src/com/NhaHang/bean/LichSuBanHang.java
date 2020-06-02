package com.NhaHang.bean;

public class LichSuBanHang {
	private String ngaythang;
	private double tongtien;
	private int sohoadon;
	private int thang;
	private int nam;
	public LichSuBanHang() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LichSuBanHang(String ngaythang, double tongtien, int sohoadon, int thang, int nam) {
		super();
		this.ngaythang = ngaythang;
		this.tongtien = tongtien;
		this.sohoadon = sohoadon;
		this.thang = thang;
		this.nam = nam;
	}
	public String getNgaythang() {
		return ngaythang;
	}
	public void setNgaythang(String ngaythang) {
		this.ngaythang = ngaythang;
	}
	public double getTongtien() {
		return tongtien;
	}
	public void setTongtien(double tongtien) {
		this.tongtien = tongtien;
	}
	public int getSohoadon() {
		return sohoadon;
	}
	public void setSohoadon(int sohoadon) {
		this.sohoadon = sohoadon;
	}
	public int getThang() {
		return thang;
	}
	public void setThang(int thang) {
		this.thang = thang;
	}
	public int getNam() {
		return nam;
	}
	public void setNam(int nam) {
		this.nam = nam;
	}
	
}
