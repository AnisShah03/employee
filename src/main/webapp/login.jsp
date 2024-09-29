<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="loginpagestyle.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<div class="login-container input-group mb-3">
		<form action="login" method="post">
			<h1 class="log-text">Login</h1>
			<span class="log-text"> 
			<%
			 String msg = (String) session.getAttribute("message");
			
			 if (msg != null && !msg.isEmpty()) {
			 %>
			  <%=msg%>
			  
			   <%
			 // Clear the message after displaying or reloading 
			 session.removeAttribute("message");
			 }
			 %>

			</span>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">+91</span> 
				<input
					type="number" class="form-control" placeholder="phone"
					name="phone" aria-label="phone" required
					aria-describedby="basic-addon1">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1"><i
					class="fa-solid fa-lock"></i></span>
					 <input type="password"
					class="form-control" placeholder="Password" name="password"
					aria-label="Password" required aria-describedby="basic-addon1">
			</div>
			<button type="submit" class=" submit-btn btn btn-outline-dark">Login</button>
			<span class="log-in-text">you dont't have an account?<a
				href="./register.jsp">Register</a></span>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>