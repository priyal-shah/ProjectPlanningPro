<%@page import="com.ProjectPlannerPro.entity.Project"%>
<%@page import="java.util.Map"%>
<%@page import="ch.qos.logback.core.status.Status"%>
<%@page import="com.ProjectPlannerPro.entity.Task"%>
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


		<div class="row col-12 m-0">
			<div class="col-12 col-md-2  ">

				<jsp:include page="./VerticalProjectNavBar.jsp">
					<jsp:param value="${Project }" name="Project" />
				</jsp:include>
			</div>

			<div class="col-12 col-md-10 mt-4">



				<!-- 
				<div class="card mt-3">
					<div class="card-body">
						<p>
							task@<%-- <%=task.gettId()%> --%>.Id
						</p>
						<h4><%-- <%=task.getName()%> --%></h4>
						<p><%-- <%=task.getDesc()%> --%></p>
						<div class="d-flex row">
							<h5 class="col-6">Status : abs</h5>
							<div>
								<label>Update Status</label> <select>
									<option>Select</option>
								</select>
							</div>
						</div>

					</div>
				</div>


 -->




				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Name</th>
							<th scope="col">Email Id</th>
							<th scope="col">Contact No.</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<User> members = (List) request.getAttribute("members");
						for (User m : members) {
						%>
						<tr>
							<th scope="row"><%=m.getuId()%></th>
							<td><%=m.getName()%></td>
							<td><%=m.getEmail()%></td>
							<td><%=m.getMob()%></td>

							<td><div>


									<!-- modal -->

									<!-- Modal -->
									<div class="modal fade" id="memberModal<%=m.getuId()%>"
										tabindex="-1" aria-labelledby="memberModal" aria-hidden="true">
										<div class="modal-dialog modal-xl">
											<div class="modal-content">

												<div class="modal-body">
													<h3>Tasks Assigned</h3>
													<%
													List<Task> tasks = m.getTasks();
													for (Task t : tasks) {
													%>
													<table class="table">
														<thead>
															<tr>
																<th scope="col">Task Id</th>
																<th scope="col">Name</th>
																<th scope="col">Status</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th scope="row"><%=t.gettId()%></th>
																<td><%=t.getName()%></td>
																<%
																Map<Integer, String> status = (Map) request.getAttribute("status");
																if (t.getStatus() == 4) {
																%>
																<td class="text-danger"><%=status.get(t.getStatus())%></td>
																<%
																} else if (t.getStatus() == 3) {
																%>
																<td class="text-success"><%=status.get(t.getStatus())%></td>
																<%
																} else {
																%>
																<td class="text-primary"><%=status.get(t.getStatus())%></td>
																<%
																}
																%>

															</tr>
														</tbody>
													</table>

													<%
													}
													%>

												</div>

											</div>
										</div>
									</div>

									<!-- modal end -->
									<a data-bs-toggle="modal"
										data-bs-target="#memberModal<%=m.getuId()%>"><i
										class="fa-solid fa-eye" style="color: aqua;"></i></a> <a
										href="<%=request.getContextPath() %>/projectPlanningPro/project/${Project.pId }/delete-member/<%=m.getuId()%>">
										<i class="fa-solid fa-trash" style="color: red;"></i>
									</a>
								</div></td>

						</tr>




						<%
						}
						%>
					</tbody>
				</table>



			</div>
		</div>





	</div>

	<%@include file="./baseScript.jsp"%>


</body>
</html>