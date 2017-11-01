<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: ÂíÆ½·²
  Date: 2017/10/31
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%!
    Connection connection = null;
    Statement statement = null;
%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    String url ="jdbc:mysql://localhost:3306/bbs";
    String user = "root";
    String pwd = "320823";
    connection = DriverManager.getConnection(url, user, pwd);
    statement = connection.createStatement();
%>
<html>
<head>
    <title>Show Details</title>
</head>
<body>
<%
  int id = Integer.parseInt(request.getParameter("id"));
    int rootid = 0;
  String sql = "select * from article where id = "+id;
  ResultSet resultSet = statement.executeQuery(sql);
    if (resultSet.next()) {
        rootid = resultSet.getInt(3);
        out.println("<table border='1' width = '100%'><tr><td>ID</td><td>"+id+"</td><td><tr><td>Title</td><td>"+resultSet.getString("title")+"</td><tr><td>Content</td><td><pre>"+resultSet.getString("cont")+"</pre></td></table>");

    }
%>
<a href="reply.jsp?rootid=<%=rootid%>&id=<%=id%>">»Ø¸´</a>
</body>
</html>
