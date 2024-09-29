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

@WebServlet("/delete")
public class Delete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

		HttpSession session = req.getSession(false);
		Long phone = (Long) session.getAttribute("phone");
		if (phone != null) {

			Connection connection = ConnectionPool.getConnection();
			PreparedStatement statement;
			try {
				statement = connection.prepareStatement("DELETE FROM employee WHERE phone=?");
				statement.setLong(1, phone);
				statement.executeUpdate();

				session.invalidate();
				resp.sendRedirect("login.jsp");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			resp.sendRedirect("login.jsp");
		}
	}

}
