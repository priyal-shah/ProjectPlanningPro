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

		<div class="row col-12 col-md-6 offset-md-3 mt-5">
			<form action="addProject" method="post" >
			
				<h3>Add Your Project</h3>
				<span class="text-danger">${errorMsg }</span>
				<span class="text-success">${successMsg }</span>
				<div class="mb-3">
					<label for="title" class="form-label">Title
						</label> <input type="text" class="form-control"
						id="tite"  name="name" required="required">
					
				</div>
				
				<div class="mb-3">
					<label for="desc" class="form-label">Description</label>
					<textarea  class="form-control"
						id="desc" name="desc" ></textarea>
				</div>
				
				<button type="submit" class="btn btn-primary">Add</button>
			</form>
		</div>



	</div>

	<%@include file="./baseScript.jsp"%>
</body>
</html>