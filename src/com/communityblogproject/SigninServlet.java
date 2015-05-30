package com.communityblogproject;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SigninServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		jdbc data=new jdbc();
		if(password.equals(data.query("user","UserPassword","UserEmail",email).get(0)))
		{
			System.out.println("Matched");
			String id=data.query("user","UserId","UserEmail",email).get(0);
			ArrayList<String>a=data.query("user","*","UserId",id);
			User user=new User();
			user.setUserId(id);
			user.setUserEmail(email);
			String value=a.get(2);
			String dob="";
			String dd=value.substring(0,2);
			String mm=value.substring(3,5);
			String yy=value.substring(6);
			dob+=(yy+"-"+mm+"-"+dd);
			user.setUserDOB(dob);
			user.setUserPassword(password);
			String role=a.get(6);
			user.setUserRole(role);
			String name=a.get(1);
			user.setUserName(name);
			String bio=a.get(3);
			user.setUserBio(bio);
			String reputation=a.get(4);
			user.setUserReputation(reputation);
			request.getSession().setAttribute("User", user);
		}
		System.out.println(email);
		System.out.println(password);
		response.sendRedirect("home");
		data.close();
	}
}
