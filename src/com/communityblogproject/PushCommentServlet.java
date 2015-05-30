package com.communityblogproject;

import java.io.IOException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PushCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postID=request.getParameter("postID");
		User user=(User)request.getSession().getAttribute("User");
		String authorID=user.getUserId();
		String commentContent=request.getParameter("commentContent");
		String commentUpvote="0";
		String commentDownvote="0";
		Date date=new Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = formatter.format(date);
		jdbc data=new jdbc();
		int new_id=data.countRow("comment");
		new_id++;
		data.newRow("comment", "commentID",""+new_id);
		data.setValue("comment","commentID",""+new_id,"commentAuthorID",authorID);
		data.setValue("comment","commentID",""+new_id,"commentContent",commentContent);
		data.setValue("comment","commentID",""+new_id,"commentDate",currentDate);
		data.setValue("comment","commentID",""+new_id,"commentUpVote",commentUpvote);
		data.setValue("comment","commentID",""+new_id,"commentDownVote",commentDownvote);
		data.setValue("comment","commentID",""+new_id,"commentPostID",postID);
		data.close();
		IdInfo.commentId++;
		response.sendRedirect("home");
	}

}
