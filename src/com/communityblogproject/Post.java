package com.communityblogproject;
import java.util.*;
public class Post extends Content{
	String authorId;
	int views,upvote,downvote;
	String text;
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	Date date_time;
	jdbc data;
	Post()
	{
		data=new jdbc();
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorID) {
		this.authorId = authorID;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getUpvote() {
		return upvote;
	}
	public void setUpvote(int upvote) {
		this.upvote = upvote;
	}
	public int getDownvote() {
		return downvote;
	}
	public void setDownvote(int downvote) {
		this.downvote = downvote;
	}
	public Date getDate_time() {
		return date_time;
	}
	public void setDate_time(Date date_time) {
		this.date_time = date_time;
	}
}	
