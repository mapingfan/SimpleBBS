<%--
  Created by IntelliJ IDEA.
  User: ��ƽ��
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
    <title>�ظ�</title>
</head>
<body>
<form action="replyOK.jsp" method="post">
    <input type="hidden" name="pid" value="<%=pid%>">
    <input type="hidden" name="rootid" value="<%=rootid%>">
    <table border="1">
        <tr>
            <td>����</td>
            <td><input type="text" name="title" height="100%" width="100%"></td>
        </tr>
        <tr>
            <td>����</td>
            <td><textarea name="content" id="" cols="40" rows="10"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="�ύ"> </td>
        </tr>
    </table>
</form>
</body>
</html>
