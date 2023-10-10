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
			
				<h3>${Project.name }</h3>
				<span>${Project.date_created }</span>
				<h5>Project Leader : user.Id@${Project.user.uId } - ${Project.user.name} </h5>
				<p style="font-size: 130%;" class="mt-3">${Project.desc}</p>
			
			</div>
		</div>



	</div>

	<%@include file="./baseScript.jsp"%>
</body>
</html>