<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<title>Home</title>
<meta name="description" content="">

<%@ include file="headInclude.jsp"%>
</head>

<body>
	<%@ include file="navbarInclude.jsp"%>

	<section class="title">
		<div class="container">
			<div class="row-fluid">
				<div class="span6">
					<h1>Sign up!</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- / .title -->


	<section id="registration-page" class="container">
		<form class="center" action="signupServlet" method="POST">
			<fieldset class="registration-form">
				<div class="control-group">
					<!-- Username -->
					<div class="controls">
						<input type="text" id="username" name="username"
							placeholder="Username" class="input-xlarge">
					</div>
				</div>
				
				<div class="control-group">
					<!-- DOB -->
					<div class="controls">
						<input type="date" id="dob" name="dob"
							placeholder="Date of Birth (YYYY-MM-DD)" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<!-- E-mail -->
					<div class="controls">
						<input type="text" id="email" name="email" placeholder="E-mail"
							class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<!-- Password-->
					<div class="controls">
						<input type="password" id="password" name="password"
							placeholder="Password" class="input-xlarge">
					</div>
				</div>

				<div class="control-group">
					<!-- Button -->
					<div class="controls">
						<button class="btn btn-success btn-large btn-block">Sign up!</button>
					</div>
				</div>
			</fieldset>
		</form>
	</section>
	<!-- /#registration-page -->

	<%@ include file="footerInclude.jsp"%>

	<script src="js/vendor/jquery-1.9.1.min.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>