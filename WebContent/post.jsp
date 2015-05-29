<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.communityblogproject.*" %>

<%
	jdbc jdbcObj = new jdbc();
	Post post = jdbcObj.getPostById(request.getParameter("postID"));
	User postAuthor = jdbcObj.getUserbyId(post.getAuthorId());
	ArrayList<Comment> commentList = jdbcObj.getAllComment(post.getId());
%>

<!DOCTYPE html>

<html lang="en">

<head>
	<%@ include file="includeHead.jsp" %>
    
    <!-- Title of the page -->
	<title>View post</title>
</head>

<body>

	<%@ include file="includeNav.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-8 blog-main">
				<div class="blog-post text-justify">
					<h2 class="blog-post-title"><%= post.getTitle() %></h2>
					<p class="blog-post-meta">
						<%= post.getDate() %> by <a href="profile?userID=<%= postAuthor.getUserId() %>"><%= postAuthor.getUserName() %></a>
						<span class="glyphicon glyphicon-thumbs-up upvote-icon" aria-hidden="true"></span> <%= post.getUpvote() %>
						<span class="glyphicon glyphicon-thumbs-down downvote-icon" aria-hidden="true"></span> <%= post.getDownvote() %>
					</p>
					<%= post.getText() %>
				</div>
				<!-- /.blog-post -->
				
				<!-- Comments section -->
				<hr />
				
				<h3 id="id-comment-title">Comments</h3>
				<%
				for(int i = 0; i < commentList.size(); i++) {
					Comment comment = commentList.get(i);
					User commentAuthor = jdbcObj.getUserbyId(comment.getAuthorId());
				%>
				<div class="comment">
					<p class="blog-post-meta">
						<a href="profile?userID=<%= commentAuthor.getUserId() %>"><%= commentAuthor.getUserName() %></a> on <%= comment.getDate() %>
					</p>
					<%= comment.getText() %>
				</div>
				<% } %>
				
				<% if(loggedInUser != null) { %>
				<div class="comment comment-form">
					<form class="form-horizontal" action="pushCommentServlet" method="post">
						<div class="form-group comment-form">
							<input type="text" class="form-control" placeholder="Enter your comment" name="commentContent" />
							<input type="hidden" name="postID" value="<%= post.getId() %>" />
						</div>
						<div class="form-group comment-form">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>
				<% } %>
				<!-- /Comments section -->
				
			</div>
		
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module">
					<h4>Top tags</h4>
					<ol class="list-unstyled">
						<li><a href="#">Bangladesh</a></li>
						<li><a href="#">Dhaka</a></li>
						<li><a href="#">Election</a></li>
						<li><a href="#">CSEDU</a></li>
						<li><a href="#">Barcelona</a></li>
						<li><a href="#">Khaleda Zia</a></li>
					</ol>
				</div>
				
				<div class="sidebar-module">
					<h4>Get social!</h4>
					<ol class="list-unstyled">
						<li><a href="#">Facebook</a></li>
						<li><a href="#">Twitter</a></li>
						<li><a href="#">Instagram</a></li>
						<li><a href="#">Youtube</a></li>
					</ol>
				</div>
			</div><!-- /.blog-sidebar -->
		</div>
	</div>
	
	
	
	<%@ include file="includeFooter.jsp" %>
	
	<!-- Bootstrap JavaSrcipt resources -->
	<script src="js/jQuery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>

</html>