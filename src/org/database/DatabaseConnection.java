package org.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import oracle.jdbc.OracleDriver;

public class DatabaseConnection {

	public static Connection getConnection() throws SQLException {
		String username = "gov";
		String password = "gov";
		String thinConnection = "jdbc:oracle:thin:@localhost:1521:XE";
		DriverManager.registerDriver(new OracleDriver());
		Connection conn = DriverManager.getConnection(thinConnection, username,password);
		conn.setAutoCommit(true);
		return conn;
	}
}
