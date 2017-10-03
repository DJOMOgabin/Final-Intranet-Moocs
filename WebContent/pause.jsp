<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<jsp:forward page="home.jsp">
		<jsp:param name="page" value="<%=request.getAttribute("page")%>"/>
	</jsp:forward>
 
</head>
<body>

</body>
</html>