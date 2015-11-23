/*
 * Program: CS485_lab4
 * Purpose: The program is designed to illustrate 1) the use of SQL connector 
 * to connect to and update on MySQL database; 2) the use of JSP to create a
 * Web page for data entry. To make the program work, both JDK, Apache, MySQL
 * need to be installed.
 * @copyright the program is intended for class use, it should not be distributed
 * outside the class without permission from the instructor, Dr. Mingrui Zhang  
 */

import java.sql.*;

public class DBentry {
	static DBentry instance = new DBentry();
	Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	String dpwd = null;
	StringBuilder sb = new StringBuilder();
	
	//change URL to your database server as needed
	String dbPath="jdbc:mysql://localhost:3306";
	
	public static DBentry getInstance() {
		if (instance==null) {
			instance = new DBentry();
		}
		return instance;
	}
	
	//Establish connection to MySQL server
	public Connection newConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			try {			
				dbconn = DriverManager.getConnection(dbPath,"root","");
				System.out.println("gain the connection");
				return dbconn;
			}
			catch (Exception s){
				System.out.println(s.getStackTrace().toString());}
		}
		catch (Exception err){
			System.out.println(err.getStackTrace().toString());
		}
		return null;
	}
	
	public ResultSet selectStatement( String query ) {
		try {
			
			dbconn=instance.newConnection();
			sql=dbconn.prepareStatement(query);
			ResultSet results;
			results=sql.executeQuery();
			System.out.println("This is the query statement="+query);
	
			//WARNING!
			//Need to process ResultSet before closing connection
			dbconn.close();
			return results;
		}
		catch (Exception err) {
			System.out.println(err.getMessage());
			return null;
		}
	}

	public boolean DBentry( String query ) {
		try {
			System.out.println("query="+query);
			instance.newConnection();
			sql=dbconn.prepareStatement(query);
			sql.executeUpdate(query);
			dbconn.close();
			return true;
		}
		catch ( Exception err ) {
			err.getStackTrace();
			return false;
		}
	}
	
	
	public boolean entry( String [] customer ) {
		try {
			instance.DBentry("INSERT INTO lab05.customer(`item_Num`,`price`, `first_Name`,`last_Name`,`ship_Add`, `card_Type`, `card_Num`) " +
							"VALUES ( '"+customer[0]+"', '"+customer[1]+"', '"+customer[2]+"', '"+customer[3]+"', '"+customer[4]+"', '"+customer[5]+"', '"+customer[6]+"');");	
								
			return true;
		}

		catch ( Exception err ) {
			err.getStackTrace();
			return false;
		}
	}
	
	public boolean checkLogin(String [] login)
	{
		try
		{
			instance.DBentry("USE winona_athletics SELECT f_name FROM coach WHERE f_name = '"+login[0]+"' and '"+login[1]+"';");
			return true;
		}
		
		catch(Exception e)
		{
			e.getStackTrace();
			return false;
		}
	}
	
	
	public static void main(String[] args) {	
		//instance.entry("Golf");
	}
}