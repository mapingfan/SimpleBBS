<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: 马平凡
  Date: 2017/10/31
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/bbs";
    String user = "root";
    String pwd = "320823";
    Connection connection = DriverManager.getConnection(url, user, pwd);
    out.print("数据库已连接.");
%>

<html>
<head>
    <title>Article Tree</title>
</head>
<body>

</body>
</html>
