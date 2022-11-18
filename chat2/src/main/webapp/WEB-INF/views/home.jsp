<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
	<form action="/main" method="post">
		<label>id : </label>
		<input type="text" name="id">
		<input type="submit" value="접속">
	</form>
</body>
</html>
