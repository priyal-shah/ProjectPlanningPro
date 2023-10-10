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
			<span class="text-center text-danger">${errorMsg}</span> <span
				class="text-center text-success">${successMsg}</span>
		</div>


		<!-- div 1 -->
		<div class="container-fluid row div1">
			<div class="col-12 col-md-6 ">
				<img alt="img" src="../images/7456408.jpg" class="home-img">
			</div>
			<div class="col-12 col-md-6 create-div">
				<h2 class="col-12 project-home-content"
					style="font-family: monospace; margin-top: 10%;">Efficiency
					Meets Simplicity - Manage Your Projects with Ease</h2>
				<%
				HttpSession s1 = request.getSession(false);
				if (s1 == null || s1.getAttribute("loginedUser") == null) {
				%>
				<a class="col-4 btn m-4  " href="loginPage"
					style="background-color: #DDA0DD;">Add Project</a>
				<%
				} else {
				%>
				<a class="col-4 btn  m-4" href="addProjectPage"
					style="background-color: #DDA0DD;">Add Project</a>
				<%
				}
				%>

			</div>
		</div>


		<div class="container-fluid row div2">

			<div class="col-12 col-md-6 create-div">
				<h2 class="col-12 project-home-content "
					style="font-family: monospace; margin-top: 20%;">Collaborate,
					Organize, and Succeed Together</h2>
				<%
				s2 = request.getSession(false);
				if (s2 == null || s2.getAttribute("loginedUser") == null) {
				%>
				<a class="col-5 btn  m-5 " href="loginPage"
					style="background-color: #B0E0E6;">View All Projects</a>
				<%
				} else {
				%>
				<a class="col-5 btn   " href="viewProjects"
					style="background-color: #B0E0E6;">View All Projects</a>
				<%
				}
				%>

			</div>

			<div class="col-12 col-md-6 ">
				<img alt="img" src="../images/4380.jpg" class="home-img">
			</div>
		</div>


		<!-- dic 3 -->
		<%
		s2 = request.getSession(false);
		if (s2 == null || s2.getAttribute("loginedUser") == null) {
		%>
		<div class="container-fluid row div2">
			<div class="col-12 col-md-6 ">
				<img alt="img" src="../images/6333050.jpg" class="home-img">
			</div>

			<div class="col-12 col-md-6 create-div">
				<h2 class="col-12 project-home-content "
					style="font-family: monospace; margin-top: 20%;">Sign Up Today
					and Get Started</h2>

				<a class="col-5 btn  m-5 " href="registerPage"
					style="background-color: #FF7F50;">SignUp</a>


			</div>


		</div>
		<%
		}
		%>


	</div>


	<%@include file="./baseScript.jsp"%>
</body>
</html>