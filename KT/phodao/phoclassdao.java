package phodao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.DungChung;
import phobean.phoclassbean;

public class phoclassdao {
	
	DungChung dc = new DungChung();

	public ArrayList<phoclassbean> gettin() throws Exception {
		ArrayList<phoclassbean> ds = new ArrayList<phoclassbean>();
		dc.KetNoi();
		String sql = "select * from tonthatpho";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String matin = rs.getString("MaTin");
			String tieude = rs.getString("TieuDe");
			String tomtat = rs.getString("TomTat");
			Date ngayduatin = rs.getDate("NgayDuaTin");
			String noidungtin = rs.getString("NoiDungTin");
			phoclassbean ls = new phoclassbean(matin, tieude, tomtat, ngayduatin, noidungtin);
			ds.add(ls);
		}
		rs.close();
		dc.cn.close();
		return ds;
	}
}
