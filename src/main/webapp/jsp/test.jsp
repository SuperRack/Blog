<%--
  Created by IntelliJ IDEA.
  User: 李京松
  Date: 2018/6/6
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传与下载</title>
</head>
<body>
    <form action="../file/upload" method="post" enctype="multipart/form-data">
        选择文件:<input type="file" name="file" width="120px">
        <input type="submit" value="上传">
    </form>
    <hr />
    <form action="../file/down" method="get">
        <input type="submit" value="下载">
    </form>
</body>
</html>
