<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.communityblogproject.*"%>

<%

	jdbc jdbcObj = new jdbc();
	ArrayList<Post> postList = jdbcObj.getAllPost();

%>

<!DOCTYPE html>

<html lang="en">

<head>
	<%@ include file="includeHead.jsp"%>
	
	<!-- Title of the page -->
	<title>Community Blog</title>
</head>

<body>

	<%@ include file="includeNav.jsp"%>

	<!-- Recent blog posts -->
	<div class="container">
		<div class="row">
			<div class="col-sm-8 blog-main">
				<div class="blog-post text-justify">
				<%
				for(int i = 0; i < postList.size(); i++) {
					Post post = postList.get(i);
				%>
					<h2 class="blog-post-title"><a href="post?postID=<%= post.getId() %>"><%= post.getTitle() %></a></h2>
					<p class="blog-post-meta">
						<%= post.getDate() %> by <a href="#"><%= post.getAuthorId() %></a>
						<span class="glyphicon glyphicon-thumbs-up upvote-icon" aria-hidden="true"></span> <%= post.getUpvote() %>
						<span class="glyphicon glyphicon-thumbs-down downvote-icon" aria-hidden="true"></span> <%= post.getDownvote() %>
					</p>
				<%
				}
				%>
				</div>
				<!-- /.blog-post -->
				
			</div>
			<!-- /.blog-main -->
			
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
			</div>
			<!-- /.blog-sidebar -->
		</div>
		<!-- /.row -->
	</div>
	<!-- ./container -->

	<%@ include file="includeFooter.jsp" %>

	<!-- Bootstrap JavaSrcipt resources -->
	<script src="js/jQuery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>

</html>