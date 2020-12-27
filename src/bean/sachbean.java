package bean;

import java.sql.Date;

public class sachbean {
	private String masach;
	private String tensach;
	private long soluong;
	private long gia;
	private String maloai;
	private long sotap;
	private String anh;
	private Date ngaynhap;
	private String tacgia;

	public sachbean(String masach, String tensach, long soluong, long gia, String maloai, long sotap, String anh,
			Date ngaynhap, String tacgia) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.soluong = soluong;
		this.gia = gia;
		this.maloai = maloai;
		this.sotap = sotap;
		this.anh = anh;
		this.ngaynhap = ngaynhap;
		this.tacgia = tacgia;
	}

	public String getMaloai() {
		return maloai;
	}

	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}

	public String getTensach() {
		return tensach;
	}

	public void setTensach(String tensach) {
		this.tensach = tensach;
	}

	public String getTacgia() {
		return tacgia;
	}

	public void setTacgia(String tacgia) {
		this.tacgia = tacgia;
	}

	public long getGia() {
		return gia;
	}

	public void setGia(long gia) {
		this.gia = gia;
	}

	public String getMasach() {
		return masach;
	}

	public void setMasach(String masach) {
		this.masach = masach;
	}

	public long getSoluong() {
		return soluong;
	}

	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}

	public long getSotap() {
		return sotap;
	}

	public void setSotap(long sotap) {
		this.sotap = sotap;
	}

	public Date getNgaynhap() {
		return ngaynhap;
	}

	public void setNgaynhap(Date ngaynhap) {
		this.ngaynhap = ngaynhap;
	}

	public sachbean() {
		super();
	}
	
	
}
