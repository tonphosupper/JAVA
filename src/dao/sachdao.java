package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.PartialResultException;

import bean.sachbean;

public class sachdao {
	DungChung dc = new DungChung();
	public ArrayList<sachbean> getsach() throws Exception{
		ArrayList<sachbean> ds=new ArrayList<sachbean>();
		//B1 ket noi
		dc.KetNoi();
		//B2 thiet lap cau lenh
		String sql="select * from sach";
		//B3 laays du lieu
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		//B4 duyet qua cac don vi
		while(rs.next()) {
			String masach = rs.getString("masach");

			String tensach = rs.getString("tensach");
			long soluong = rs.getLong("soluong");
			long gia = rs.getLong("gia");
			String maloai = rs.getString("maloai");
			long sotap = rs.getLong("sotap");
			String anh = rs.getString("anh");
			Date ngaynhap = rs.getDate("ngaynhap");
			String tacgia = rs.getString("tacgia");

			sachbean sach = new sachbean(masach, tensach, soluong, gia, maloai, sotap, anh, ngaynhap, tacgia);
			ds.add(sach);
		}
		rs.close();
		dc.cn.close(); 
		return ds;
	}
	public boolean ThemSach(sachbean sachbean){

		DungChung dc =new DungChung();
		boolean flag = false;
		String sql="insert into sach values(?,?,?,?,?,?,?,?,?)";
		try {
			dc.KetNoi();
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, sachbean.getMasach());
			cmd.setString(2, sachbean.getTensach());
			cmd.setLong(3, sachbean.getSoluong());
			cmd.setLong(4, sachbean.getGia());
			cmd.setString(5, sachbean.getMaloai());
			cmd.setLong(6, sachbean.getSotap());
			cmd.setString(7, sachbean.getAnh());
			cmd.setDate(8, sachbean.getNgaynhap());
			cmd.setString(9, sachbean.getTacgia());
			flag = cmd.executeUpdate() > 0;
			dc.cn.close();
			System.out.println("Them sach thanh cong");
		} catch (Exception e) {
			System.out.println("Them sach that bai!");
			e.printStackTrace();
		}
		return flag;
		}
	
	public static void suasach(String masach, String tensach,long soluong, long gia, String maloai,
			long sotap, String anh, Date ngaynhap, String tacgia) {
		DungChung dc = new DungChung();
		String sql = "UPDATE sach SET tensach=?,soluong=?,gia=?,maloai=?,sotap=?,anh=?,NgayNhap=?,tacgia=? WHERE masach= ?";
		try {
			dc.KetNoi();
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, tensach);
			cmd.setLong(2, soluong);
			cmd.setLong(3, gia);
			cmd.setString(4, maloai);
			cmd.setLong(5, sotap);
			cmd.setString(6, anh);
			cmd.setDate(7, ngaynhap);
			cmd.setString(8, tacgia);
			cmd.setString(9, masach);
			cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void xoasach(String masach) {
		DungChung dc = new DungChung();
		String sql = "DELETE from sach where masach= ?";
		try {
			dc.KetNoi();
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, masach);
			cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
		
		

