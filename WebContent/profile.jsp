<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.communityblogproject.*" %>

<%

	jdbc jdbcObj = new jdbc();
	User user = jdbcObj.getUserbyId(request.getParameter("userID"));
	ArrayList<Post> postList = jdbcObj.getPostByAuthor(user.getUserId());
	ArrayList<User> followers = jdbcObj.getFollowers(user.getUserId());
	ArrayList<User> following = jdbcObj.getFollowing(user.getUserId());

%>

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
<!-- 		<div class="col-sm-12"> -->
<%-- 			<h1 class="text-center" id="id-profile-title"><%= user.getUserName() %>'s profile</h1> --%>
<!-- 		</div> -->
		
		<div class="col-sm-8 col-sm-offset-2 well" id="id-profile-well">
			<div class="row">
				
				<div class="col-sm-7 profile-info">
					<div class="row profile-element">
						<label for="id-user-name" class="col-sm-3 text-right">Name</label> 
						<div class="col-sm-9 text-left" id="id-user-name"><%= user.getUserName() %></div>
					</div>
					<div class="row profile-element">
						<label for="id-user-email" class="col-sm-3 text-right">Email</label>
						<div class="col-sm-9 text-left" id="id-user-email"><%= user.getUserEmail() %></div>
					</div>
					<div class="row profile-element">
						<label for="id-user-dob" class="col-sm-3 text-right">Birthday</label>
						<div class="col-sm-9 text-left" id="id-user-dob"><%= user.getUserDOB() %></div>
					</div>
					<div class="row profile-element">
						<label for="id-user-bio" class="col-sm-3 text-right">About</label>
						<div class="col-sm-9 text-left" id="id-user-bio"><%= user.getUserBio() %></div>
					</div>
					<div class="row profile-element">
						<label for="id-user-reputation" class="col-sm-3 text-right">Reputation</label>
						<div class="col-sm-9 text-left" id="id-user-reputation"><%= user.getUserReputation() %></div>
					</div>
					<div class="col-sm-3 text-right">
						<% if(loggedInUser != null && user.getUserId().equals(loggedInUser.getUserId())) { %>
						<form action="editProfile" method="post">
							<button type="submit" class="btn btn-primary">Edit</button>
						</form>
						<% } else if(loggedInUser != null) { %>
						
							<%
							if(jdbcObj.checkFollow(loggedInUser.getUserId(), user.getUserId())) {
							%>
							<form action="unfollowServlet" method="post">
								<input type="hidden" name="unfollowID" value="<%= user.getUserId() %>" />
								<button type="submit" class="btn btn-primary">Unfollow</button>
							</form>
							<%
							} else {
							%>
							<form action="followServlet" method="post">
								<input type="hidden" name="followID" value="<%= user.getUserId() %>" />
								<button type="submit" class="btn btn-primary">Follow</button>
							</form>
							<%
							}
							%>
						<% } %>
					</div>
				</div>
				
				<div class="col-sm-4 col-sm-offset-1">
					<img src="http://placekitten.com/700/700" class="img-responsive profile-picture"></img>
				</div>
			</div>
			<hr />
			
			<div role="tabpanel">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#id-posts" aria-controls="id-posts" role="tab" data-toggle="tab">Posts</a></li>
					<li role="presentation"><a href="#id-followers" aria-controls="id-followers" role="tab" data-toggle="tab">Followers</a></li>
					<li role="presentation"><a href="#id-following" aria-controls="id-following" role="tab" data-toggle="tab">Following</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="id-posts">
						<div class="blog-post">
						<%
						for(int i = 0; i < postList.size(); i++) {
							Post post = postList.get(i);
						%>
							<h2 class="blog-post-title"><a href="post?postID=<%= post.getId() %>"><%= post.getTitle() %></a></h2>
							<p class="blog-post-meta">
								<%= post.getDate() %>
								<span class="glyphicon glyphicon-thumbs-up upvote-icon" aria-hidden="true"></span> <%= post.getUpvote() %>
								<span class="glyphicon glyphicon-thumbs-down downvote-icon" aria-hidden="true"></span> <%= post.getDownvote() %>
							</p>
						<%
						}
						%>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="id-followers">
						<%
						for(int i = 0; i < followers.size(); i++) {
							User tmp = followers.get(i);
						%>
						<p class="follow-list">
							<a href="profile?userID=<%= tmp.getUserId() %>"><%= tmp.getUserName() %></a>
						</p>
						<%
						}
						%>
					</div>
					<div role="tabpanel" class="tab-pane" id="id-following">
						<%
						for(int i = 0; i < following.size(); i++) {
							User tmp = following.get(i);
						%>
						<p class="follow-list">
							<a href="profile?userID=<%= tmp.getUserId() %>"><%= tmp.getUserName() %></a>
						</p>
						<%
						}
						%>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<%@ include file="includeFooter.jsp" %>

	<!-- Bootstrap JavaSrcipt resources -->
	<script src="js/jQuery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>

</html>