<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 폼</h1>
<c:if test="${not empty notmember }">
	<script>alert("${notmember}")</script>	
</c:if>
<form action="${pageContext.request.contextPath}/member/login" method="post">
<input type="text" name="memberId" />
<input type="password" name="pw" />
<input type="submit" value="로그인하기"/>
</form>
</body>
</html>