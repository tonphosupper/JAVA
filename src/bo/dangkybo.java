package bo;


import bean.KHbean;
import dao.dangkydao;

public class dangkybo {
	dangkydao k = new dangkydao();

	public boolean KTdangnhap(String user, String pass) throws Exception {

		return k.KtDangNhap(user, pass);

	}
	
	public boolean dangkyKH(KHbean KH) {
		return k.DangKy(KH);
	}

}
