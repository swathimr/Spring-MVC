<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
	<title>View/update User</title>
</head>

<body>
<div class="col-md-5 col-md-offset-3" style="margin-top:3%;">
<div id="status" style="color:red;"></div>
  <div class="panel panel-default">
    <div class="panel-heading">UPDATE / DELETE USER</div>
     <div class="panel-body">
		<form role ="form" action="" id="updateDelForm" method="POST">
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="id">ID:</label>
				<input type="text" class="form-control" name="id" value=${userValue.id} id="id" READONLY>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="firstname">FirstName:</label>
				<input type="text" class="form-control" name="firstname" value=${userValue.firstname} id="firstname" required>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="lastname">Last Name:</label>
				<input type="text" class="form-control" name="lastname" value=${userValue.lastname} id="lastname" required>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="email">Email:</label>
				<input type="text" class="form-control" name="email" value=${userValue.email} id="email" required>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="address">Address:</label>
				<input type="text" class="form-control" name="address" value=${userValue.address} id="address" required>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="organization">Organization:</label>
				<input type="text" class="form-control" name="organization" value=${userValue.organization} id="organization" required>
			</div>
			</div><br>
			<div class="row">
			<div class="col-xs-7 col-md-offset-2">
				<label for="aboutMyself">AboutMyself</label>
				<input type="text" class="form-control" name="aboutMyself" value=${userValue.aboutMyself} id="aboutMyself" required>
			</div>
			</div><br>
			<input type="hidden" id="updateCheck" value=${update}>
			<input type="hidden" id="createCheck" value=${create}>
			<div class="col-xs-7 col-sm-4 col-md-offset-4">
		  <button id="submit" type="submit" class="btn btn-default" onclick="updateAction();">Update</button>&nbsp;
		  <button id="submit1" type="submit" class="btn btn-default" onclick="deleteAction();">Delete</button></div><br></br>
		</form>
	
</div>
</div>
</div>
<script>
var updateCheck = document.getElementById("updateCheck").value;
if(updateCheck=="true")
	{
	document.getElementById("status").innerHTML="Home Page is updated Successfully";
	}
	
var createCheck = document.getElementById("createCheck").value;
if(createCheck=="true")
	{
	document.getElementById("status").innerHTML="Home Page is created Successfully";
	}
function deleteAction()
{
var userId=document.getElementById("id").value;
document.getElementById("updateDelForm").action="/springmvc/homepage/userId/"+userId;
}

function updateAction()
{
	document.getElementById("updateDelForm").action="/springmvc/homepage/create";
}
</script>
</body>
</html>
