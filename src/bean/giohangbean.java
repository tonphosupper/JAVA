package bean;

public class giohangbean {
	private String anh;
	private String masach;
	private String tensach;
	private long gia;
	private long soluong;
	private long thanhtien;
	public giohangbean(String anh, String masach, String tensach, long gia, long soluong) {
		super();
		this.anh = anh;
		this.masach = masach;
		this.tensach = tensach;
		this.gia = gia;
		this.soluong = soluong;
		this.thanhtien = soluong*gia;
	}
	public String getMasach() {
		return masach;
	}
	public void setMasach(String masach) {
		this.masach = masach;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
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
		return soluong*gia;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = soluong*gia;
	}
	public String getAnh() {
		return anh ;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
}
	