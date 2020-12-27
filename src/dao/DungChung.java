package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DungChung {
	public static Connection cn;
	public void KetNoi() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.println("OK da nap driver");
			String st="jdbc:sqlserver://TONTHATPHO\\SQLEXPRESS01:1433;databaseName=QlSach;user=sa;password=123456;";
			cn=DriverManager.getConnection(st);
			System.out.println("Da ket noi sql"); 
		
		} catch (Exception tt) {
			
			tt.printStackTrace();
			System.out.println(tt.getMessage());
		}
	}
}
