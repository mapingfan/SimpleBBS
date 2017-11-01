<%--
  Created by IntelliJ IDEA.
  User: 马平凡
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
             * 一种新的实现方式；
             * 使用session控制会话
             */
            session.setAttribute("admin", "true");
            response.sendRedirect("ShowArticleTree.jsp");
        } else {
            out.println("<p>用户名或者密码错误</p>");
        }
    }
%>
<html>
<head>
    <meta charset="gbk">
    <title>登录</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css"/>
</head>
<body>
<section class="login-form-wrap">
    <h1>BBS登录</h1>

    <form class="login-form" action="login.jsp" method="post">
        <input type="hidden" name="action" value="post">
        <label>
            <input type="text" name="username" required placeholder="账号">
        </label>
        <label>
            <input type="password" name="password" required placeholder="密码">
        </label>
        <input type="submit" value="登录">
    </form>
    <h5><a href="#">忘记密码</a>&nbsp; <a href="ShowArticleTree.jsp">匿名看帖</a></h5>
</section>
<div style="text-align:center;clear:both">
</div>
</body>
</html>
