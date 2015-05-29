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

/**
 * Servlet implementation class PushPostServlet
 */
public class PushPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user=(User)request.getSession().getAttribute("User");
		String authorID=user.getUserId();
		String postTitle=request.getParameter("postTitle");
		String postContent=request.getParameter("postContent");
		String postUpvote="0";
		String postDownvote="0";
		String postView="0";
		Date date=new Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = formatter.format(date);
		jdbc data=new jdbc();
		int new_id=data.countRow("post");
		new_id++;
		data.newRow("post", "postID",""+new_id);
		data.setValue("post","postID",""+new_id,"postTitle",postTitle);
		data.setValue("post","postID",""+new_id,"postContent",postContent);
		data.setValue("post","postID",""+new_id,"postDate",currentDate);
		data.setValue("post","postID",""+new_id,"postUpvote",postUpvote);
		data.setValue("post","postID",""+new_id,"postDownvote",postDownvote);
		data.setValue("post","postID",""+new_id,"postViewCount",postView);
		data.setValue("post","postID",""+new_id,"postAuthor",authorID);
		data.close();
		response.sendRedirect("home");
	}

}
