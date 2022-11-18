<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>Hi ! ${userId}</p>
	<form action="/chat.do">
		<label>방이름 : </label>
		<input type="text" name="chat_url">
		<input type="submit" value="접속">
	</form>
</body>
</html>