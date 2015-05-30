package com.communityblogproject;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user=new User();
		user=(User)request.getSession().getAttribute("User");
		String User_id=user.getUserId();
		String UserName=(String)request.getParameter("name");
		String UserDOB=(String)request.getParameter("dob");
		String UserEmail=(String)request.getParameter("email");
		String UserPassword=(String)request.getParameter("password");
		String UserBio=(String)request.getParameter("bio");
		jdbc data=new jdbc();
		data.setValue("user","UserId",User_id,"UserName",UserName);
		data.setValue("user","UserId",User_id,"UserEmail",UserEmail);
		data.setValue("user","UserId",User_id,"UserPassword",UserPassword);
		data.setDate("user","UserId",User_id,"UserDOB",UserDOB);
		data.setValue("user","UserId",User_id,"UserBio","");
		data.setValue("user","UserId",User_id,"UserReputation","0");
		user.setUserBio(UserBio);
		user.setUserReputation("0");
		user.setUserName(UserName);
		user.setUserEmail(UserEmail);
		user.setUserPassword(UserPassword);
		request.getSession().setAttribute("User", user);
	}

}
