package com.ty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update")
public class Update extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		Long phone_session = (Long) session.getAttribute("phone");
		if (phone_session != null) {

			String field = req.getParameter("field");
			String newData = req.getParameter("updateData");

			Connection connection = ConnectionPool.getConnection();

			if (field != null && newData != null && phone_session != null) {

				try {
					PreparedStatement statement = connection
							.prepareStatement("UPDATE employee SET " + field + "= ? WHERE phone=?");

					if (field.equals("phone")) {
						statement.setLong(1, Long.parseLong(newData));
					} else {

						statement.setString(1, newData);
					}
					statement.setLong(2, phone_session);
					int executeUpdate = statement.executeUpdate();
					System.out.println(executeUpdate);
					if (field.equals("phone")) {
//					session.removeAttribute(phone_session);
						session.setAttribute("phone", Long.valueOf(newData));
//					System.out.println("jhfjfjf "+session.getAttribute("phone"));
					}
					resp.sendRedirect("fetch.jsp");

				} catch (SQLException e) {
//					e.printStackTrace();
					session.setAttribute("message", "something went wrong");
					resp.sendRedirect("update.jsp");
				}
			} else {
				String ename = req.getParameter("ename");
				String password = req.getParameter("password");
				Long phone = Long.valueOf(req.getParameter("phone"));

				if (ename != null && password != null && phone != null) {
					try {
						PreparedStatement statement = connection.prepareStatement(
								"UPDATE employee SET ename = ?, phone = ?, password = ? WHERE phone = ?");
						statement.setString(1, ename);
						statement.setLong(2, phone);
						statement.setString(3, password);
						statement.setLong(4, phone_session);

						int executeUpdate = statement.executeUpdate();

						if (executeUpdate > 0) {
							session.setAttribute("phone", phone);
						}
						resp.sendRedirect("fetch.jsp");

					} catch (SQLException e) {
//						e.printStackTrace();
						session.setAttribute("message", "phone number is already present");
						resp.sendRedirect("update_all.jsp");
						
					}
				}

			}
		} else {
			resp.sendRedirect("login.jsp");

		}

	}
}
