<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../javascript/one.js"></script>

<body style="padding-top: 10px;
    padding-bottom: 40px;
    background-color: #efefef;">
    <div class="container">
        <%--引入头文件--%>
        <%@include file="head.jsp" %>
        <div class="row">
            <div class="col-md-7">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="../image/01.jpg" alt="...">
                            <div class="carousel-caption">

                            </div>
                        </div>
                        <div class="item">
                            <img src="../image/01.jpg" alt="...">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                        <div class="item">
                            <img src="../image/01.jpg" alt="...">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

            </div>
            <div class="col-md-5">
                  <<img src="../image/02.png" alt="" style="height: 330px">>
            </div>
        </div>
        <div class="row">
            <div class="col-md-9">
                <ul class="list-group" >
                    <li class="list-group-item">
                        <a class="btn btn-success" href="../blog/new?num=0" role="button">最新博客</a>
                        <a class="btn btn-info" href="../blog/new?num=1" role="button">最热博客</a>
                    </li>
                    <c:forEach items="${list}" var="one">
                        <li class="list-group-item">
                            <div id="rid" style="display:none">${one.readnum}</div>
                            <div id="did">
                                <a href="../blog/one?id=${one.id}" onclick="readsend()" style="font-family:微软雅黑;
                                            font-weight: bold;
                                            text-decoration: none;
                                            font-size: 20px">${one.title}</a><br />
                                <span style="
                                display: -webkit-box;
                                        -webkit-box-orient: vertical;
                                        -webkit-line-clamp: 3;
                                        overflow: hidden;">摘要: ${one.content}...</span>
                                <span style="display: block;
                                            font-family: Verdana, Arial, Helvetica, sans-serif;
                                            line-height: 18px;
                                            margin-top: 5px;
                                            margin-left: 535px;
                                            font-size: 12px;">发表于${one.rtime} · 阅读 ${one.readnum} · 评论 ${one.comment}</span>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <%--分页--%>
                <nav aria-label="..." style="text-align: center;">
                    <ul class="pagination">
                        <li class="enabled">
                            <a href="../blog/new?pageNo=1" style=" text-decoration: none;"><span aria-hidden="true">首页</span></a>
                        </li>
                        <c:if test="${pageNo!=1}">
                            <li class="enabled">
                                <a href="../blog/new?pageNo=${pageNo-1}" style=" text-decoration: none;"><span aria-hidden="true">上一页</span></a>
                            </li>
                        </c:if>
                        <c:if test="${pageNo<=1}">
                            <li class="disabled">
                                <a href=""><span aria-hidden="true">上一页</span></a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${pagenum}" var="obj">
                            <li class="">
                                <a href="../blog/new?pageNo=${obj}" style="text-decoration: none;"><span>${obj}</span></a>
                            </li>
                        </c:forEach>
                        <c:if test="${pageNo!=2}">
                            <li class="enabled">
                                <a href="../blog/new?pageNo=${pageNo+1}" style=" text-decoration: none;"><span aria-hidden="true">下一页</span></a>
                            </li>
                        </c:if>
                        <c:if test="${pageNo>=2}">
                            <li class="disabled">
                                <a href="" ><span aria-hidden="true">下一页</span></a>
                            </li>
                        </c:if>
                        <li class="enabled">
                            <a href="../blog/new?pageNo=${pagenum}" style=" text-decoration: none;"><span aria-hidden="true">尾页</span></a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-3">
                <%--引入body.jsp页面--%>
                <%@include file="body.jsp" %>
            </div>
        </div>
    </div>

</body>
</html>
