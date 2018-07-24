<%--
  Created by IntelliJ IDEA.
  User: 李京松
  Date: 2018/6/4
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.all.js"></script>
</head>
<body>
<div>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">MyBlog后台</a>
            </div>
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </nav>
</div>
<div class="row">
    <div class="col-md-2">
        <div class="span12">
            <ul class="nav nav-list">
                <li class="nav-header">
                    列表标题
                </li>
                <li class="active">
                    <a href="#">首页</a>
                </li>
                <li>
                    <a href="#">库</a>
                </li>
                <li>
                    <a href="#">应用</a>
                </li>
                <li class="nav-header">
                    功能列表
                </li>
                <li>
                    <a href="#">资料</a>
                </li>
                <li>
                    <a href="#">设置</a>
                </li>
                <li class="divider">
                </li>
                <li>
                    <a href="#">帮助</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="col-md-10">
        <div class="span12">
            <form class="form-horizontal" action="../back/ok" method="post">
                <div class="control-group" style="    display: inline-block;">
                    <label class="control-label" for="01">文章标题</label>
                    <div class="controls">
                        <input id="01" type="text"  name="title"/>
                    </div>
                </div>
                <div class="control-group" style="    display: inline-block;">
                    <label class="control-label" for="02">作者</label>
                    <div class="controls">
                        <input id="02" type="text" name="edit"/>
                    </div>
                </div>
                <div class="control-group" style="    display: inline-block;">
                    <label class="control-label" for="03">文章类别</label>
                    <div class="controls">
                        <input id="03" type="text" name="category"/>
                    </div>
                </div>
                <div class="control-group" style="    display: inline-block;">
                    <label class="control-label" for="04">关键字</label>
                    <div class="controls">
                        <input id="04" type="text" name="key"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="04">文章内容</label>
                    <div class="controls">
                        <textarea id="myEditor" name="articleinfo"></textarea>
                        <script>
                            UE.getEditor('myEditor');
                        </script>
                    </div>
                </div>
                <div>
                    <input type="submit" value="保存" />
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
