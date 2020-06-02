package com.NhaHang.bean;

public class Table {
	private int soban;
	private int trangthaiban;
	private int xoaban;
	private int goiphucvu;
	public Table() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Table(int soban, int trangthaiban, int xoaban, int goiphucvu) {
		super();
		this.soban = soban;
		this.trangthaiban = trangthaiban;
		this.xoaban = xoaban;
		this.goiphucvu = goiphucvu;
	}
	public int getSoban() {
		return soban;
	}
	public void setSoban(int soban) {
		this.soban = soban;
	}
	public int getTrangthaiban() {
		return trangthaiban;
	}
	public void setTrangthaiban(int trangthaiban) {
		this.trangthaiban = trangthaiban;
	}
	public int getXoaban() {
		return xoaban;
	}
	public void setXoaban(int xoaban) {
		this.xoaban = xoaban;
	}
	public int getGoiphucvu() {
		return goiphucvu;
	}
	public void setGoiphucvu(int goiphucvu) {
		this.goiphucvu = goiphucvu;
	}
	
}
