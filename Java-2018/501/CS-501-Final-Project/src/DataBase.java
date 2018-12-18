import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.text.SimpleDateFormat;

public class DataBase {
	/**
	 * @param JDBC_DRIVER Using the new driver, but is not necessary
	 * @param DB_URL      default database URL
	 * @param USER        set as root
	 * @param PASS        should let user to set password here
	 */
	private static String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static String DB_URL = "jdbc:mysql://localhost:3306/";
	private static String USER = "root";
	private static String PASS = "ajx591301";

	public DataBase() {
		JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
		DB_URL = "jdbc:mysql://localhost:3306/";
		USER = "root";
		PASS = "ajx591301";
	}

	public static void main(String[] args) {
		UserCreateTable();
	}

	public DataBase(String driver, String url, String user, String pass) {
		JDBC_DRIVER = driver;
		DB_URL = url;
		USER = user;
		PASS = pass;
		System.out.println("JDBC Driver is: " + JDBC_DRIVER);
		System.out.println("Database URL is: " + DB_URL);
		System.out.println("User is: " + USER);
		System.out.println("Password is: " + PASS);
	}

	/** Offer this to add data */
	public static void UserInsertData(ArrayList<String[]> dataList, String name, String symbol) {
		InsertData(dataList, name, symbol);
	}

	/** Insert all data to existing database */
	private static void InsertData(ArrayList<String[]> dataList, String name, String symbol) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL + "501_final_project", USER, PASS);
			stmt = conn.createStatement();
			System.out.println("Database: 501_final_project connected successfully...");

			String aName = name;
			String aSymbol = symbol;
			String aDate = "";
			float open = 0;
			float high = 0;
			float low = 0;
			float close = 0;
			float adj_close = 0;
			int volume = 0;

			sql = "INSERT INTO companies (name, symbol) VALUES ('" + aName + "','" + aSymbol + "')";
			stmt.executeUpdate(sql,Statement.RETURN_GENERATED_KEYS);

			rs = stmt.getGeneratedKeys();
			rs.first();
			int owner_id = rs.getInt(1);

			// Insert Data
			while (!dataList.isEmpty()) {
				String[] aRow = dataList.remove(0);

				Date date = new SimpleDateFormat("MMM", Locale.ENGLISH).parse(aRow[0]);
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				int month = cal.get(Calendar.MONTH) + 1;
				aDate = aRow[2] + "-" + month + "-" + aRow[1];

				open = Float.parseFloat(aRow[3]);
				high = Float.parseFloat(aRow[4]);
				low = Float.parseFloat(aRow[5]);
				close = Float.parseFloat(aRow[6]);
				adj_close = Float.parseFloat(aRow[7]);
				volume = Integer.parseInt(aRow[8]);

				sql = "INSERT INTO quotes ( date, open, high, low, close, adj_close, volume, owner ) VALUES " + "( '"
						+ aDate + "', '" + open + "', '" + high + "', '" + low + "', '" + close + "', '" + adj_close
						+ "', '" + volume + "', '" + owner_id + "' );";
				stmt.executeUpdate(sql);
			}
			System.out.println("Records inserted successfully...");

			// close should be the opposite order when opening
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
	}

	/** Offer this to create database */
	public static void UserCreateTable() {
		CreateTable();
	}

	/** Start from root database */
	private static void CreateTable() {
		Connection conn = null;
		Statement stmt = null;
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

			sql = "CREATE TABLE companies (" + " company_id int(6) unsigned NOT NULL AUTO_INCREMENT,"
					+ " name char(40) NOT NULL DEFAULT '' COMMENT 'name for the company',"
					+ " symbol char(8) NOT NULL DEFAULT '' COMMENT 'symbol for company',"
					+ " PRIMARY KEY (`company_id`)"
					+ ") ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='This stores the companies.'";
			stmt.executeUpdate(sql);
			// quotes is referenced to company_id
			sql = "CREATE TABLE quotes ( quote_id int(7) unsigned NOT NULL AUTO_INCREMENT,"
					+ " date date NOT NULL DEFAULT '1000-01-01'," + " open float(7,2) unsigned NOT NULL DEFAULT '0.00',"
					+ " high float(7,2) unsigned NOT NULL DEFAULT '0.00',"
					+ " low float(7,2) unsigned NOT NULL DEFAULT '0.00',"
					+ " close float(7,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '*Close price adjusted for splits.',"
					+ " adj_close float(7,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '**Adjusted close price adjusted for both dividends and splits.',"
					+ " volume int(10) unsigned NOT NULL DEFAULT '0',"
					+ " owner int(6) unsigned NOT NULL REFERENCES companies(company_id)," + " PRIMARY KEY (`quote_id`)"
					+ ") ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='This stores the historical data.'";
			stmt.executeUpdate(sql);

			System.out.println("Table quotes and companies created successfully...");
			// close should be the opposite order when opening
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
		System.out.println("End of Table Creation!");
	}
}