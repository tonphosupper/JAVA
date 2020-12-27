package phobean;

import java.sql.Date;

public class phoclassbean {
	private String matin;
	private String tieude;
	private String tomtat;
	private Date ngayduatin;
	private String noidungtin;
	
	public phoclassbean(String matin, String tieude, String tomtat, Date ngaymua, String noidungtin) {
		super();
		this.matin = matin;
		this.tieude = tieude;
		this.tomtat = tomtat;
		this.ngayduatin = ngaymua;
		this.noidungtin = noidungtin;
	}
	public String getMatin() {
		return matin;
	}
	public void setMatin(String matin) {
		this.matin = matin;
	}
	public String getTieude() {
		return tieude;
	}
	public void setTieude(String tieude) {
		this.tieude = tieude;
	}
	public String getTomtat() {
		return tomtat;
	}
	public void setTomtat(String tomtat) {
		this.tomtat = tomtat;
	}
	public Date getNgayduatin() {
		return ngayduatin;
	}
	public void setNgayduatin(Date ngayduatin) {
		this.ngayduatin = ngayduatin;
	}
	public String getNoidungtin() {
		return noidungtin;
	}
	public void setNoidungtin(String noidungtin) {
		this.noidungtin = noidungtin;
	}
	
	}


