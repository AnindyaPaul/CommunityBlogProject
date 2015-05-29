package com.communityblogproject;
import java.util.*;
public class Post extends Content{
	String authorId,date;
	int views,upvote,downvote;
	String text;
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	Post()
	{
		
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
}	
