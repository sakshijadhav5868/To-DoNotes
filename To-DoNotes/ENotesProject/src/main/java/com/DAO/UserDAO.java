package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collection;

import com.user.Userdetails;

public class UserDAO {
 
	private  Connection conn;
	
	public UserDAO(Connection conn) {
		super();
		this.conn=conn;
		
	}
	public boolean addUser(Userdetails us) {
		boolean  f=false;
		try {
			String quary="insert into user  (id ,name, email,password)values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(quary);
			ps.setInt(1, us.getId());
			ps.setString(2, us.getName());
			ps.setString(3, us.getEmail());
			ps.setString(4, us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;	
	}
	
	public Userdetails loginUser(Userdetails us) {
		 Userdetails user=null;
		try {
			String q1="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(q1);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				user=new Userdetails();
			   user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
	
}
