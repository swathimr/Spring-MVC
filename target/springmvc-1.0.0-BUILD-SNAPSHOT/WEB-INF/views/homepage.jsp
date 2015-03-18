<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<title>Home Page Creation</title>
</head>
<body>
<div class="col-md-5 col-md-offset-3" style="margin-top:3%;">
<div id="status" style="color:red;"></div>
  <div class="panel panel-default">
    <div class="panel-heading">Home Page Creation</div>
     <div class="panel-body">
		<form method="POST" role="form" action="/springmvc/homepage/create">
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="firstname">First Name</label>
				<input type="text" class="form-control" name="firstname" id="firstname" required>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="lastname">Last name</label>
				<input type="text" class="form-control" name="lastname" id="lastname" required>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="email">Email</label>
				<input type="email" class="form-control" name="email" id="email" required>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="address">Address</label>
				<input type="text" class="form-control" name="address" id="address" required>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label>Organization</label>
				<input type="text" class="form-control" name="organization" id="organization" required>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label>AboutMySelf</label>
				<input type="text" class="form-control" name="aboutMyself" id="aboutMyself" required>
			</div>
		</div><br>
		<input type="hidden" id="deleteCheck" value=${delete}>
		<div class="col-xs-7 col-sm-4 col-md-offset-4">
		  <button id="submit" type="submit" class="btn btn-default">Create</button></div><br></br>
		</form>
</div>
</div>
</div>
<script>
var deleteCheck = document.getElementById("deleteCheck").value;
if(deleteCheck=="true")
	{
	document.getElementById("status").innerHTML="Record had been deleted Successfully";
	}
</script>
</body>
</html>