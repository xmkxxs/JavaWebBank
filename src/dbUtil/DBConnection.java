package dbUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 工具类，数据库连接准备
 * **/
public class DBConnection {
		String classDriver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/mydb?useUnicode=true&characterEncoding=utf8";
		String user="root";
		String password="12345njcit";
		
		public Connection conn;
		public DBConnection() {
			try {
				Class.forName(classDriver);//注册驱动
				try {
					conn=DriverManager.getConnection(url,user,password);//获取连接
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

}
