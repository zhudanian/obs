<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>
<%
    request.getRequestDispatcher("/showLogin").forward(request,response);
%>
</body>
</html>
