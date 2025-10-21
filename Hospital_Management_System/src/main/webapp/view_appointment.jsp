<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment List</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	border-radius: 10px;
	background: #fff;
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)), url("image/ap2.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.img-side {
	display: flex;
	justify-content: center;
	align-items: center;
}

.img-side img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
}
</style>
</head>

<body>
	<%@include file="component/navbar.jsp"%>

	<!-- Background section -->
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<!-- Main content area -->
	<div class="container p-4">
		<div class="row align-items-center">

			<!-- Left side: Appointment list -->
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment List</p>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Full Name</th>
									<th>Gender</th>
									<th>Age</th>
									<th>Appoint Date</th>
									<th>Diseases</th>
									<th>Doctor Name</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
							<% 
							 User user= (User) session.getAttribute("userObj");
							AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
							DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
							List<Appointment> list=dao.getAppointmentByLoginUser(user.getId());
							for(Appointment ap:list){
								Doctor d=dao2.getDoctorById(ap.getDoctorId());
							%>
								<tr>
									<td><%=ap.getFullName() %></td>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getAge() %></td>
									<td><%=ap.getAppoinDate() %></td>
									<td><%=ap.getDiseases() %></td>
									<td><%=d.getFullName() %></td>
									<td>
									<% if ("Pending".equals(ap.getStatus())) {%>
										 <a href="#" class="btn btn-sm btn-warning">Pending</a>
									<%}else{%>
										
									<%}
									
									%>
									</td>
								</tr>
								
							<%}
							%>
							
							
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- Right side: Doctor image -->
			<div class="col-md-4 img-side">
				<img src="image/ap1.png" alt="Doctor Image">
			</div>
		</div>
	</div>
</body>
</html>
