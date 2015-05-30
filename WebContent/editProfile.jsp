<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.communityblogproject.*"%>

<!DOCTYPE html>

<html lang="en">

<head>
	<%@ include file="includeHead.jsp"%>
	
	<!-- Title of the page -->
	<title>Community Blog</title>
</head>

<body>

	<%@ include file="includeNav.jsp"%>
	
	<div class="container">
		<div class="col-sm-12">
			<h1 class="text-center" id="id-signup-title">Edit profile</h1>
		</div>
		<div class="row">
			<div class="col-sm-offset-3 col-sm-6 well">
				<form class="form-horizontal" action="editProfileServlet" method="post">
					
					<!-- Name -->
					<div class="form-group">
						<label for="id-signup-name" class="col-sm-2 control-label">Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="id-signup-name"
								placeholder="Name" name="name" value="<%= loggedInUser.getUserName() %>" required="required" />
						</div>
					</div>
		    		
		    		<!-- DOB -->
					<div class="form-group">
						<label for="id-signup-dob" class="col-sm-2 control-label">DOB</label>
						<div class="col-sm-10">
							<div class="input-group date" id="id-date-time-picker">
								<input type="text" class="form-control" id="id-signup-dob"
									placeholder="DD MM YYYY" name="dob" required="required" />
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
					</div>
					
					<!-- Email -->
					<div class="form-group">
						<label for="id-signup-email" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="id-signup-email"
								placeholder="Email" name="email" value="<%= loggedInUser.getUserEmail() %>" required="required" />
						</div>
					</div>
					
					<!-- Password -->
					<div class="form-group">
						<label for="id-signup-password" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="id-signup-password"
								placeholder="Enter new password" name="password" required="required" />
						</div>
					</div>
					
					<!-- Name -->
					<div class="form-group">
						<label for="id-signup-name" class="col-sm-2 control-label">About</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="id-signup-name"
								placeholder="Bio" name="bio" value="<%= loggedInUser.getUserBio() %>" />
						</div>
					</div>
					
					<!-- Button -->
					<div class="form-group" id="id-signup-button">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<%@ include file="includeFooter.jsp" %>

	<!-- Bootstrap JavaSrcipt resources -->
	<script src="js/jQuery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/moment.js"></script>
	<script src="js/bootstrap-datetimepicker.min.js"></script>
	
	<script type="text/javascript">
		$(function () {
			$('#id-date-time-picker').datetimepicker({
				format: 'DD MM YYYY',
				maxDate: moment()
			});
		});
	</script>

</body>

</html>