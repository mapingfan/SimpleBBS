<%@ page import="java.sql.*" %>
<%--
Created by IntelliJ IDEA.
  User: 马平凡
  Date: 2017/10/31
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
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
    <title>Article Tree</title>
</head>
<body>
<%!
    String output="";
    public void tree(int id, int level) throws SQLException {
        String preSpace="";
        for (int i = 0; i < level; i++) {
            preSpace+=" ";
        }
        resultSet = statement.executeQuery("SELECT * FROM article WHERE pid ="+id);
        while (resultSet.next()) {
            String  tmp = preSpace+resultSet.getString(5);
            output += (tmp+"\n");
            if (resultSet.getInt(7)!=0) {
                tree(resultSet.getInt(1), level + 1);
            }
        }
    }
%>
<% tree(0,0);%>
<pre>
<%= output %>
</pre>
</body>
</html>
