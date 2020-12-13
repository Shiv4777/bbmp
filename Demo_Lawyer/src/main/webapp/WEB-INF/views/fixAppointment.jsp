<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fix Client Appointment</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
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
	<div class="container">
		<!-- <form class="form-horizontal" role="form"> -->
		<form class="modal-content animate" action="/fixAppointment" method="post">
			<h2 align="center">Fix Client Appointment</h2>
			<!-- <div class="form-group">
				<label for="firstName" class="col-sm-3 control-label">Case
					ID</label>
				<div class="col-sm-9">
					<input type="text" id="firstName" placeholder="Case ID"
						class="form-control" autofocus>
				</div>
			</div> -->
			<div class="form-group">
				<label class="col-sm-3 control-label" for="client_name">ClientName</label>
				<div class="controls">
					<select id="clientname" name="clientname" class="form-control" autofocus>
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
				<label class="col-sm-3 control-label" for="case_name">Case Name</label>
				<div class="controls">
					<select id="case_Id" name="case_Id" class="input-xlarge">
						<option>Select Case</option>
						<!-- <option>A1</option>
						<option>B1</option>
						<option>C1</option> -->
					</select>
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
				<label for="appointmentDate" class="col-sm-3 control-label">Appointment Date*</label>
				<div class="col-sm-9">
					<input type="date" id="startDate" name="startDate" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="appointmentTime" class="col-sm-3 control-label">Appointment Time*</label>
				<div class="col-sm-9">
					<input type="time" id="appointmentTime" name="appointmentTime" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-3">Appointment Type</label>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio" id="priorityRadio" name="priorityRadio" value="Female">Priority Meeting
							</label>
						</div>
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio" id="casualRadio" name="casualRadio" value="Male">Casual/follow-up Meeting
							</label>
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label for="meeting_Details" class="col-sm-3 control-label">Meeting Details </label>
				<div class="col-sm-9">
					<input type="text" id="height" name="height" placeholder="Please mention details of the Meeting" class="form-control">
				</div>
			</div>
			
			
			<!-- /.form-group -->
			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3">
					<span class="help-block">*Required fields</span>
				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-block">Fix Appointment</button>
		</form>
		<!-- /form -->
	</div>
	<!-- ./container -->
</body>
</html>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$("#clientname").on("change", function(){
	var options='',
	val =$(this).val();
	if(val !='--'){
		$.ajax({
		    type: "POST",
		    url: '/getCaseDetails',
		    data:({clientId : val}),
		    crossDomain: true,
		    success: function(data) {
		    	console.log(data);
		    	 $("#case_Id").empty();
		    	var listItems = '<option value="">Select Batch</option>';
                    $.each(data.result, function(index,key){
                        listItems +='<option value="'+key.id+'">'+key.caseName+'</option>';
                    });
                    $("#case_Id").html(listItems);
		    },
		    error: function(data) {
		      alert("fail :"+data);
		    },
		});
	}
});

</script>