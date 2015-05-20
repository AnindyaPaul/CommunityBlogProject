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
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("dob"));
		System.out.println(request.getParameter("email"));
		System.out.println(request.getParameter("password"));
		response.sendRedirect("home");
	}

}
