<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>A sample to connect to DB</title>
</head>
<body>
<%@ page import="java.io.*,java.util.*" %> 
<%@ page import="db.*" %>

<h1>Please Login</h1>
	
	<form action = "index.jsp" method = "get">
	
		First Name: <input id = "name" name = "name" type = "text"/> <br></br>
		
		ID: <input id = "id" name = "id" type = "text"/>
		
	<button type = "submit" value = "Login">Login</button>
	</form>
	
	
	
	
<%
	// ----Stores login information (id and password)-----
		String name, id;
		name = request.getParameter("name");
		id= request.getParameter("id");
		
		String [] login = new String [] {name, id};
	//-----------------------------------------------------
	
	/*
		Checks if valid input
		Creates a DBentry object
		Plugs it into the entry checkLogin() method
		If correct goes to 
	*/
	if (login != null&&!login.equals("")){
		DBentry DBentry=new DBentry();
		boolean flag=DBentry.checkLogin(login);
		if(flag == true)
		{
			System.out.println("Is a member");
		}
		else
		{ 
			System.out.println("You cannot login ");
		}
	}

	%>


</body>
</html>