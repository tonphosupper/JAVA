package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
	static DungChung dc = new DungChung();
	public static boolean checkLoginAdmin(String Adminname, String Adminpass) throws SQLException {
		boolean isValidAd = false;
		dc.KetNoi();
		String sql = "select * from DangNhap where TenDangNhap=? and MatKhau=?";
        PreparedStatement pre = dc.cn.prepareStatement(sql);
        pre.setString(1, Adminname);
        pre.setString(2, Adminpass);
 
        ResultSet rs = pre.executeQuery();

        if (rs.next()) {
            isValidAd = true;         
        }else {
        	isValidAd = false;
        }
        rs.close();
        
        dc.cn.close();
 
        return isValidAd;
	}

}
