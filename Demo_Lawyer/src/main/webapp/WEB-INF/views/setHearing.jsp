<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Set Case Hearing Date</title>
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
		<form class="modal-content animate" action="/setHearing"
			method="post">
			<h2 align="center">Set Case Hearing Date</h2>
			<!-- <div class="form-group">
				<label for="firstName" class="col-sm-3 control-label">Case
					ID</label>
				<div class="col-sm-9">
					<input type="text" id="firstName" placeholder="Case ID"
						class="form-control" autofocus>
				</div>
			</div> -->
			<div class="form-group">
				<label class="col-sm-3 control-label" for="client_name">Client
					Name</label>
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
                 
			<div class="form-group">
				<label for="startDate" class="col-sm-3 control-label">Case Start Date*</label>
				<div class="col-sm-9">
					<input type="date" id="startDate" class="form-control">
				</div>
			</div>
		-->
		<!-- <div class="form-group">
				<label for="firstHearingDate" class="col-sm-3 control-label">First Date of hearing*</label>
				<div class="col-sm-9">
					<input type="date" id="firstHearingDate" name="firstHearingDate" valu="" class="form-control">
				</div>
			</div> -->
			<div class="form-group">
				<label for="hearingDate1" class="col-sm-3 control-label">Next Date of hearing*</label>
				<div class="col-sm-9">
					<input type="date" id="hearingDate1" name="hearingDate1" class="form-control">
				</div>
			</div>
			<!-- <div class="form-group">
				<label class="control-label col-sm-3">Case Type</label>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								id="criminalRadio" value="Female">Criminal Case
							</label>
						</div>
						<div class="col-sm-4">
							<label class="radio-inline"> <input type="radio"
								id="civilRadio" value="Male">Civil Case
							</label>
						</div>
					</div>
				</div>
			</div> -->
			
			<div class="form-group">
				<label for="caseDetails" class="col-sm-3 control-label">Case Details </label>
				<div class="col-sm-9">
					<input type="text" id="caseDetails" name="caseDetails"
						placeholder="Please mention all-known details of the case" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="case_Status">Case Status</label>
				<div class="controls">
					<select id="caseStatus" name="caseStatus" class="input-xlarge">
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
			<button type="submit" class="btn btn-primary btn-block">Set Hearing Date</button>
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
		   // 	var firstHearingDate='';
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