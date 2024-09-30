package com.ty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Employee;

@WebServlet("/login")
public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Long phone = Long.valueOf(req.getParameter("phone"));
		String password = req.getParameter("password");

		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("student-unit");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();

		transaction.begin();
		HttpSession session = req.getSession();
		Query query = entityManager.createQuery("SELECT e FROM Employee e Where e.phone=?1 AND e.password=?2");
		query.setParameter(1, phone);
		query.setParameter(2, password);
		List<Employee> resultList = query.getResultList();
		if (resultList != null && !resultList.isEmpty()) {
			session.setAttribute("phone", phone);
			resp.sendRedirect("dashboard.jsp");
		} else {
			session.setAttribute("message", "Invalid phone or password.");
			resp.sendRedirect("login.jsp");
		}

//		Connection connection = ConnectionPool.getConnection();
//
//		try {
//			PreparedStatement statement = connection
//					.prepareStatement("Select * from employee where phone=? AND password=?");
//
//			statement.setLong(1, phone);
//			statement.setString(2, password);
//
//			ResultSet executeQuery = statement.executeQuery();
//			if (executeQuery.next()) {
//
//				HttpSession session = req.getSession();
//				session.setAttribute("phone", phone);
////				RequestDispatcher requestDispatcher = req.getRequestDispatcher("dashboard.jsp");
////				requestDispatcher.forward(req, resp);
//				resp.sendRedirect("dashboard.jsp");
//
//			} else {
//				HttpSession session = req.getSession();
//				session.setAttribute("message", "Invalid phone or password.");
//				resp.sendRedirect("login.jsp");
//
//				/*
//				 * RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
//				 * requestDispatcher.forward(req, resp);
//				 */
//			}
//
////				String un = executeQuery.getString("username");
////				String pass = executeQuery.getString("password");
////
////				if (username != null && username.equals(un) && password != null && password.equals(pass)) {
////
//////					Cookie cookie = new Cookie("username", username);
//////					System.out.println(username+"        12333 ");
//////					resp.addCookie(cookie);
////
////					HttpSession session = req.getSession();
////					session.setAttribute("username", username);
////					RequestDispatcher requestDispatcher = req.getRequestDispatcher("/dashboard");
////					requestDispatcher.forward(req, resp);
////
////				} else {
////
////					HttpSession session = req.getSession();
////					session.setAttribute("message", "something went wrong.");
////					RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
////					requestDispatcher.forward(req, resp);
////				}
//
////			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			try {
//				if (connection != null) {
//					connection.close();
//				}
//			} catch (Exception e2) {
//				// TODO: handle exception
//			}
//		}

	}

}
