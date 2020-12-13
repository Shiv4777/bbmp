<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="ISO-8859-1"> -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Demo</title>

<!-- Bootstrap CSS-->
<link href="/resources/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="/resources/css/theme.css" rel="stylesheet" media="all">

</head>
<body class="animsition">
	<div class="page-wrapper">
		<div class="page-content--bge5">
			<div class="container">
				<div class="login-wrap">
					<div class="login-content">
						<div class="login-logo">
							<a href="#"> <img src="/resources/images/icon/logo.png"
								alt="CoolAdmin">
							</a>
						</div>
						<div class="login-form">

							<center>
								<p style="color: blue">${message}</p>
							</center>
							<form:form action="sendresetlink" modelAttribute="user">
								<label>Email</label>
								<spring:bind path="email">
									<div class="form-group ${status.error ? 'has-error' : ''}">
										<form:input type="text" path="email" class="form-control"
											placeholder="Enter Email.." autofocus="true"></form:input>
										<form:errors path="email"></form:errors>
									</div>
								</spring:bind>

								<div class="container signin">
									<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
								</div>
							</form:form>
							<div class="login-form">
								<p>
									Do you have account? <a href="/login">Sign in</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>