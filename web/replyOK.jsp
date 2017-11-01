<%--
  Created by IntelliJ IDEA.
  User: ÂíÆ½·²
  Date: 2017/10/31
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@page import="java.sql.*" %>
<%!
    Connection connection = null;
%>

<%
    request.setCharacterEncoding("gb2312");
    Class.forName("com.mysql.jdbc.Driver");
    String url ="jdbc:mysql://localhost:3306/bbs";
    String user = "root";
    String pwd = "320823";
    int pid = Integer.parseInt(request.getParameter("pid"));
    int rootid = Integer.parseInt(request.getParameter("rootid"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    connection = DriverManager.getConnection(url, user, pwd);
    connection.setAutoCommit(false);
    String sql = "insert into article values(null,?,?,?,?,now(),0)";
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    Statement statement = connection.createStatement();
    preparedStatement.setInt(1,pid);
    preparedStatement.setInt(2,rootid);
    preparedStatement.setString(3,title);
    preparedStatement.setString(4,content);
    statement.executeUpdate("UPDATE article SET isleaf = 1 WHERE id = " + pid);
    preparedStatement.executeUpdate();
    connection.commit();
    connection.setAutoCommit(true);
    response.sendRedirect("ShowArticleTree.jsp");
%>

<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
