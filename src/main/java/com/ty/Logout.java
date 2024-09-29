package com.ty;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

		HttpSession session = req.getSession(false);
		Long phone = (Long) session.getAttribute("phone");

		if (phone != null) {
			session.invalidate();
		}
		resp.sendRedirect("login.jsp");


	}
}
