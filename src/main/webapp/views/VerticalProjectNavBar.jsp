<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<nav class="navbar navbar-expand-lg  "
	style="background-color: #FFF0F5;">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav nav">
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/projectPlanningPro/project/${Project.pId	}">Dashboard</a></li>
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/projectPlanningPro/project/addTaskPage/${Project.pId}">Add Tasks</a></li>
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/projectPlanningPro/project/AllTasks/${Project.pId}">All Tasks</a></li>
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/projectPlanningPro/project/addMemberPage/${Project.pId}">Add Members</a></li>
				<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/projectPlanningPro/project/viewMembers/${Project.pId}">All Members</a></li>

			</ul>
		</div>
	</div>
</nav>