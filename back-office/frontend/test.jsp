<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test JSP</title>
</head>
<body>
    <h1>✅ JSP fonctionne !</h1>
    <p>Timestamp: <%= new java.util.Date() %></p>
    <p>Server: <%= application.getServerInfo() %></p>
    <p><a href="backoffice">Aller au back-office</a></p>
</body>
</html>
