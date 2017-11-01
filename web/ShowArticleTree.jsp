<%@ page import="java.sql.*" %>
<%--
Created by IntelliJ IDEA.
  User: 马平凡
  Date: 2017/10/31
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%!
    Connection connection = null;
%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    String url ="jdbc:mysql://localhost:3306/bbs";
    String user = "root";
    String pwd = "320823";
    connection = DriverManager.getConnection(url, user, pwd);
%>

<%!
    String output_admin ="";
    public void tree_admin(Connection connection,int id, int level) throws SQLException {
        String preSpace="";
        for (int i = 0; i < level; i++) {
            preSpace+="----";
        }
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM article WHERE pid ="+id);
        while (resultSet.next()) {
            String  tmp = "<tr><td>"+resultSet.getString(1)+"</td><td >"+ preSpace+
                    "<a href = showDetails.jsp?id="+
                    resultSet.getString(1)+">"+
                    resultSet.getString(4)+
                    "</a></td><td width = 50>"+
                    "<a href=delete.jsp?pid="+resultSet.getString(2)+"&id="+
                    resultSet.getString(1)+">删除</a>"+"</td></tr>";
            output_admin += (tmp+"\n");
            if (resultSet.getInt("isleaf")!=0) {
                tree_admin(connection,resultSet.getInt("id"), level + 1);
            }
        }
    }
%>

<%!
    String output="";
    public void tree(Connection connection,int id, int level) throws SQLException {
        String preSpace="";
        for (int i = 0; i < level; i++) {
            preSpace+="----";
        }
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM article WHERE pid ="+id);
        while (resultSet.next()) {
            String  tmp = "<tr><td>"+resultSet.getString(1)+"</td><td >"+ preSpace+
                    "<a href = showDetails.jsp?id="+
                    resultSet.getString(1)+">"+
                    resultSet.getString(4)+
                    "</a></td></tr>";
            output += (tmp+"\n");
            if (resultSet.getInt("isleaf")!=0) {
                tree(connection,resultSet.getInt("id"), level + 1);
            }
        }
    }
%>

<%
    //String username = request.getParameter("username");
    String attr = (String)session.getAttribute("admin");
    if (attr != null && attr.equals("true")) {
        tree_admin(connection, 0, 0);
    }else {
        tree(connection,0,0);
    }
    /*if (username!= null && username.equals("admin")) {

    } else {
        tree(connection,0,0);
        username = "匿名";
    }*/
%>

<html>
<head>
    <title>Article Tree</title>
</head>
<p>

<p align="center">Welcome Admin </p>
<p></p><a href="post.jsp">发表新帖</a>&nbsp; <a href="login.jsp">我要登录</a> </p>

    <%
    if (!output_admin.equals("")) { %>
        <table border="1">
            <%= output_admin %>
        </table>
        <%output_admin="";%>
    <% } else { %>
        <table border="1">
            <%= output %>
        </table>
        <%output="";%>
    <% }  %>
</body>
</html>
