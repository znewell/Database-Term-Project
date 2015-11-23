<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>WSU Athletics</title>
</head>
<body>

	<h1>Please Login</h1>
	
	<form action = "index.jsp" method = "get">
	
		ID: <input id = "id" name = "id" type = "text"/> <br></br>
		
		Password: <input id = "password" name = "password" type = "text"/>
		
	
	</form>
	
	
<%
	// ----Stores login information (id and password)-----
		String id, password;
		id = request.getParameter("id");
		password= request.getParameter("password");
		
		String [] login = new String [] {id, password};
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
		if(flag) {%><script type="text/javascript">alert("Entry Success");</script><%
		}
		else { %><script type="text/javascript">alert("Entry Failure");</script><% 
		
		}
	}

	%>

</body>
</html>