package bo;

import java.util.ArrayList;


import bean.sachbean;
import dao.sachdao;



public class sachbo {
	sachdao sdao=new sachdao();
	ArrayList<sachbean> ds;
	public ArrayList<sachbean> getsach() throws Exception{
		ds = sdao.getsach();
	  	return ds;
		}
	
	public boolean themSach(sachbean sachbean) {
		return sdao.ThemSach(sachbean);
	}

	public ArrayList<sachbean> TimSachTheoMa(String maloai)

	{
		ArrayList<sachbean> tam = new ArrayList<sachbean>();
		for( sachbean s: ds)
			if(s.getMaloai().trim().equalsIgnoreCase(maloai.trim()))  tam.add(s);
		return tam;
		
	}
	
	public ArrayList<sachbean> TimSach(String key)

	{
		ArrayList<sachbean> tam = new ArrayList<sachbean>();
		for( sachbean s: ds)
			if(s.getTensach().toLowerCase().contains(key.toLowerCase()) || s.getTacgia().toLowerCase().contains(key.toLowerCase()))
		tam.add(s);
		return tam;
		}
		
}
