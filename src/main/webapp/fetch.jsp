<%@page import="java.sql.SQLException"%>
<%@page import="com.ty.ConnectionPool"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@
page language="java" contentType="text/html; charset=UTF-8"
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

.details-container {
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

.details-container>ul {
	list-style-type: none;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

span {
	color: rgb(89, 86, 86);
}

a {
	position: relative;
	left: 87px;
	margin-top: 5px;
	border: 1px solid black;
	border-radius: 10px;
	padding: 3px;
	text-decoration: none;
	/* box-shadow: 1px 1px 5px 0px; */
}

a:hover {
	background: black;
	color: white;
}
</style>
</head>
<body>
	<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

	/* HttpSession session = request.getSession(false); */ 
	String ename = "";
	String password = "";
	long phone = 0;
	long eid = 0;
	session = request.getSession(false);
	Long phone_session = (Long) session.getAttribute("phone");
	if (phone_session != null) {
		Connection connection = ConnectionPool.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM employee WHERE phone=?");
			statement.setLong(1, phone_session);
			ResultSet executeQuery = statement.executeQuery();
			while (executeQuery.next()) {
					eid = executeQuery.getInt("eid");
					ename = executeQuery.getString("ename");
					password = executeQuery.getString("password");
					phone = executeQuery.getLong("phone");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} else {
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="details-container">
		<ul>
			<li><span>id: </span><%=eid%></li>
			<li><span>employee name:</span> <%=ename%></li>
			<li><span>password:</span> <%=password%></li>
			<li><span>phone number:</span> <%=phone%></li>
		</ul>

		<a href="dashboard.jsp">Go to Home</a>
	</div>
</body>
</html>
