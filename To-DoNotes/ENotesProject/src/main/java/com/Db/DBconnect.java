package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {

	public static Connection conn;
	public static  Connection  getConn() {
		
		try {
			if(conn==null) {
				 Class.forName("com.mysql.jdbc.Driver");
				 System.out.println("build..");
				 String url="jdbc:mysql://localhost:3306/enotes";
				 String  username="root";
				 String password="root";
				 conn=DriverManager.getConnection(url, username, password);
				 System.out.println(conn);
			}
		
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
