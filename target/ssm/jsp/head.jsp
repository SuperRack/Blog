<%--
  Created by IntelliJ IDEA.
  User: 李京松
  Date: 2018/5/31
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row">
    <div class="col-md-6">
        <img src="../image/logo.png" />
        <img src="../image/name.png"  style="height:60px;"/>
    </div>
    <div>
        <iframe style="float: right;" width="420" scrolling="no"
                height="60" frameborder="0" allowtransparency="true"
        src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=5">
        </iframe>
    </div>
</div>
<nav class="navbar navbar-default" style=" background-image: linear-gradient(to bottom,#3c3c3c 0,#222 100%);">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../blog/new" style="color: #FFFFFF;"><span>MyBlog</span></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" id="uid">
                <li><a href="#" ><span>生活琐事</span></a></li>
                <li><a href="#" ><span>繁华记忆</span></a></li>
                <li><a href="#" ><span>心情随笔</span></a></li>
                <li><a href="#" ><span>语录收集</span></a></li>
                <li><a href="#" ><span>博客留言</span></a></li>
                <li><a href="#" ><span>关于博主</span></a></li>
            </ul>

            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="请输入要查询的内容">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
</body>
</html>
