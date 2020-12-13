<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Case Entry</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
</head>
<body background="../resources/assets/img/law3.jpg">
 <marquee direction="left"><h1 align="center" > <font color="red">Lawyer Assistance System </font></h1> </marquee>
 <h1 align="center" > <font color="red">${messagge}</font></h1>
	<div class="container">
		<!-- <form class="form-horizontal" role="form"> -->
		<form class="modal-content animate" action="/registerCase" method="post">
			<h2 align="center">Client Case Entry</h2>
			<!-- <div class="form-group">
				<label for="caseID" class="col-sm-3 control-label">Case ID</label>
				<div class="col-sm-9">
					<input type="text" id="caseID" name="caseID" placeholder="Case ID"
						class="form-control" autofocus>
				</div>
			</div> -->
			<div class="form-group">
				<label class="col-sm-3 control-label" for="client_name">Client Name</label>
				<div class="col-sm-9">
					<select id="client_name" id="client_name" name="client_name" class="form-control" autofocus>
					<option  selected="selected" value="--">Please Select</option>
						<c:forEach var="item" items="${clients}">
                                        <option value="<c:out value="${item.id}"/>">
                                            <c:out value="${item.firstName}" />(<c:out value="${item.id}" />)
                                        </option>
                        </c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="lastName" class="col-sm-3 control-label">Case
					Name</label>
				<div class="col-sm-9">
					<input type="text" id="caseName" name="caseName" placeholder="Case Name" class="form-control" autofocus>
				</div>
			</div>

			<!-- 
			<div class="form-group">
				<label for="email" class="col-sm-3 control-label">Email
					address* </label>
				<div class="col-sm-9">
					<input type="email" id="email" placeholder="Email"
						class="form-control" name="email">
				</div>
			</div>
                 <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password*</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" placeholder="Password" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Confirm Password*</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" placeholder="Password" class="form-control">
                    </div>
                </div>
                <div class="form-group">
				<label for="phoneNumber" class="col-sm-3 control-label">Phone
					number </label>
				<div class="col-sm-9">
					<input type="phoneNumber" id="phoneNumber"
						placeholder="Phone number" class="form-control"> <span
						class="help-block">Your phone number won't be disclosed
						anywhere </span>
				</div>
			</div>
                 -->
			<div class="form-group">
				<label for="startDate" class="col-sm-3 control-label">Case Start Date*</label>
				<div class="col-sm-9">
					<input type="date" id="startDate"  name= "startDate" class="form-control">
				</div>
			</div>
			<!-- <div class="form-group">
				<label for="endDate" class="col-sm-3 control-label">Case End Date*</label>
				<div class="col-sm-9">
					<input type="date" id="endDate"  name = "endDate" class="form-control">
				</div>
			</div> -->
			<div class="form-group">
				<label for="hearingDate1" class="col-sm-3 control-label">Date of hearing*</label>
				<div class="col-sm-9">
					<input type="date" id="hearingDate1" name="hearingDate1" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">Case Type</label>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio" id="caseType"  name ="caseType" value="criminal">Criminal Case
							</label>
						</div>
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio" id="caseType" name ="caseType" value="civil">Civil Case
							</label>
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="caseDetails" class="col-sm-3 control-label">Case Details </label>
				<div class="col-sm-9">
					<input type="text" id="caseDetails" name="caseDetails"
						placeholder="Please mention all-known details of the case" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="weight" class="col-sm-3 control-label">Case Reference Books </label>
				<div class="col-sm-9">
					<input type="text" id="caseRefBooks" name="caseRefBooks"
						placeholder="Please mention the required reference Books"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="case_Status">Case Status</label>
				<div class="controls">
					<select id="case_Status" name="caseStatus" name="caseStatus" class="input-xlarge">
						<option>Start</option>
						<option>In Process</option>
						<option>Completed</option>
						
					</select>
				</div>
			</div>
			<!-- /.form-group -->
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<span class="help-block">*Required fields</span>
				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-block">Register Case</button>
		</form>
		<!-- /form -->
	</div>
	<!-- ./container -->
</body>
</html>