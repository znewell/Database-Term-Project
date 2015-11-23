<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>

	<form action = sport.jsp method = post>
		
		<h1>Pick a Sport</h1>
		<select name = "Sport">
			<option selected> Mens Basketball</option>
			<option>Football</option>
			<option>Baseball</option>
			<option>Softball</option>
			<option>Vollyball</option>
			<option>Soccer</option>
			<option>Gymnastics</option>
		</select>
		
		<button type = "submit" value = "submit">Submit</button>
		
<%
	String sport = request.getParameter("Sport");
	String query = "Select * FROM sport WHERE sport = ?;";
if( sport != null &&! sport.equals(""))
{
	DBentry DBentry = new DBentry();
	ResultSet result = DBentry.selectStatement(query);
if(flag != null &&! flag.equals(""))
{
	%><script type="text/javascript">window.location.replace("sport.jsp");</script><%
}
else { 
%>	<script type="text/javascript">window.location.replace("pickaSport.jsp");</script>
	<script type="text/javascript">alert("Something Went Wrong");</script>
<%		
}
}	
%>
%>
	</form>

</body>
</html>