package com.NhaHang.bean;

public class HoaDon {
	private int madonhang;
	private String ngaynhap;
	private int daxoa;
	private int stt;
	private String tenhang;
	private int soluong;
	private double gia;
	private String tendonhang;
	private String donvitinh;
	public HoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HoaDon(int madonhang, String ngaynhap, int daxoa, int stt, String tenhang, int soluong, double gia,
			String tendonhang, String donvitinh) {
		super();
		this.madonhang = madonhang;
		this.ngaynhap = ngaynhap;
		this.daxoa = daxoa;
		this.stt = stt;
		this.tenhang = tenhang;
		this.soluong = soluong;
		this.gia = gia;
		this.tendonhang = tendonhang;
		this.donvitinh = donvitinh;
	}
	public int getMadonhang() {
		return madonhang;
	}
	public void setMadonhang(int madonhang) {
		this.madonhang = madonhang;
	}
	public String getNgaynhap() {
		return ngaynhap;
	}
	public void setNgaynhap(String ngaynhap) {
		this.ngaynhap = ngaynhap;
	}
	public int getDaxoa() {
		return daxoa;
	}
	public void setDaxoa(int daxoa) {
		this.daxoa = daxoa;
	}
	public int getStt() {
		return stt;
	}
	public void setStt(int stt) {
		this.stt = stt;
	}
	public String getTenhang() {
		return tenhang;
	}
	public void setTenhang(String tenhang) {
		this.tenhang = tenhang;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public double getGia() {
		return gia;
	}
	public void setGia(double gia) {
		this.gia = gia;
	}
	public String getTendonhang() {
		return tendonhang;
	}
	public void setTendonhang(String tendonhang) {
		this.tendonhang = tendonhang;
	}
	public String getDonvitinh() {
		return donvitinh;
	}
	public void setDonvitinh(String donvitinh) {
		this.donvitinh = donvitinh;
	}
	
}
