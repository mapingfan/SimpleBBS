<%--
  Created by IntelliJ IDEA.
  User: 马平凡
  Date: 2017/10/31
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%
    int pid = Integer.parseInt(request.getParameter("id"));
    int rootid = Integer.parseInt(request.getParameter("rootid"));
%>
<html>
<head>
    <title>回复</title>
</head>
<body>
<form action="replyOK.jsp" method="post">
    <input type="hidden" name="pid" value="<%=pid%>">
    <input type="hidden" name="rootid" value="<%=rootid%>">
    <table border="1">
        <tr>
            <td>标题</td>
            <td><input type="text" name="title" height="100%" width="100%"></td>
        </tr>
        <tr>
            <td>内容</td>
            <td><textarea name="content" id="" cols="40" rows="10"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="提交"> </td>
        </tr>
    </table>
</form>
</body>
</html>
