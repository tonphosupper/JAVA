package bean;

import java.sql.Date;

public class viewbean {
	private String makh;
	private String hoten;
	private String tensach;
	private Date ngaymua;
	private long gia;
	private long soluong;
	private long thanhtien;
	
	public viewbean(String makh, String hoten, String tensach, Date ngayMua, long gia, long soluong, long thanhtien) 
	{ 
		super();
		this.makh = makh;
		this.hoten = hoten;
		this.tensach = tensach;
		ngaymua = ngayMua;
		this.gia = gia;
		this.soluong = soluong;
		this.thanhtien =thanhtien;
	}
	public String getMakh() {
		return makh;
	}
	public void setMakh(String makh) {
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public Date getNgayMua() {
		return ngaymua;
	}
	public void setNgayMua(Date ngayMua) {
		ngaymua = ngayMua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	
	
}
