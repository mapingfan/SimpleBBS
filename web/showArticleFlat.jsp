<%--
  Created by IntelliJ IDEA.
  User: 马平凡
  Date: 2017/11/01
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" %>
<%@page import="java.sql.*" %>

<%
    /**
     * 平板式展现帖子；
     */
    Class.forName("com.mysql.jdbc.Driver");
    String url ="jdbc:mysql://localhost:3306/bbs";
    String user = "root";
    String pwd = "320823";
    Connection connection = DriverManager.getConnection(url, user, pwd);
    String count_sql = "select count(*) from article where pid = 0";
    ResultSet count_result = connection.createStatement().executeQuery(count_sql);
    count_result.next();
    int count = count_result.getInt(1);
    int pageSize = 3;
    int pageNum = 1;
    int maxPageNum;
    if (count % pageSize == 0) {
        maxPageNum = count / pageSize;
    } else {
        maxPageNum = count/pageSize+1;
    }
        String strPageNum = request.getParameter("pagenum");
        if (strPageNum == null || strPageNum.equals("")||hasOtherChar(strPageNum)) {
            pageNum = 1;
        } else {
            if (Integer.parseInt(strPageNum) <= 0) {
                strPageNum = "1";
            } else if (Integer.parseInt(strPageNum) > maxPageNum) {
                strPageNum = maxPageNum + "";
            }
            pageNum = Integer.parseInt(strPageNum);
        }

    int startPosition = (pageNum - 1) * pageSize;
    String sql = "select * from article WHERE pid = 0 ORDER BY pdate DESC LIMIT " + startPosition + " , " + pageSize;
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery(sql);
%>

<%!
    boolean hasOtherChar(String string) {
        for (int i = 0; i < string.length(); i++) {
            if (!Character.isDigit(string.charAt(i))) {
                return true;
            } else {
                continue;
            }
        }
        return false;
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p></p><a href="post.jsp">发表新帖</a>&nbsp; <a href="login.jsp">我要登录</a> </p>
<table border="1">
    <%
        while (resultSet.next()) { %>
    <tr>
        <td>
            <a href="#"> <%=resultSet.getString(4)%> </a>
        </td>
    </tr>
       <% } %>
</table>

<p><a href="showArticleFlat.jsp?pagenum=<%=pageNum-1%>">上一页</a>&nbsp;<a href="showArticleFlat.jsp?pagenum=<%=pageNum+1%>">下一页</a> </p>
<form method="post" action="showArticleFlat.jsp">
    <select name="pagenum" onchange="document.forms[0].submit()">
        <%
            for (int i = 1; i <= maxPageNum; i++) { %>
                <option value="<%=i%>" <%= i==pageNum?"selected":""%> ><%=i%></option>
        <%  } %>
    </select>
</form>

<form action="showArticleFlat.jsp">
    <input type="text" name="pagenum" value="<%=pageNum%>">
    <input type="submit" value="go">
</form>


</body>
</html>
