<%@page import="com.ProjectPlannerPro.entity.Project"%>
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
			<%@include file="./NavBarHorizontal.jsp"%>
		</div>

		<div class="row col-12  ">

			<%
			List<Project> plist = (List) request.getAttribute("projects");
			for (Project p : plist) {
			%>
			<div class="card col-12 mt-3 m-2 row">

				<div class="card-body">
					<div class="row">
						<a class="col-9" href="project/<%=p.getpId()%>"><h4><%=p.getName()%></h4></a> <span
							class="col-2"><%=p.getDate_created().toLocaleString().substring(0, 11)%></span>
							<span class="col-1"><a href="deleteProject/<%=p.getpId()%>" >
							<i class="fa-solid fa-trash" style="color: red"></i></a></span>
					</div>

					<p><%=p.getDesc()%></p>
				</div>

			</div>
			<%
			}
			%>

		</div>



	</div>

	<%@include file="./baseScript.jsp"%>
</body>
</html>