<%@ page import="com.communityblogproject.*" %>

<% User loggedInUser = (User) session.getAttribute("User"); %>

<!-- Navigation Bar -->
<nav class="navbar navbar-default">
	<div class="container">
		<!-- Toggle group for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#id-navbar-collapse">
				<span class="sr-only">Toggle Navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home">Community Blog</a>
		</div>
		
		<!-- Contents of the navigation bar -->
		<div class="collapse navbar-collapse" id="id-navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="home">Blog</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-expanded="false">Category <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">World</a></li>
						<li><a href="#">Science</a></li>
						<li><a href="#">Technology</a></li>
						<li><a href="#">Sports</a></li>
					</ul>
				</li>
				<% if(loggedInUser != null) { %>
				<li><a href="profile"><%= loggedInUser.getUserName() %></a></li>
				<% } %>
				<% if(loggedInUser == null) { %>
				<li><a href="#" data-toggle="modal" data-target="#id-signin-form">Sign in</a></li>
				<% } else { %>
				<li><a href="signoutServlet">Sign out</a></li>
				<% } %>
			</ul>
		</div>
	</div>
</nav>

<!-- Modal -->
<div class="modal fade" id="id-signin-form" tabindex="-1" role="dialog"
	aria-labelledby="signin-form-label" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="signin-form-label">Sign in!</h4>
			</div>
			
			<div class="modal-body">
				<form class="form-horizontal" action="signinServlet" method="post">
					<div class="form-group">
						<label for="id-signin-email" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="id-signin-email"
								placeholder="Email" name="email" />
						</div>
					</div>
					<div class="form-group">
						<label for="id-signin-password" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="id-signin-password"
								placeholder="Password" name="password" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label>
									<input type="checkbox" /> Remember me
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">Sign in!</button>
						</div>
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<h5 class="text-muted">Don't have an account? <a href="signup">Sign up!</a></h5>
			</div>
			
		</div>
	</div>
</div>