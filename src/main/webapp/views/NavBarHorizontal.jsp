
<%@page import="com.ProjectPlannerPro.entity.User"%>
<nav class="navbar navbar-expand-lg" style="background-color: 	#FFC0CB;">
	<div class="container-fluid" >
		<a class="navbar-brand" href="<%=request.getContextPath() %>/projectPlanningPro/home" style="font-family:monospace;  color: black; font-weight: bold;">ProjectPlanningPro</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse d-lg-flex"
			id="navbarSupportedContent">

		


			<ul class="navbar-nav  mb-2 mb-lg-0 ms-md-auto mt-sm-2">
			<%
				HttpSession s = request.getSession(false);
				if (s!=null && s.getAttribute("loginedUser") != null) {
				%>
				<li class="nav-item"><a class="nav-link  navText"
					href="<%=request.getContextPath() %>/projectPlanningPro/viewProjects" >View Projects</a></li>
					<li class="nav-item"><a class="nav-link  navText"
					href="<%=request.getContextPath() %>/projectPlanningPro/addProjectPage" >Add Project</a></li>
				<%}else{ %>
				<li class="nav-item"><a class="nav-link navText" href="<%=request.getContextPath() %>/projectPlanningPro/loginPage">Login</a></li>
				<li class="nav-item"><a class="nav-link navText" href="<%=request.getContextPath() %>/projectPlanningPro/registerPage">SignUp</a></li>
				
				<%
				}
				%>


			</ul>

			<%HttpSession s2=request.getSession(false);
			User u=(User)s.getAttribute("loginedUser");
				if(s2!=null && s2.getAttribute("loginedUser")!=null){
			%>
			<div class="dropdown">
				<button class="nav-link ml-1 mr-1 btn btn-secondary  navText "
					type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false"
					style="border-radius: 50%; background-color:#FF69B4;font-weight: bold; "><%=u.getName().toUpperCase().charAt(0) %></button>


				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item navText" href="#">Hello <%=u.getName() %> !</a></li>
					<hr>
					<li><a class="dropdown-item navText" href="#">Update Profile</a></li>
					<li><a class="dropdown-item navText" href="#">Change Password</a></li>
					<li><a class="dropdown-item navText" href="<%=request.getContextPath() %>/projectPlanningPro/addProjectPage">Add Project</a></li>
					<li><a class="dropdown-item navText" href="<%=request.getContextPath() %>/projectPlanningPro/logout">Logout</a></li>
				</ul>
			</div>
			<%
				}
			%>

		</div>
	</div>
</nav>