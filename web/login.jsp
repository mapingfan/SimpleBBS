<%--
  Created by IntelliJ IDEA.
  User: ��ƽ��
  Date: 2017/11/01
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk"  %>
<%
    String action = request.getParameter("action");
    if (action != null && action.equals("post")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username.equals("admin") && password.equals("admin")) {
            //response.sendRedirect("ShowArticleTree.jsp?username="+username);
            /**
             * һ���µ�ʵ�ַ�ʽ��
             * ʹ��session���ƻỰ
             */
            session.setAttribute("admin", "true");
            response.sendRedirect("ShowArticleTree.jsp");
        } else {
            out.println("<p>�û��������������</p>");
        }
    }
%>
<html>
<head>
    <meta charset="gbk">
    <title>��¼</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css"/>
</head>
<body>
<section class="login-form-wrap">
    <h1>BBS��¼</h1>

    <form class="login-form" action="login.jsp" method="post">
        <input type="hidden" name="action" value="post">
        <label>
            <input type="text" name="username" required placeholder="�˺�">
        </label>
        <label>
            <input type="password" name="password" required placeholder="����">
        </label>
        <input type="submit" value="��¼">
    </form>
    <h5><a href="#">��������</a>&nbsp; <a href="ShowArticleTree.jsp">��������</a></h5>
</section>
<div style="text-align:center;clear:both">
</div>
</body>
</html>
