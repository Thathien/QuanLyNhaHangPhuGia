package com.NhaHang.bean;

public class NhanVien {
	private int manv;
	private String tennv;
	private int gioitinh;
	private String ngaysinh;
	private String quequan;
	private String cmnd;
	private String dienthoai;
	private double luongcoban;
	private int chucvu;
	public NhanVien() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NhanVien(int manv, String tennv, int gioitinh, String ngaysinh, String quequan, String cmnd,
			String dienthoai, double luongcoban, int chucvu) {
		super();
		this.manv = manv;
		this.tennv = tennv;
		this.gioitinh = gioitinh;
		this.ngaysinh = ngaysinh;
		this.quequan = quequan;
		this.cmnd = cmnd;
		this.dienthoai = dienthoai;
		this.luongcoban = luongcoban;
		this.chucvu = chucvu;
	}
	public int getManv() {
		return manv;
	}
	public void setManv(int manv) {
		this.manv = manv;
	}
	public String getTennv() {
		return tennv;
	}
	public void setTennv(String tennv) {
		this.tennv = tennv;
	}
	public int getGioitinh() {
		return gioitinh;
	}
	public void setGioitinh(int gioitinh) {
		this.gioitinh = gioitinh;
	}
	public String getNgaysinh() {
		return ngaysinh;
	}
	public void setNgaysinh(String ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	public String getQuequan() {
		return quequan;
	}
	public void setQuequan(String quequan) {
		this.quequan = quequan;
	}
	public String getCmnd() {
		return cmnd;
	}
	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
	}
	public String getDienthoai() {
		return dienthoai;
	}
	public void setDienthoai(String dienthoai) {
		this.dienthoai = dienthoai;
	}
	public double getLuongcoban() {
		return luongcoban;
	}
	public void setLuongcoban(double luongcoban) {
		this.luongcoban = luongcoban;
	}
	public int getChucvu() {
		return chucvu;
	}
	public void setChucvu(int chucvu) {
		this.chucvu = chucvu;
	}
	
}
