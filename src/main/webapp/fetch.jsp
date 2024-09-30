<%@page import="javax.persistence.Query"%>
<%@page import="java.util.Optional"%>
<%@page import="com.model.Employee"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
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

	session = request.getSession(false);
	Long phone_session = (Long) session.getAttribute("phone");

	/* HttpSession session = request.getSession(false); */
	String ename = "";
	String password = "";
	long phone = 0;
	int eid = 0;

	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("student-unit");
	EntityManager entityManager = entityManagerFactory.createEntityManager();
	EntityTransaction transaction = entityManager.getTransaction();

	transaction.begin();
	System.out.println("hi    hi   " + phone_session);

	/* 	Optional<Employee> emp = Optional.ofNullable(entityManager.find(Employee.class, phone_session)); */
	/* 	Employee emp = entityManager.find(Employee.class, phone_session);
	 */
	Query query = entityManager.createQuery("SELECT e FROM Employee e WHERE e.phone=?1");
	query.setParameter(1, phone_session);
	Employee emp = (Employee) query.getSingleResult();
	System.out.println(emp);

	transaction.commit();

	/* emp.ifPresentOrElse(e -> {
		ename = e.getEname();
		password = e.getPassword();
		phone = e.getPhone();
		eid = e.getId();
	}, () -> System.out.println("no record")); */

	if (emp != null) {
		ename = emp.getEname();
		password = emp.getPassword();
		phone = emp.getPhone();
		eid = emp.getId();
	} else {
		System.out.println("No record found");
	}

	/* session = request.getSession(false);
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
	} */
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
