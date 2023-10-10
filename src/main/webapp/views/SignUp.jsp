<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./Base.jsp"%>
</head>
<body >

	<div class="container-fluid">
		<div class="row">
			<%@include file="./NavBarHorizontal.jsp"%>
		</div>

		<div class="row col-12 col-md-10 offset-md-1 mt-3 p-3 p-md-2 justify-content-center ">


			<form   action="users" method="post"  style="background-color: white;" class="p-2 row">
				<h4 class="text-center m-3 md-5"
					style="color: #FF1493; text-decoration: underline;">SignUp
					here</h4>
					<span class="text-center text-danger">${errorMsg}</span>
					<span class="text-center text-success">${successMsg}</span>
				<div class="col-12 col-md-6">
					<div class="mb-3">
						<label for="name" class="form-label">Name</label> <input
							type="text" class="form-control" id="name" name="name" required="required">
					</div>

					<div class="mb-3">
						<label for="email" class="form-label">Email address</label> <input
							type="email" class="form-control" id="email" name="email" required="required">
					</div>

					



				</div>
				<div class="row col-12 col-md-6">
					<div class="mb-3">
						<label for="mob" class="form-label">Contact Number</label> <input
							type="text" class="form-control" id="mob"
							name="mob" required="required">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password"
							name="password" required="required">
					</div>
					

				</div>
				
				<div class="mb-3">
						<label class="form-label">Profile Type</label><br> <input
							type="radio" id="public" name="profileType" value="1"><label
							for="public">Leader</label> <input type="radio" id="private"
							name="userType" value="0"><label for="private">Team Memeber</label>
					</div>

				<div class="mb-3 form-check">
					<input type="checkbox" class="form-check-input" id="agreement"  required="required" value="true">
					<label class="form-check-label" for="agreement">Accept all
						terms and conditions</label>
				</div>
				<button type="submit" class="btn btn-primary col-12 col-md-2 signup-btn" >SignUp</button>

			
				<a class="col-12 col-md-5 row mb-5 p-0 offset-md-1 mt-5 mt-md-1 google " >
					<img alt="google" src="../images/google.jpg" class="col-2 google-img">
					<span class="col-10 ">Sign up with google</span>
				</a>
			</form>
		</div>



	</div>


	<%@include file="./baseScript.jsp"%>
</body>
</html>