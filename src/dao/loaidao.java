package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	DungChung dc=new DungChung();
	public ArrayList<loaibean> getloai() throws Exception{
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		dc.KetNoi();
		String sql="select * from loai";
		PreparedStatement cmd= dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()){
			String maloai=rs.getString("maloai");
			String tenloai=rs.getString("tenloai");
			loaibean loai=new loaibean(maloai, tenloai);
			ds.add(loai);
		}
		rs.close();
		dc.cn.close();
		return ds;
		
		
	}
	/*
	 * public ArrayList<loaibean> getloai(){ ArrayList<loaibean> ds= new
	 * ArrayList<loaibean>(); ds.add(new loaibean("tin","cong nghe thong tin"));
	 * ds.add(new loaibean("toan","toan hoc")); ds.add(new loaibean("ly","vat ly"));
	 * ds.add(new loaibean("sinh","sinh hoc")); return ds; }
	 */
}
