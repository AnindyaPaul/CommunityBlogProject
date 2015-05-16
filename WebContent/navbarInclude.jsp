<!-- To be included in all the pages for the header -->

<!--Header-->
<header class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>
			<a id="logo" class="pull-left" href="home"></a>
			<div class="nav-collapse collapse pull-right">
				<ul class="nav">
					<li
						class="<%if (request.getRequestURI().equals("/CommunityBlogProject/home"))
				out.print("active");%>">
						<a href="home">Home</a></li>
					<li
						class="<%if (request.getRequestURI().equals("/CommunityBlogProject/signup"))
				out.print("active");%>">
						<a href="signup">Sign up</a></li>
					<li class="login"><a data-toggle="modal" href="#loginForm"><i
							class="icon-lock"></i></a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</header>
<!-- /header -->

<!--  Login form -->
<div class="modal hide fade in" id="loginForm" aria-hidden="false">
	<div class="modal-header">
		<i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
		<!-- <h4>Login</h4> -->
	</div>
	<!--Modal Body-->
	<div class="modal-body">
		<form class="form-inline" action="signinServlet" method="post"
			id="form-login">
			<input type="text" class="input-small" placeholder="Email"
				name="email" /> <input type="password" class="input-small"
				placeholder="Password" name="password" /> <label class="checkbox">
				<input type="checkbox" name="rememberMe" /> Remember me
			</label>
			<button type="submit" class="btn btn-primary">Sign in</button>
		</form>
		<!-- 			<a href="#">Forgot your password?</a> -->
	</div>
	<!--/Modal Body-->
</div>
<!--  /Login form -->