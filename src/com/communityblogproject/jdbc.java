package com.communityblogproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class jdbc {
	private Connection connect=null;
	private Statement statement=null;
	private ResultSet result=null;
	private String DB_URL="jdbc:mysql://localhost/CBDB";
	private String user="CBProject";
	private String password="12345";
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
	void newRow(String table, String attribute, String value)
	{
		try{
		sql="INSERT INTO "+table+" ("+attribute+") VALUES (\'"+value+"\')";
		statement=connect.createStatement();
		statement.executeUpdate(sql);
		}catch(Exception e){
		System.out.println(e);
		}
	}
	void setValue(String table,String p_key,String p_key_val,String attribute,String value)
	{
		try{
		sql="UPDATE "+table+" SET "+attribute+" = \'"+value+"\' where "+p_key+" = \'"+p_key_val+"\' ";
		statement=connect.createStatement();
		statement.executeUpdate(sql);
		}catch(Exception e){
		System.out.println(e);
		}
	}
	void setDate(String table,String p_key,String p_key_val,String attribute,String value)
	{
		String new_val="";
		String dd=value.substring(0,2);
		String mm=value.substring(3,5);
		String yy=value.substring(6);
		new_val+=(yy+"-"+mm+"-"+dd);
		setValue(table,p_key,p_key_val,attribute,new_val);
	}
	int countRow(String table)
	{
		int ret=0;
		try{
		sql="SELECT count(*) FROM "+table;
		statement=connect.createStatement();
		result=statement.executeQuery(sql);
		if(result.next()==true){
			ret=Integer.parseInt(result.getString(1));
		}}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	ArrayList<String> query(String table,String required_attribute,String match_attribute,String value){
		ArrayList<String>ret=new ArrayList<String>();
		try{
		sql="SELECT "+required_attribute+" from "+table+" where "+match_attribute+" =\'"+value+"\'";
		statement=connect.createStatement();
		result=statement.executeQuery(sql);
		int i=1;
		if(required_attribute.equals("*")==true)
		{
				if(result.next()){
				{
					//System.out.println(result.getString(i+1));
					while(i<=9)
					ret.add((String)result.getString(i++));
					//System.out.println("Index "+i);
				}
			}
		}
		else if(result.next()==true){
			ret.add((String)result.getString(required_attribute));
		}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	public void close() {
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