<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

	<head>
		<%@ include file="includeHead.jsp" %>
	    
	    <!-- Title of the page -->
		<title>Sign up!</title>
	</head>
	
	<body>
	
		<%@ include file="includeNav.jsp" %>
		
		<div class="col-sm-12">
			<h1 class="text-center" id="id-signup-title">Create your account!</h1>
		</div>
		
		<div class="col-sm-offset-3 col-sm-6 well">
			<form class="form-horizontal" action="signupServlet" method="post">
				
				<!-- Name -->
				<div class="form-group">
					<label for="id-signup-name" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="id-signup-name"
							placeholder="Name" name="name" />
					</div>
				</div>
	    		
	    		<!-- DOB -->
				<div class="form-group">
					<label for="id-signup-dob" class="col-sm-2 control-label">DOB</label>
					<div class="col-sm-10">
						<div class="input-group date" id="id-date-time-picker">
							<input type="text" class="form-control" id="id-signup-dob"
								placeholder="DD MM YYYY" name="dob" />
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
							placeholder="Email" name="email" />
					</div>
				</div>
				
				<!-- Password -->
				<div class="form-group">
					<label for="id-signup-password" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="id-signup-password"
							placeholder="Password" name="password" />
					</div>
				</div>
				
				<!-- Button -->
				<div class="form-group" id="id-signup-button">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">Sign up!</button>
					</div>
				</div>
			</form>
		</div>
		
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