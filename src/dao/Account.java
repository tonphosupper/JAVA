package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.KHbean;
import bean.viewbean;

public class Account {
	static DungChung dc = new DungChung();
	public static boolean checkLogin(String username, String password) throws SQLException {
		boolean isValid = false;
		dc.KetNoi();
		String sql = "select * from KhachHang where tendn=? and pass=?";
        PreparedStatement pre = dc.cn.prepareStatement(sql);
        pre.setString(1, username);
        pre.setString(2, password);
 
        ResultSet rs = pre.executeQuery();

        if (rs.next()) {
            isValid = true;         
        }else {
        	isValid = false;
        }
        rs.close();
        
        dc.cn.close();
 
        return isValid;
	}
	
	public static void xoaKH(long makh) {
		DungChung dc = new DungChung();
		String sql = "DELETE from KhachHang where makh= ?";
		try {
			dc.KetNoi();
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setLong(1, makh);
			cmd.executeUpdate();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<KHbean> getKH() throws Exception {
		ArrayList<KHbean> ds = new ArrayList<KHbean>();
		dc.KetNoi();
		String sql = "select * from KhachHang";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			long makh = rs.getLong("makh");
			String hoten = rs.getString("hoten");
			String diachi = rs.getString("diachi");
			String sodt = rs.getString("sodt");
			String email = rs.getString("email");
			String tendn = rs.getString("tendn");
			String pass = rs.getString("pass");
			KHbean ls = new KHbean(makh, hoten, diachi, sodt, email, tendn, pass);
			ds.add(ls);
		}
		rs.close();
		dc.cn.close();
		return ds;
	}
}
