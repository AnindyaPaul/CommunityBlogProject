<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<h2>Heading</h2>
					<p>
						Vivamus sagittis lacus vel augue laoreet rutrum faucibus
						dolor auctor. Duis mollis, est non commodo luctus, nisi erat
						porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus,
						porta ac consectetur ac, vestibulum at eros.
					</p>
					<h3>Sub-heading</h3>
					<p>
						Cum sociis natoque penatibus et magnis dis parturient
						montes, nascetur ridiculus mus.
					</p>
					<pre><code>Example code block</code></pre>
					<p>
						Aenean lacinia bibendum nulla sed consectetur. Etiam porta
						sem malesuada magna mollis euismod. Fusce dapibus, tellus ac
						cursus commodo, tortor mauris condimentum nibh, ut fermentum
						massa.
					</p>
					<h3>Sub-heading</h3>
					<p>
						Cum sociis natoque penatibus et magnis dis parturient
						montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed
						consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce
						dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
						ut fermentum massa justo sit amet risus.
					</p>
					<ul>
						<li>Praesent commodo cursus magna, vel scelerisque nisl
							consectetur et.</li>
						<li>Donec id elit non mi porta gravida at eget metus.</li>
						<li>Nulla vitae elit libero, a pharetra augue.</li>
					</ul>
					<p>
						Donec ullamcorper nulla non metus auctor fringilla. Nulla
						vitae elit libero, a pharetra augue.
					</p>
					<ol>
						<li>Vestibulum id ligula porta felis euismod semper.</li>
						<li>Cum sociis natoque penatibus et magnis dis parturient
							montes, nascetur ridiculus mus.</li>
						<li>Maecenas sed diam eget risus varius blandit sit amet non
							magna.</li>
					</ol>
					<p>Cras mattis consectetur purus sit amet fermentum. Sed
						posuere consectetur est at lobortis.</p>
				</div>
				<!-- /.blog-post -->
				
				<div class="blog-post text-justify">
					<h2 class="blog-post-title">Another blog post</h2>
					<p class="blog-post-meta">
						December 23, 2013 by <a href="#">Jacob</a>
					</p>
					<img src="http://placekitten.com/900/400" class="img-responsive"></img>
					<p>
						Cum sociis natoque penatibus et magnis <a href="#">dis parturient montes</a>,
						nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia
						quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras
						mattis consectetur purus sit amet fermentum.
					</p>
					<blockquote>
						<p>
							Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna 
							mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies 
							vehicula ut id elit.
						</p>
					</blockquote>
					<p>
						Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis 
						consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla 
						sed consectetur.
					</p>
					<p>
						Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. 
						Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget 
						lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, 
						vestibulum at eros.
					</p>
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