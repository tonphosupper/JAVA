package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import bean.KHbean;
import bean.sachbean;

public class dangkydao {
	public boolean KtDangNhap(String un, String pass) throws Exception{

		DungChung dc =new DungChung();
		dc.KetNoi();

		String sql="select * from KhachHang where tendn="+ un+" and pass="+ pass+"";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		boolean kq= r.next();
		
		r.close();
		
		
		return kq;
		}
	
	public boolean DangKy(KHbean kh){

		DungChung dc =new DungChung();
		boolean flag = false;
		String sql="insert into KhachHang values(?,?,?,?,?,?,?)";
		try {
			dc.KetNoi();
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setLong(1, kh.getMakh());
			cmd.setString(2, kh.getHoten());
			cmd.setString(3, kh.getDiachi());
			cmd.setString(4, kh.getSodt());
			cmd.setString(5, kh.getEmail());
			cmd.setString(6, kh.getTendn());
			cmd.setString(7, kh.getPass());
			flag = cmd.executeUpdate() > 0;
			dc.cn.close();
			System.out.println("Dang ky thanh cong");
		} catch (Exception e) {
			System.out.println("Dang ky that bai!");
			e.printStackTrace();
		}
		return flag;
		}
}
