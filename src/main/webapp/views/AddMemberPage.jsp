<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./Base.jsp"%>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<%@include file="./NavBarHorizontal.jsp" %>
		</div>

		<div class="row col-12 m-0">
			<div class="col-12 col-md-2  ">

				<jsp:include page="./VerticalProjectNavBar.jsp">
					<jsp:param value="${Project }" name="Project"/>
				</jsp:include>
			</div>
			
			<div class="col-12 col-md-10 mt-4">
				<h3>Add Member</h3>
				<span class="text-danger">${errorMsg }</span>
				<span class="text-success">${successMsg }</span>
			
			<form action="<%request.getContextPath(); %>/projectPlanningPro/project/addMemberPage/searchMember/${ Project.pId}">
			<h5>Search for the member</h5>
			<label>Enter UserId</label>
			<input type="number" name="uId" value="0" />
			<label>Enter User Name</label>
			<input type="text" name="name" value="" />
			<button type="submit" class="btn-success">Search</button>
			
			</form>
			<hr class="mt-5">
			<form class="mt-5" action="<%request.getContextPath(); %>/projectPlanningPro/project/addMemberPage/addMember/${ Project.pId}" method="post">
				<label>Add Team Member to the Project</label>
				<select name="member" >
				<option value="-1">Select</option>
				
				<%List <User> members=(List)request.getAttribute("members");
					
					for(User m: members){
						if(m!=null){
				%>
				
				<option value="<%=m.getuId()%>"><%=m.getuId() %> - <%=m.getName() %></option>
				<%} }%>
				</select>
				
				<button type="submit" class=" btn-info">Add</button>
			</form>
			</div>
		</div>



	</div>

	<%@include file="./baseScript.jsp"%>
</body>
</html>