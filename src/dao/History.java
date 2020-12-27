package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.viewbean;

public class History {
	DungChung dc = new DungChung();

	public ArrayList<viewbean> getview() throws Exception {
		ArrayList<viewbean> ds = new ArrayList<viewbean>();
		dc.KetNoi();
		String sql = "select * from vls";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String makh = rs.getString("makh");
			String hoten = rs.getString("hoten");
			String tensach = rs.getString("tensach");
			Date ngaymua = rs.getDate("NgayMua");
			long gia = rs.getLong("gia");
			long soluong = rs.getLong("SoLuongMua");
			long thanhtien = rs.getLong("thanhtien");
			viewbean ls = new viewbean(makh, hoten, tensach, ngaymua, gia, soluong, thanhtien);
			ds.add(ls);
		}
		rs.close();
		dc.cn.close();
		return ds;
	}
}
