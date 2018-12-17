package test;

import java.util.Date;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestDataBase {

	/**
	 * @param JDBC_DRIVER Using the new driver, but is not necessary
	 * @param DB_URL      default database URL
	 * @param USER        set as root
	 * @param PASS        should let user to set password here
	 */
	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/";
	private static final String USER = "root";
	private static final String PASS = "ajx591301";

	public static void main(String[] args) {
		testCreateTable();
	}

	private static void testCreateTable() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			// Create Database
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			System.out.println("Root Database connected.");

			sql = "CREATE DATABASE 501_final_project";
			stmt.executeUpdate(sql);
			System.out.println("Database 501_final_project created successfully...");
			stmt.close();
			conn.close();

			// Create Table
			conn = DriverManager.getConnection(DB_URL + "501_final_project", USER, PASS);
			stmt = conn.createStatement();
			System.out.println("Database: 501_final_project connected successfully...");

			sql = "CREATE TABLE quotes ( id int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'common id',"
					+ " name char(40) NOT NULL DEFAULT '' COMMENT 'name for the company',"
					+ " symbol char(8) NOT NULL DEFAULT '' COMMENT 'symbol for company',"
					+ " date date NOT NULL DEFAULT '1000-01-01'," + " open float(7,2) unsigned NOT NULL DEFAULT '0.00',"
					+ " high float(7,2) unsigned NOT NULL DEFAULT '0.00',"
					+ " low float(7,2) unsigned NOT NULL DEFAULT '0.00',"
					+ " close float(7,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '*Close price adjusted for splits.',"
					+ " adj_close float(7,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '**Adjusted close price adjusted for both dividends and splits.',"
					+ " volume int(10) unsigned NOT NULL DEFAULT '0'," + "  PRIMARY KEY (`id`)"
					+ ") ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8";
			stmt.executeUpdate(sql);
			System.out.println("Table quotes created successfully...");

			// Insert Data
			System.out.println("Inserting records into the table.");
			sql = "INSERT INTO quotes (name, symbol,date) VALUES (\"Apple Inc.\", \"APPL\", NOW());";
			stmt.executeUpdate(sql);
			System.out.println("Records inserted successfully...");

			// Select and print Data
			sql = "SELECT * FROM 501_final_project.quotes";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				// this is how to print out
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String symbol = rs.getString("symbol");
				Date date = rs.getDate("date");
				// print data
				System.out.print("ID: " + id);
				System.out.print(", Company Name: " + name);
				System.out.print(", Symbol: " + symbol);
				System.out.print(", Date Issued: " + date);
				System.out.print("\n");
			}
			// close should be the opposite order when opening
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException se) {
			se.printStackTrace(); // Handle errors for JDBC
		} catch (Exception e) {
			e.printStackTrace(); // Handle errors for Class.forName
		} finally {
			// close resource
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (SQLException se) {
			} // nothing to do here
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		} // End finally
		System.out.println("Goodbye!");
	}
}