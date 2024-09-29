package com.ty;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.postgresql.Driver;

public class ConnectionPool {

	static Connection connection = null;

	public static Connection getConnection() {

		Driver driver = new Driver();

		try {
			DriverManager.registerDriver(driver);
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/demodb", "postgres", "root");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return connection;
	}

}
