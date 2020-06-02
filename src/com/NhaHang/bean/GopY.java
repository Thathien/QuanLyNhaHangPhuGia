package com.NhaHang.bean;

public class GopY {
	private int stt;
	private String noidung;
	private String ngay;
	private int dadoc;
	private int daxoa;
	public GopY() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GopY(int stt, String noidung, String ngay, int dadoc, int daxoa) {
		super();
		this.stt = stt;
		this.noidung = noidung;
		this.ngay = ngay;
		this.dadoc = dadoc;
		this.daxoa = daxoa;
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
	public String getNgay() {
		return ngay;
	}
	public void setNgay(String ngay) {
		this.ngay = ngay;
	}
	public int getDadoc() {
		return dadoc;
	}
	public void setDadoc(int dadoc) {
		this.dadoc = dadoc;
	}
	public int getDaxoa() {
		return daxoa;
	}
	public void setDaxoa(int daxoa) {
		this.daxoa = daxoa;
	}
	
}
