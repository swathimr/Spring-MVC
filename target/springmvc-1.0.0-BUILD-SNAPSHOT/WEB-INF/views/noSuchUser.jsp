<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"/>
<title>Error page</title>
</head>
<body>
<h1>Custom 404 Exception</h1>
<hr>
<p><b>Sorry the requested user with user id:: ${userId} does not exist</b></p>
<br><br>
<form action="/springmvc/homepage">
<p>To create a user please click <button style="color:blue;font-size: 15px;" id="submit1" type="submit" class="btn btn-link">here</button> </p>
</form>
</body>
</html>