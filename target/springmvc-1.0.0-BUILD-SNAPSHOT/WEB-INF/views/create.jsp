<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
</head>
<body>
<P>  user created </P>
<label>ID:</label><input type="text" name="id" value=${createUser.id} id="id">
<label>First Name:</label><input type="text" name="firstName" value=${createUser.firstname} id="firstname">
<label>Last Name:</label><input type="text" name="lastname" value=${createUser.lastname} id="lastname">
<label>Email:</label><input type="text" name="email" value=${createUser.email} id="email">
<label>Address:</label><input type="text" name="address" value=${createUser.address} id="address">
<label>Organization:</label><input type="text" name="organization" value=${createUser.organization} id="organization">
<label>AboutMySelf:</label><input type="text" name="aboutMyself" value=${createUser.aboutMyself} id="aboutMyself">
</body>
</html>
