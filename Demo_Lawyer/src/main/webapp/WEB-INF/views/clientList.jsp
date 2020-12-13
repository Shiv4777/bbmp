<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link rel="stylesheet" type="text/css" href="https://d2kpmywmv9hmp2.cloudfront.net/css/datatables-1.10.16.min.css"/>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../resources/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Lawyer Dashboard
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="../resources/assets/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../resources/assets/demo/demo.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<style>
table.dataTable.nowrap th, table.dataTable.nowrap td{
    white-space: pre-wrap;
}
#table{
    flex: 0 0 50%;
    max-width: 69%;
    margin-left: 237px;
    font-variant: small-caps;
   
}
#heading{
    text-align: center;
    font-family: -webkit-body;
    font-size: xxx-large;
    font-variant: petite-caps;
}

table{
    table-layout: fixed;
    width: 1000px;
    overflow-wrap: break-word;
}
</style>
<meta charset="ISO-8859-1">
<title>Jeshtha</title>
</head>
<body>
<h3 id="heading" class="table table-hover">Clients Details</h3>
	<div class="col-lg-6 col-md-12" id="table">
		<div class="card">
			<div class="card-header card-header-warning">
				<h4 class="card-title">Client Status</h4>
				<p class="card-category">New Clients on 15th May, 2020</p>
			</div>
			<div class="card-body table-responsive">
				<table id="userActivityTable" class="table table-hover">
					<thead class="text-warning" cellspacing="0" align="center"
						width="100%">
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email Address</th>
							<th>Date of Birth</th>
							<th>Gender</th>
							<th>Phone Number</th>
							<th>Address</th>
							<th>Other Details</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="item" items="${clients}">
							<tr>
								<td><c:out value="${item.firstName}" /></td>
								<td><c:out value="${item.lastName}" /></td>
								<td><c:out value="${item.email}" /></td>
								<td><c:out value="${item.dob}" /></td>
								<td><c:out value="${item.gender}" /></td>
								<td><c:out value="${item.phone}" /></td>
								<td><c:out value="${item.address}" /></td>
								<td><c:out value="${item.otherDetails}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#userActivityTable").DataTable({
			scrollY : "300px",
			scrollX : true,
			scrollCollapse : true,
			"bSort" : false,
			"autoWidth" : false,
			"fixedHeader" : {
				"header" : false,
				"footer" : false
			},
			paging : true,
			"sPaginationType" : "full_numbers",
			"pageLength" : 25,
			"lengthMenu" : [ 25, 50, 75, 100 ],
			fixedColumns : {
				leftColumns : 1,
				rightColumns : 1
			}
		});
	});
</script>
