package com.communityblogproject;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside signup servlet.");
		String UserName=(String)request.getParameter("name");
		String UserDOB=(String)request.getParameter("dob");
		String UserEmail=(String)request.getParameter("email");
		String UserPassword=(String)request.getParameter("password");
		System.out.println(UserName);
		System.out.println(UserDOB);
		System.out.println(UserEmail);
		System.out.println(UserPassword);
		jdbc data=new jdbc();
		int new_id=data.countRow("user");
		new_id++;
		data.newRow("user", "UserId",""+new_id);
		data.setValue("user","UserId",""+new_id,"UserName",UserName);
		data.setValue("user","UserId",""+new_id,"UserEmail",UserEmail);
		data.setValue("user","UserId",""+new_id,"UserPassword",UserPassword);
		data.setDate("user","UserId",""+new_id,"UserDOB",UserDOB);
		data.setValue("user","UserId",""+new_id,"UserBio","");
		data.setValue("user","UserId",""+new_id,"UserReputation","0");
		User user=new User();
		user.setUserId(""+new_id);
		user.setUserBio("");
		user.setUserReputation("0");
		user.setUserName(UserName);
		user.setUserEmail(UserEmail);
		user.setUserPassword(UserPassword);
		request.getSession().setAttribute("User", user);
		IdInfo.userId++;
		System.out.println("User id = "+IdInfo.postId);
		data.close();
		response.sendRedirect("home");
	}

}
