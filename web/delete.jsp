<%--
  Created by IntelliJ IDEA.
  User: ��ƽ��
  Date: 2017/10/31
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>

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
    connection = DriverManager.getConnection(url, user, pwd);
%>


<%!
    private boolean isleaf(Connection connection, int id) throws SQLException {
        Statement statement = connection.createStatement();
        String sql = "select * from article where id = " + id;
        ResultSet resultSet = statement.executeQuery(sql);
        resultSet.next();
            if (resultSet.getInt(7) == 0) {
                return true;
            }
        return false;
    }

%>

<%!
    public void deleteViaID(Connection connection, int id) throws SQLException {
        /**
         * �����ǰ�ڵ���Ҷ�ӽڵ㣬��ôֱ��ɾ���㡣
         * ������ǣ���ôɾ���ӽڵ㣬ɾ�����ڵ㣻
         * ����id�ж�����ڵ��ǲ���Ҷ�ӽڵ㡣
         */
        if (isleaf(connection, id)) {
            connection.prepareStatement("DELETE FROM article WHERE id = " + id).executeUpdate();

        } else {
            String sql = "select * from article where pid = " + id;
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                deleteViaID(connection,resultSet.getInt(1));
            }
            connection.prepareStatement("DELETE FROM article WHERE id = " + id).executeUpdate();
        }
    }

%>

<%
    String attr = (String) session.getAttribute("admin");
    if (attr != null && attr.equals("true")) {
        int id = Integer.parseInt(request.getParameter("id"));
        /**
         * �жϵ�ǰid�ǲ��ǻ����ֵܽڵ㣬���û���ˣ���ô���ڵ��isleaf������Ϊ0��
         */
        int pid = Integer.parseInt(request.getParameter("pid"));
        boolean hasSibling = false;
        String sql = "select count(*) from article where pid = " + pid;
        ResultSet tmp = connection.createStatement().executeQuery(sql);
        if (tmp.next()) {
            int count = tmp.getInt(1);
            if (count > 1) {
                hasSibling = true;
            } else {
                hasSibling = false;
            }
        }
        connection.setAutoCommit(false);
        if (hasSibling == false) {
            connection.createStatement().executeUpdate("UPDATE article SET isleaf = 0 WHERE id = " + pid);
        }
        deleteViaID(connection, id);

        connection.commit();
        connection.setAutoCommit(true);
        response.sendRedirect("ShowArticleTree.jsp");
    } else {
        out.println("��Ȩ��ɾ������.");
        return;
    }


%>


<html>
<head>
    <title>Delete</title>
</head>
<body>

</body>
</html>
