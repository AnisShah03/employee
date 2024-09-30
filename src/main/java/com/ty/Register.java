package com.ty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Employee;

@WebServlet("/register")
public class Register extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String ename = req.getParameter("ename");
		String password = req.getParameter("password");
		long phone = Long.valueOf(req.getParameter("phone"));

		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("student-unit");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();

		transaction.begin();
		HttpSession session = req.getSession();

		try {
			entityManager.persist(new Employee(ename, password, phone));
			transaction.commit();
			System.out.println("saved");
			session.setAttribute("message", "your account is created.");
			resp.sendRedirect("login.jsp");

		} catch (Exception e) {
			System.out.println("you have already account");
			session.setAttribute("message", "you have already account!!");
			resp.sendRedirect("login.jsp");

		}

//		Connection connection = ConnectionPool.getConnection();
//		try {
//			String createTableSql = "CREATE TABLE IF NOT EXISTS employee(eid SERIAL, ename VARCHAR, password VARCHAR, phone BIGINT PRIMARY KEY )";
//			Statement statement = connection.createStatement();
//			statement.executeUpdate(createTableSql);
//
//			PreparedStatement insertstmt = connection
//					.prepareStatement("INSERT INTO employee (ename, password, phone) VALUES(?,?,?)");
//
//			if (insertstmt != null) {
//				HttpSession session = req.getSession();
//				insertstmt.setString(1, ename);
//				insertstmt.setString(2, password);
//				insertstmt.setLong(3, phone);
//
//				int executeUpdate = insertstmt.executeUpdate();
//				System.out.println("  anis " + executeUpdate);
//
//				if (executeUpdate > 0) {
//					System.out.println("acc is created");
//					session.setAttribute("message", "your account is created.");
////					RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
////					requestDispatcher.forward(req, resp);
//					resp.sendRedirect("login.jsp");
//				} else {
//					System.out.println("you have already account");
//					session.setAttribute("message", "you have already account!!");
////					RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
////					requestDispatcher.forward(req, resp);
//					resp.sendRedirect("login.jsp");
//
//				}
//
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
////			e.printStackTrace();
//
//			HttpSession session = req.getSession();
//
//			session.setAttribute("message", "user already exists");
////			RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
////			requestDispatcher.forward(req, resp);
//			resp.sendRedirect("register.jsp");
//
//		}
	}

}
