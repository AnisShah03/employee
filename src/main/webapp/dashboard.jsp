<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.container {
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
	height: fit-content;
	width: 300px;
	padding: 20px;
	flex-direction: column;
	border: 1px solid black;
	border-radius: 10px;
	box-shadow: 1px 1px 15px 1px gray;
}

ul {
	list-style-type: none;
	display: flex;
	flex-direction: column;
	gap: 5px;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: gray;
}

.logout {
	color: red;
}
</style>

</head>
<body>
	<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

	session = request.getSession(false);
	Long phone_session = (Long) session.getAttribute("phone");
	if (phone_session == null) {
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="container">
		<ul>
			<li><a href="fetch.jsp">Details</a></li>
			<li><a href="update.jsp">Update</a></li>
			<li><a href="update_all.jsp">UpdateAll</a></li>
			<li><a href="delete">DELETE</a></li>
			<li><a href="logout" class="logout">Logout</a></li>

		</ul>

	</div>

</body>
</html>