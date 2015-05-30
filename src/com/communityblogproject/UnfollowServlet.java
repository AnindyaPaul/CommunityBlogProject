package com.communityblogproject;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UnfollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user=(User)request.getSession().getAttribute("User");
		String UserId=user.getUserId();
		String unfollowId=request.getParameter("unfollowID");
		jdbc data=new jdbc();
		data.deleteFollowRow(UserId,unfollowId);
		data.close();
		response.sendRedirect("home");
	}

}
