<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<style type="text/css">
.container {
    background-color: whitesmoke;
}
</style>
</head>
<body background="../resources/assets/img/law3.jpg">
 <marquee direction="left"><h1 align="center" > <font color="red">Lawyer Assistance System </font></h1> </marquee>
 <h1 align="center" > <font color="red">${messagge}</font></h1>
	<div class="container">
		<!-- <form class="form-horizontal" role="form"> -->
		<div class="login-form">
							<form:form method="POST" modelAttribute="userForm" id="register"
								class="form-signin" action="/register">
								<div class="container">
									<h2 class="form-signin-heading">Create your account</h2>
											<p style="color:red">${message}</p>
									<spring:bind path="userName">
										<div class="form-group ${status.error ? 'has-error' : ''}">
											<form:input type="text" path="userName" class="form-control" id="firstName" placeholder="FirstName" autofocus="true"></form:input>
											<form:errors path="userName"></form:errors>
											<label id="firstNameError" style="Display:none;color:red;">Please enter the first name</label>
										</div>
									</spring:bind>
									
									<spring:bind path="lastName">
										<div class="form-group ${status.error ? 'has-error' : ''}">
											<form:input type="text" path="lastName" class="form-control"
												placeholder="lastName" autofocus="true"></form:input>
											<form:errors path="lastName"></form:errors>
										</div>
									</spring:bind>
									
									<spring:bind path="email">
										<div class="form-group ${status.error ? 'has-error' : ''}">
											<form:input type="text" path="email" class="form-control" id="email"
												placeholder="email" autofocus="true"></form:input>
											<form:errors path="email"></form:errors>
											<label id="emailError" style="Display:none;color:red;">Please Enter Email Address</label>
										</div>
									</spring:bind>
									<spring:bind path="password">
										<div class="form-group ${status.error ? 'has-error' : ''}">
											<form:input type="password" path="password" id="password"
												class="form-control" placeholder="Password"></form:input>
											<form:errors path="password"></form:errors>
											<label id="passwordError" style="Display:none;color:red;">Please Enter Password</label>
										</div>
									</spring:bind>

									<spring:bind path="passwordConfirm">
										<div class="form-group ${status.error ? 'has-error' : ''}">
											<form:input type="password" path="passwordConfirm" id="passwordConfirm"
												class="form-control" placeholder="Confirm your password"></form:input>
											<form:errors path="passwordConfirm"></form:errors>
											<label id="passwordConfirmError" style="Display:none;color:red;">Password Not Match</label>
										</div>
									</spring:bind>
									<spring:bind path="mobile">
										<div class="form-group ${status.error ? 'has-error' : ''}">
											<form:input type="text" path="mobile" id="mobile"
												class="form-control" placeholder="Enter mobile"></form:input>
											<form:errors path="mobile"></form:errors>
											<label id="mobileError" style="Display:none;color:red;">Enter You'r Mobile Number</label>
										</div>
									</spring:bind>

								</div>
							<!-- 	<div class="container signin"> -->
									<button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">Submit</button>
								<!-- </div> -->
							</form:form>
						</div>
							<div class="login-form">
                                <p>
                                    Do you have account?
                                    <a href="/login">Sign in</a>
                                </p>
                            </div>
	</div>
	<!-- ./container -->
</body>
<script src="https://code.jquery.com/jquery-1.7.min.js"></script>
<script src="script.js"></script>
<script type="text/javascript">

$('form').submit(function () {
    var name = $.trim($('#firstName').val());
    var email = $.trim($('#email').val());
    var pwd = $.trim($('#password').val());
    var rpwd = $.trim($('#passwordConfirm').val());
    var mobile = $.trim($('#mobile').val());
    if (name  === '') {
        $("#firstNameError").show();
        return false;
    }else{
		$("#firstNameError").hide();
	}
    if (email  === '') {
        $("#emailError").show();
        return false;
    }else{
		$("#emailError").hide();
	}
    if (pwd  === '') {
        $("#passwordError").show();
        return false;
    }else{
		$("#passwordError").hide();
	}
    if (pwd != rpwd) {
    		$("#passwordConfirmError").show();
    	return false;
    	}else{
    		$("#passwordConfirmError").hide();
    	}
    if (mobile  === '') {
        $("#mobileError").show();
        return false;
    }else{
		$("#mobileError").hide();
	}
});
	
</script>
</html>

