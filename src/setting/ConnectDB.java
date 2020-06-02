package setting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	public static Connection getConnection(){
	    String url = "jdbc:jtds:sqlserver://"+ Setting.Ip +":"+ Setting.Port +";databaseName="+ Setting.Database +";";
	    try {
	    	Class.forName(Setting.DriveClass);
			return DriverManager.getConnection(url, Setting.Username, Setting.Password);
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		return null;
	}
}
