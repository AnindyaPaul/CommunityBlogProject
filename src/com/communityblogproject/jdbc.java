package com.communityblogproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class jdbc {
	private Connection connect=null;
	private Statement statement=null;
	private ResultSet result=null;
	private String DB_URL="jdbc:mysql://localhost/communityblog";
	private String user="root";
	private String password="1234";
	private String driver="com.mysql.jdbc.Driver";
	private String sql=null;
	
	jdbc()
	{
		try{
		Class.forName(driver);
		System.out.println("Connecting to database...");
		connect=DriverManager.getConnection(DB_URL, user, password);
		}catch(Exception e){
			System.out.println(e);
		}
	}
//	void insert(String table,String attribute,String value)
//	{
//		try{
//		sql="INSERT INTO "+table+" ("+attribute+") VALUES ('"+value+"')";
//		statement=connect.createStatement();
//		statement.executeQuery(sql);
//		}catch(Exception e){
//		System.out.println(e);
//		}
//	}
	String query(String table,String required_attribute,String match_attribute,String value){
		String ret="";
		try{
		sql="SELECT "+required_attribute+" from "+table+" where "+match_attribute+" ='"+value+"'";
		statement=connect.createStatement();
		result=statement.executeQuery(sql);
		if(result.next()==true){
			ret=result.getString(required_attribute);
		}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	private void close() {
	    try {
	      if (result != null) {
	        result.close();
	      }

	      if (statement != null) {
	        statement.close();
	      }

	      if (connect != null) {
	        connect.close();
	      }
	    } catch (Exception e) {

	    }
	  }
}
