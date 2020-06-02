package com.NhaHang.bean;

public class SuKien {
	private int stt;
	private String noidung;
	private String ngaythang;
	private int daxoa;
	private int hienthi;
	public SuKien() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SuKien(int stt, String noidung, String ngaythang, int daxoa, int hienthi) {
		super();
		this.stt = stt;
		this.noidung = noidung;
		this.ngaythang = ngaythang;
		this.daxoa = daxoa;
		this.hienthi = hienthi;
	}
	public int getStt() {
		return stt;
	}
	public void setStt(int stt) {
		this.stt = stt;
	}
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
	public String getNgaythang() {
		return ngaythang;
	}
	public void setNgaythang(String ngaythang) {
		this.ngaythang = ngaythang;
	}
	public int getDaxoa() {
		return daxoa;
	}
	public void setDaxoa(int daxoa) {
		this.daxoa = daxoa;
	}
	public int getHienthi() {
		return hienthi;
	}
	public void setHienthi(int hienthi) {
		this.hienthi = hienthi;
	}
	
}
