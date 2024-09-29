<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	height: 100%;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

form {
	display: flex;
	justify-content: center;
	align-items: center;
	border: 1px solid black;
	border-radius: 10px;
	height: fit-content;
	width: 500px;
	padding: 20px;
	flex-direction: column;
	margin: 0 auto;
	box-shadow: 1px 1px 15px 1px gray;
}

.layout2 {
	display: flex;
	gap: 30px;
	justify-content: center;
	align-items: center;
}

button {
	border: 1px solid black;
	border-radius: 10px;
	padding: 8px;
}

a {
	border: 1px solid black;
	border-radius: 10px;
	padding: 3px;
	text-decoration: none;
	/* box-shadow: 1px 1px 5px 0px; */
}

a:hover, button:hover {
	background: black;
	color: white;
}

input {
	background: black;
	color: white;
	width: 300px;
	height: 30px;
	border-radius: 20px;
	padding: 0px 10px;
}

input::placeholder {
	color: wheat;
}
</style>
</head>
<body>
	<%
	session = request.getSession(false);
	Long phone_session = (Long) session.getAttribute("phone");
	if (phone_session == null) {
		response.sendRedirect("login.jsp");

	}
	%>
	<form action="update" method="post">
		<span style="color: red;"> <%
		 String msg = (String) session.getAttribute("message");
		
		 if (msg != null && !msg.isEmpty()) {
		 %> 
		 <%=msg%> 
		 <%
		 session.removeAttribute("message");
		 }
		 %></span>
		<div class="input-field col s12">
			<select name="field">
				<option value="" disabled>Choose your option</option>
				<option value="ename">ename</option>
				<option value="password" selected>password</option>
				<option value="phone">phone</option>
			</select>
		</div>
		<br /> <input type="text" name="updateData" placeholder="type..."
			required /> <br />
		<div class="layout2">
			<button type="submit">Submit</button>
			<a href="dashboard.jsp">Go to Home</a>
		</div>
	</form>
</body>
</html>
