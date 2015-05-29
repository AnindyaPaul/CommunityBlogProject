<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
					<h2 class="blog-post-title">Sample blog post</h2>
					<p class="blog-post-meta">
						January 1, 2014 by <a href="#">Mark</a>
						<span class="glyphicon glyphicon-thumbs-up upvote-icon" aria-hidden="true"></span> 5
						<span class="glyphicon glyphicon-thumbs-down downvote-icon" aria-hidden="true"></span> 2
					</p>
					<img src="http://placekitten.com/1000/400" class="img-responsive"></img>
					<p class="lead">
						Cum sociis natoque penatibus et magnis <a href="#">dis
						parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam.
						Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed
						posuere consectetur est at lobortis. Cras mattis consectetur purus
						sit amet fermentum.
					</p>
					<blockquote>
						<p>
							Curabitur blandit tempus porttitor. <strong>Nullam quis
							risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id
							nibh ultricies vehicula ut id elit.
						</p>
					</blockquote>
					<p>
						Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras
						mattis consectetur purus sit amet fermentum. Aenean lacinia
						bibendum nulla sed consectetur.
					</p>
				</div>
				<!-- /.blog-post -->
				
				<!-- Comments section -->
				<hr />
				
				<h3 id="id-comment-title">Comments</h3>
				
				<div class="comment">
					<p class="blog-post-meta">
						<a href="#">Anindya</a> on January 1, 2014
					</p>
					Great article brother!
				</div>
				<div class="comment">
					<p class="blog-post-meta">
						<a href="#">Anindya</a> on January 1, 2014
					</p>
					Great article brother!
				</div>
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