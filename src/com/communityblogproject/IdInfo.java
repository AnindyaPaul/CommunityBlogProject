package com.communityblogproject;

import java.util.ArrayList;

public class IdInfo {
	static int userId=1,postId=1,commentId=1;
	static{
		jdbc data=new jdbc();
		String id;
		ArrayList<Post>postList=data.getAllPost();
		if(postList.size()>0)
		{
			Post temp=postList.get(postList.size()-1);
			id=temp.getId();
			postId=Integer.parseInt(id);
			postId++;
		}
		id=data.getMaxCommentId();
		commentId=Integer.parseInt(id);
		commentId++;
		id=data.getMaxUserId();
		userId=Integer.parseInt(id);
		userId++;
		System.out.println(userId + " " + postId + " " + commentId);
	}
}
