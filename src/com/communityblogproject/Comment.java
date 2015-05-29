package com.communityblogproject;

public class Comment extends Content{
	String authorId,text,postId,upvote,downvote,date;
	public String getAuthorId() {
		return authorId;
	}

	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getUpvote() {
		return upvote;
	}

	public void setUpvote(String upvote) {
		this.upvote = upvote;
	}

	public String getDownvote() {
		return downvote;
	}

	public void setDownvote(String downvote) {
		this.downvote = downvote;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
