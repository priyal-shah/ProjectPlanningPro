<%@page import="java.util.List"%>
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
		
		
		<div class="row col-12 m-0">
			<div class="col-12 col-md-2  ">

				<jsp:include page="./VerticalProjectNavBar.jsp">
					<jsp:param value="${Project }" name="Project"/>
				</jsp:include>
			</div>
			
			<div class="col-12 col-md-10 mt-4">
			
				<form action="<%=request.getContextPath() %>/projectPlanningPro/project/addTask/${Project.pId}" method="post" >
			
				<h3>Add Task</h3>
				<span class="text-danger">${errorMsg }</span>
				<span class="text-success">${successMsg }</span>
				<div class="mb-3">
					<label for="name" class="form-label">Name</label> 
					<input type="text" class="form-control"
						id="name"  name="name" required="required">
					
				</div>
				
				<div class="mb-3">
					<label for="desc" class="form-label">Description</label>
					<input type="text" class="form-control"
						id="desc" name="desc" required="required">
				</div>
				
				<div class="mb-3">
					<label for="user" class="form-label">Assign To</label>
					<select name="userId" >
						<option value="0">Select</option>
						<%List <User> users=(List)request.getAttribute("users");
							for(User user:users){
						%>
						<option value="<%=user.getuId()%>"> userId<%=user.getuId()%> - <%=user.getName() %></option>
						
						<%} %>
					</select>
				</div>
				
				<button type="submit" class="btn btn-primary">Add</button>
			</form>
			
			</div>
		</div>
		
		



	</div>

	<%@include file="./baseScript.jsp"%>
</body>
</html>