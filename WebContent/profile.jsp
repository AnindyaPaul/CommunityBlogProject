<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.communityblogproject.*"%>

<!DOCTYPE html>

<html lang="en">

<head>
	<%@ include file="includeHead.jsp"%>
	
	<!-- Title of the page -->
	<title>Profile</title>
</head>

<body>

	<%@ include file="includeNav.jsp"%>
	
	<div class="container">
		<div class="col-sm-12">
			<h1 class="text-center" id="id-profile-title">User's profile</h1>
		</div>
		
		<div class="col-sm-8 col-sm-offset-2 well">
			<div class="row">
				
				<div class="col-sm-7 profile-info">
					<div class="row profile-element">
						<label for="id-user-name" class="col-sm-3 text-right">Name</label> 
						<div class="col-sm-9 text-left" id="id-user-name"><% User user = (User) session.getAttribute("User"); if(user != null) out.print(user.getUserName()); %></div>
					</div>
					<div class="row profile-element">
						<label for="id-user-email" class="col-sm-3 text-right">Email</label>
						<div class="col-sm-9 text-left" id="id-user-email">abcde@xyz.com</div>
					</div>
					<div class="row profile-element">
						<label for="id-user-dob" class="col-sm-3 text-right">Birthday</label>
						<div class="col-sm-9 text-left" id="id-user-dob">08-07-1993</div>
					</div>
					<div class="row profile-element">
						<label for="id-user-bio" class="col-sm-3 text-right">About</label>
						<div class="col-sm-9 text-left" id="id-user-bio">I am a programmer and a science enthusiast.</div>
					</div>
					<div class="row profile-element">
						<label for="id-user-reputation" class="col-sm-3 text-right">Reputation</label>
						<div class="col-sm-9 text-left" id="id-user-reputation">+20</div>
					</div>
				</div>
				
				<div class="col-sm-4 col-sm-offset-1">
					<img src="http://placekitten.com/700/700" class="img-responsive profile-picture"></img>
				</div>
			</div>
			<hr />
			
			<ul class="nav nav-tabs">
			  <li role="presentation"><a href="#">Posts</a></li>
			  <li role="presentation"><a href="#">Followers</a></li>
			  <li role="presentation"><a href="#">Following</a></li>
			</ul>
			
		</div>
	</div>
	
	<%@ include file="includeFooter.jsp" %>

	<!-- Bootstrap JavaSrcipt resources -->
	<script src="js/jQuery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>

</html>