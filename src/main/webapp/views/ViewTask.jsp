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
							<th scope="col">Task</th>
							<th scope="col">Status</th>
							<th scope="col">Assigned To</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<Task> tasks = (List) request.getAttribute("tasks");
						for (Task task : tasks) {
						%>
						<tr>
							<th scope="row"><%=task.gettId()%></th>
							<td><%=task.getName()%></td>
							<%
							Map<Integer, String> status = (Map) request.getAttribute("status");
							if (task.getStatus() == 4) {
							%>
							<td class="text-danger"><%=status.get(task.getStatus())%></td>
							<%
							} else if (task.getStatus() == 3) {
							%>
							<td class="text-success"><%=status.get(task.getStatus())%></td>
							<%
							} else {
							%>
							<td class="text-primary"><%=status.get(task.getStatus())%></td>
							<%
							}
							%>

							<%
							if (task.getUser() != null) {
							%>
							<td>user.Id@<%=task.getUser().getuId()%> - <%=task.getUser().getName()%></td>
							<%
							} else {
							%>
							<td>Not assigned</td>
							<%
							}
							%>

							<td><div>


									<!-- modal -->

									<!-- Modal -->
									<div class="modal fade" id="taskModal<%=task.gettId()%>"
										tabindex="-1" aria-labelledby="taskModal" aria-hidden="true">
										<div class="modal-dialog modal-xl">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title"
														id="taskModalLabel<%=task.gettId()%>">
														task.Id@<%=task.gettId()%>-
														<%=task.getName()%></h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<p><%=task.getDesc()%></p>

													<p>
														Assigned to :<%
													if (task.getUser() != null) {
													%>
														user.Id@<%=task.getUser().getuId()%>
														-
														<%=task.getUser().getName()%>
														<%
														} else {
														%>
														Not assigned

														<%
														}
														%>
													</p>

													<%
													User user1 = new User();
													if (s != null && s.getAttribute("loginedUser") != null) {
														user1 = (User) s.getAttribute("loginedUser");
													}

													Project Project=(Project)request.getAttribute("Project");
													List<User> members=Project.getMember();
													if (Project.getUser()!=null &&  user1.getuId()==Project.getUser().getuId() )
															 {
													%>
													<div>

														<form
															action="<%request.getContextPath(); %>/projectPlanningPro/project/AllTasks/${Project.pId}/UpdateMember/<%=task.gettId() %>"
															method="post" id="updateStausForm">
															<label>Assign to</label> <select name="member">
																<option value="-1"><%if(task.getUser()==null ){%>Not assigned <%} else {%>
																<%=task.getUser().getuId() %> - <%=task.getUser().getName() %>
																<%} %>
																</option>
																<%
																for (User m: members) {
																%>
																<option value="<%=m.getuId()%>"><%=m.getuId()%> - <%=m.getName() %></option>
																<%
																}
																%>
															</select>
															<button type="submit" class=" btn-primary">Assign</button>

														</form>
													</div>
													<%
													}
													%>

													<p>
														Status :
														<%
													if (task.getStatus() == 4) {
													%>

														<span class="text-danger"><%=status.get(task.getStatus())%></span>
														<%
														} else if (task.getStatus() == 3) {
														%>
														<span class="text-success"><%=status.get(task.getStatus())%></span>
														<%
														} else {
														%>
														<span class="text-primary"><%=status.get(task.getStatus())%></span>
														<%
														}
														%>

													</p>


													<%
													User user = new User();
													if (s != null && s.getAttribute("loginedUser") != null) {
														user = (User) s.getAttribute("loginedUser");
													}

													if (
															 (Project.getUser() != null && user.getuId() == Project.getUser().getuId())) {
													%>
													<div>

														<form
															action="<%request.getContextPath(); %>/projectPlanningPro/project/AllTasks/${Project.pId}/updateStatus/<%=task.gettId() %>"
															method="post" id="updateStausForm">
															<label>Update Status</label> <select name="status"
																onchange="updateStaus()">
																<option value="<%=task.getStatus()%>"><%=status.get(task.getStatus())%></option>
																<%
																for (Map.Entry<Integer, String> e : status.entrySet()) {
																%>
																<option value="<%=e.getKey()%>"><%=e.getValue()%></option>
																<%
																}
																%>
															</select>
															<button type="submit" class=" btn-primary">Update</button>

														</form>
													</div>
													<%
													}
													%>

												</div>

											</div>
										</div>
									</div>

									<!-- modal end -->
									<a data-bs-toggle="modal"
										data-bs-target="#taskModal<%=task.gettId()%>"><i
										class="fa-solid fa-eye" style="color: aqua;"></i></a> <a><i
										class="fa-solid fa-pen" style="color: blue;"></i></a> <a
										href="<%=request.getContextPath() %>/projectPlanningPro/project/${Project.pId }/delete-task/<%=task.gettId()%>">
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