package com.communityblogproject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

	public jdbc()
	{
		try{
		Class.forName(driver);
		System.out.println("Connecting to database...");
		connect=DriverManager.getConnection(DB_URL, user, password);
		}catch(Exception e){
			System.out.println(e);
		}
	}
	public void newRow(String table, String attribute, String value)
	{
		try{
		sql="INSERT INTO "+table+" ("+attribute+") VALUES (\'"+value+"\')";
		statement=connect.createStatement();
		statement.executeUpdate(sql);
		}catch(Exception e){
		System.out.println(e);
		}
	}
	public void newFollowRow(String value1,String value2)
	{
		try{
			sql="INSERT INTO follow (userID, followingID) VALUES (\'"+value1+"\',\'"+value2+"\')";
			statement=connect.createStatement();
			statement.executeUpdate(sql);
			}catch(Exception e){
			System.out.println(e);
			}
	}
	public void setValue(String table,String p_key,String p_key_val,String attribute,String value)
	{
		try{
		sql="UPDATE "+table+" SET "+attribute+" = \'"+value+"\' where "+p_key+" = \'"+p_key_val+"\' ";
		statement=connect.createStatement();
		statement.executeUpdate(sql);
		}catch(Exception e){
		System.out.println(e);
		}
	}
	public void setDate(String table,String p_key,String p_key_val,String attribute,String value)
	{
		String new_val="";
		String dd=value.substring(0,2);
		String mm=value.substring(3,5);
		String yy=value.substring(6);
		new_val+=(yy+"-"+mm+"-"+dd);
		setValue(table,p_key,p_key_val,attribute,new_val);
	}
	public int countRow(String table)
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
	public ArrayList<String> query(String table,String required_attribute,String match_attribute,String value){
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
					if(table.equals("user"))
					while(i<=9)
					ret.add((String)result.getString(i++));
					//System.out.println("Index "+i);
				}
			}
		}
		else while(result.next()==true){
			ret.add((String)result.getString(required_attribute));
		}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	public ArrayList<Post> getAllPost()
	{
		ArrayList<Post> ret=new ArrayList<Post>();
		try{
			sql="SELECT * from post";
			statement=connect.createStatement();
			result=statement.executeQuery(sql);
			while(result.next()){
				Post temp=new Post();
				temp.setId(result.getString(1));
				temp.setTitle(result.getString(2));
				temp.setText(result.getString(3));
				temp.setAuthorId(result.getString(4));
				String value=result.getString(5);
				String date="";
				String dd=value.substring(8,10);
				String mm=value.substring(5,7);
				String yy=value.substring(0,4);
				date+=(dd+"-"+mm+"-"+yy);
				temp.setDate(date);
				temp.setUpvote(Integer.parseInt(result.getString(6)));
				temp.setDownvote(Integer.parseInt(result.getString(7)));
				temp.setViews(Integer.parseInt(result.getString(8)));
				ret.add(temp);
			}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	public ArrayList<Post> getPostByTag(String value){
		ArrayList<Post> ret=new ArrayList<Post>();
		try{
			ArrayList<String>requiredId=query("posttagrelation","postID","tagID",value);
			int i;
			for(i=0;i<requiredId.size();i++)
			{
				sql="SELECT * from post where postID=\'"+requiredId.get(i)+"\'";
				statement=connect.createStatement();
				result=statement.executeQuery(sql);
				while(result.next()){
					Post temp=new Post();
					temp.setId(result.getString(1));
					temp.setTitle(result.getString(2));
					temp.setText(result.getString(3));
					temp.setAuthorId(result.getString(4));
					value=result.getString(5);
					String date="";
					String dd=value.substring(8,10);
					String mm=value.substring(5,7);
					String yy=value.substring(0,4);
					date+=(dd+"-"+mm+"-"+yy);
					temp.setDate(date);
					temp.setUpvote(Integer.parseInt(result.getString(6)));
					temp.setDownvote(Integer.parseInt(result.getString(7)));
					temp.setViews(Integer.parseInt(result.getString(8)));
					ret.add(temp);
				}
			}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}

	}

	public ArrayList<Post> getPostByCategory(String value)
	{
		ArrayList<Post> ret=new ArrayList<Post>();
		try{
			ArrayList<String>requiredId=query("postcategoryrelation","postID","categoryID",value);
			int i;
			for(i=0;i<requiredId.size();i++)
			{
				sql="SELECT * from post where postID=\'"+requiredId.get(i)+"\'";
				statement=connect.createStatement();
				result=statement.executeQuery(sql);
				while(result.next()){
					Post temp=new Post();
					temp.setId(result.getString(1));
					temp.setTitle(result.getString(2));
					temp.setText(result.getString(3));
					temp.setAuthorId(result.getString(4));
					value=result.getString(5);
					String date="";
					String dd=value.substring(8,10);
					String mm=value.substring(5,7);
					String yy=value.substring(0,4);
					date+=(dd+"-"+mm+"-"+yy);
					temp.setDate(date);
					temp.setUpvote(Integer.parseInt(result.getString(6)));
					temp.setDownvote(Integer.parseInt(result.getString(7)));
					temp.setViews(Integer.parseInt(result.getString(8)));
					ret.add(temp);
				}
			}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}

	public ArrayList<Post> getPostByAuthor(String value)
	{
		ArrayList<Post> ret=new ArrayList<Post>();
		try{
			sql="SELECT * from post where postAuthor=\'"+value+"\'";
			statement=connect.createStatement();
			result=statement.executeQuery(sql);
			while(result.next()){
				Post temp=new Post();
				temp.setId(result.getString(1));
				temp.setTitle(result.getString(2));
				temp.setText(result.getString(3));
				temp.setAuthorId(result.getString(4));
				value=result.getString(5);
				String date="";
				String dd=value.substring(8,10);
				String mm=value.substring(5,7);
				String yy=value.substring(0,4);
				date+=(dd+"-"+mm+"-"+yy);
				temp.setDate(date);
				temp.setUpvote(Integer.parseInt(result.getString(6)));
				temp.setDownvote(Integer.parseInt(result.getString(7)));
				temp.setViews(Integer.parseInt(result.getString(8)));
				ret.add(temp);
			}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	public Post getPostById(String value)
	{
		Post ret=new Post();
		try{
			sql="SELECT * from post where postID=\'"+value+"\'";
			statement=connect.createStatement();
			result=statement.executeQuery(sql);
			if(result.next()){
				Post temp=new Post();
				temp.setId(result.getString(1));
				temp.setTitle(result.getString(2));
				temp.setText(result.getString(3));
				temp.setAuthorId(result.getString(4));
				value=result.getString(5);
				String date="";
				String dd=value.substring(8,10);
				String mm=value.substring(5,7);
				String yy=value.substring(0,4);
				date+=(dd+"-"+mm+"-"+yy);
				temp.setDate(date);
				temp.setUpvote(Integer.parseInt(result.getString(6)));
				temp.setDownvote(Integer.parseInt(result.getString(7)));
				temp.setViews(Integer.parseInt(result.getString(8)));
				ret=temp;
			}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	public User getUserbyId(String value){
		User ret=new User();
		try{
			sql="SELECT * from user where UserId=\'"+value+"\'";
			statement=connect.createStatement();
			result=statement.executeQuery(sql);
			if(result.next()){
				User temp=new User();
				temp.setUserId(result.getString(1));
				temp.setUserName(result.getString(2));
				value=result.getString(3);
				String date="";
				String dd=value.substring(8,10);
				String mm=value.substring(5,7);
				String yy=value.substring(0,4);
				date+=(dd+"-"+mm+"-"+yy);
				temp.setUserDOB(date);
				temp.setUserBio(result.getString(4));
				temp.setUserReputation(result.getString(5));
				temp.setUserPassword(result.getString(6));
				temp.setUserRole(result.getString(7));
				temp.setUserEmail(result.getString(9));
				ret=temp;
			}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	public ArrayList<Comment> getAllComment(String value)
	{
		ArrayList<Comment> ret=new ArrayList<Comment>();
		try{
			sql="SELECT * from comment where commentPostId=\'"+value+"\'";
			statement=connect.createStatement();
			result=statement.executeQuery(sql);
			while(result.next()){
				Comment temp=new Comment();
				temp.setId(result.getString(1));
				temp.setAuthorId(result.getString(2));
				temp.setText(result.getString(3));
				temp.setPostId(result.getString(6));
				value=result.getString(4);
				String date="";
				String dd=value.substring(8,10);
				String mm=value.substring(5,7);
				String yy=value.substring(0,4);
				date+=(dd+"-"+mm+"-"+yy);
				temp.setDate(date);
				temp.setUpvote(Integer.parseInt(result.getString(6)));
				temp.setDownvote(Integer.parseInt(result.getString(7)));
				ret.add(temp);
			}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	public ArrayList<User> getUsersFollowing(String value)
	{
		ArrayList<User> ret=new ArrayList<User>();
		try{
			ArrayList<String>requiredId=query("follow","userID","followingID",value);
			int i;
			for(i=0;i<requiredId.size();i++)
			{
				sql="SELECT * from user where UserID=\'"+requiredId.get(i)+"\'";
				statement=connect.createStatement();
				result=statement.executeQuery(sql);
				while(result.next()){
					User temp=new User();
					temp.setUserId(result.getString(1));
					temp.setUserName(result.getString(2));
					value=result.getString(3);
					String date="";
					String dd=value.substring(8,10);
					String mm=value.substring(5,7);
					String yy=value.substring(0,4);
					date+=(dd+"-"+mm+"-"+yy);
					temp.setUserDOB(date);
					temp.setUserBio(result.getString(4));
					temp.setUserReputation(result.getString(5));
					temp.setUserPassword(result.getString(6));
					temp.setUserRole(result.getString(7));
					temp.setUserEmail(result.getString(9));
					ret.add(temp);
				}
			}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	public ArrayList<User> getFollowers(String value)
	{
		ArrayList<User> ret=new ArrayList<User>();
		try{
			ArrayList<String>requiredId=query("follow","userID","followingID",value);
			int i;
			for(i=0;i<requiredId.size();i++)
			{
				sql="SELECT * from user where UserID=\'"+requiredId.get(i)+"\'";
				statement=connect.createStatement();
				result=statement.executeQuery(sql);
				while(result.next()){
					User temp=new User();
					temp.setUserId(result.getString(1));
					temp.setUserName(result.getString(2));
					value=result.getString(3);
					String date="";
					String dd=value.substring(8,10);
					String mm=value.substring(5,7);
					String yy=value.substring(0,4);
					date+=(dd+"-"+mm+"-"+yy);
					temp.setUserDOB(date);
					temp.setUserBio(result.getString(4));
					temp.setUserReputation(result.getString(5));
					temp.setUserPassword(result.getString(6));
					temp.setUserRole(result.getString(7));
					temp.setUserEmail(result.getString(9));
					ret.add(temp);
				}
			}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	public ArrayList<User> getFollowing(String value)
	{
		ArrayList<User> ret=new ArrayList<User>();
		try{
			ArrayList<String>requiredId=query("follow","followingID","userID",value);
			int i;
			for(i=0;i<requiredId.size();i++)
			{
				sql="SELECT * from user where UserID=\'"+requiredId.get(i)+"\'";
				statement=connect.createStatement();
				result=statement.executeQuery(sql);
				while(result.next()){
					User temp=new User();
					temp.setUserId(result.getString(1));
					temp.setUserName(result.getString(2));
					value=result.getString(3);
					String date="";
					String dd=value.substring(8,10);
					String mm=value.substring(5,7);
					String yy=value.substring(0,4);
					date+=(dd+"-"+mm+"-"+yy);
					temp.setUserDOB(date);
					temp.setUserBio(result.getString(4));
					temp.setUserReputation(result.getString(5));
					temp.setUserPassword(result.getString(6));
					temp.setUserRole(result.getString(7));
					temp.setUserEmail(result.getString(9));
					ret.add(temp);
				}
			}
		}catch(Exception e){
		System.out.println(e);
		}finally{
			return ret;
		}
	}
	String getProfilePicture(String value)
	{
		String path="\\temp";
		path+=value;
		path+=".jpg";
		try{
			String sql = "SELECT profilepicture FROM user where UserID=\'"+value+"\'";
		    PreparedStatement stmt = connect.prepareStatement(sql);
		    ResultSet resultSet = stmt.executeQuery();
		    while (resultSet.next()) {
		      String name = resultSet.getString(1);
		      String description = resultSet.getString(2);
		      File image = new File(path);
		      FileOutputStream fos = new FileOutputStream(image);
		      byte[] buffer = new byte[1];
		      InputStream is = resultSet.getBinaryStream(3);
		      while (is.read(buffer) > 0) {
		        fos.write(buffer);
		      }
		      fos.close();
		    }
		}catch(Exception e){
			System.out.println(e);
		}finally{
			return path;
		}
	}
	public boolean checkFollow(String id1,String id2)
	{
		boolean ret=false;
		try{	
			sql="SELECT * from follow where userID=\'"+id1+"\' and followingID=\'"+id2+"\'";
			statement=connect.createStatement();
			result=statement.executeQuery(sql);
			if(result.next()){
				ret=true;	
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
