<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: ��ƽ��
  Date: 2017/11/01
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<%@ page import="java.sql.*" %>
<%

    String actionName = request.getParameter("action");
    if (actionName != null && actionName.equals("post")) {
        /**
         * POST����������ִ�в��������
         * ��������������ҳ�治�������ݣ�
         */
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Class.forName("com.mysql.jdbc.Driver");
        String url ="jdbc:mysql://localhost:3306/bbs";
        String user = "root";
        String pwd = "320823";
        Connection connection = DriverManager.getConnection(url, user, pwd);
        connection.setAutoCommit(false);
        String sql = "INSERT INTO article VALUES (NULL ,0,?,?,?,now(),0)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        /**
         * �������rootid��
         */
        preparedStatement.setInt(1,-1);
        preparedStatement.setString(2,title);
        preparedStatement.setString(3, content);
        preparedStatement.executeUpdate();
        ResultSet resultSet = preparedStatement.getGeneratedKeys();
        resultSet.next();
        int key = resultSet.getInt(1);
        resultSet.close();
        //connection.createStatement().executeUpdate("UPDATE article SET rootid = " + key + "WHERE id = " + key);
        Statement statement = connection.createStatement();
        statement.executeUpdate("UPDATE article SET rootid = " + key + " WHERE id = " + key);
        connection.commit();
        connection.setAutoCommit(true);
        response.sendRedirect("showArticleFlat.jsp");
    }

%>
<html>
<head>
    <title>����</title>
</head>
<body>
<form action="post.jsp" method="post">
    <input type="hidden" name="action" value="post">
    <table border="1">
        <tr>
            <td>����</td>
            <td><input name="title" type="text"></td>
        </tr>
        <tr>
            <td>����</td>
            <td><textarea name="content" cols="80" rows="20"></textarea></td>
        </tr>
        <tr>
            <td align="center" colspan="2"><input  type="submit" value="�ύ"></td>

        </tr>
    </table>
</form>
</body>
</html>
