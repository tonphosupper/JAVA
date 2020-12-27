package phobo;

import java.util.ArrayList;

import phobean.phoclassbean;
import phodao.phoclassdao;

public class phoclassbo {
	phoclassdao tdao = new phoclassdao();
	ArrayList<phoclassbean> ds;

	public ArrayList<phoclassbean> gettin() throws Exception {
		ds = tdao.gettin();
		return ds;
	}

	public ArrayList<phoclassbean> TimTin(String key)

	{
		ArrayList<phoclassbean> tam = new ArrayList<phoclassbean>();
		for (phoclassbean s : ds)
			if (s.getTieude().toLowerCase().contains(key.toLowerCase())
					|| s.getNoidungtin().toLowerCase().contains(key.toLowerCase()))
				tam.add(s);
		return tam;
	}

}