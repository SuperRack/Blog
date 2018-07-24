<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: 李京松
  Date: 2018/5/24
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../javascript/style.js"></script>
<body style="padding-top: 10px;
    padding-bottom: 40px;
    background-color: #efefef;">
<div class="container">
    <%--引入头文件--%>
   <%@include file="head.jsp" %>
    <div class="row">
        <div class="col-md-9">
            <ul class="list-group">
                <li class="list-group-item" style="margin-bottom: 15px">
                <div style="padding-top: 12px;padding-left: 10px">
                <img src="../image/blog_show_icon.png" alt="">
                <span style="font-family:微软雅黑;color: #333;
                                        font-weight: bold;
                                        text-decoration: none;
                                        display: inline;
                                        font-size: 16px">博客信息</span>
                </div>
                <hr />
                <div style="display:none;" id="blogid">${blog.id}</div>
                <div style="    margin-top: 20px;
                                text-align: center;">
                    <h3 style="    font-size: 24px;">
                        <strong style="font-weight: 700;" id="title">${blog.title}</strong>
                    </h3>
                </div>
                <div style="    padding-left: 330px;
                        padding-bottom: 20px;
                        padding-top: 10px;">
                </div>
                <div style="text-align: center;">
                    编辑: ${blog.edit}&nbsp;&nbsp; 发布时间:『${blog.rtime}』&nbsp;&nbsp; 博客类别: ${blog.category} &nbsp;&nbsp; 阅读(${blog.readnum}) &nbsp;&nbsp;评论(${blog.comment})
                </div>
                <div style="height: 1120px">
                    ${blog.content}
                    <div>
                        ${blog.keyword}
                    </div>
                </div>
                <div style="    border-top: 1px dotted black;
                    padding: 10px;">
                    <c:if test="${title1 !=null}">
                    <p>上一篇 :<a href="../blog/one?id=${blog.id-1}" style="color: #337ab7;
                        text-decoration: none;"> ${title1}</a></p>
                    </c:if>
                    <c:if test="${title1 ==null}">
                        <p>上一篇 : 没有了</p>
                    </c:if>
                    <c:if test="${title2 !=null}">
                    <p>下一篇 :<a href="../blog/one?id=${blog.id+1}" style="color: #337ab7;
                        text-decoration: none;"> ${title2}</a></p>
                    </c:if>
                    <c:if test="${title2 ==null}">
                        <p>下一篇 :没有了</p>
                    </c:if>
                </div>
                </li>
                <li class="list-group-item" style="margin-bottom: 15px">
                    <div>
                        <img src="../image/comment_icon.png" alt="">
                        <p style="font-family:微软雅黑;color: #333;
                                        font-weight: bold;
                                        text-decoration: none;
                                        display: inline;
                                        font-size: 16px">评论信息</p>
                        <hr style="
                            margin-bottom: 12px;
                            margin-top: 12px;
                                                    "/>
                        <div style="padding: 1px 10px 10px 10px;">
                            <c:if test="${comments !=null}">
                                <c:forEach items="${comments}" var="com">
                                <div style="
                                        margin-bottom: 5px;
                                        padding-bottom: 15px;
                                        border-bottom: 1px dotted gray;">
                                    <p>
                                        <strong style="color: #8C92A4;font-family: RogueDesign;
                                        font-size: 16px; text-align: center;">游客&nbsp;${com.name}</strong>
                                        &nbsp;&nbsp;
                                        <span style=" font-size: 13px;
                                        color: #8C92A4;
                                        cursor: pointer;">${com.date}</span>
                                    </p>
                                    <span style="margin-right: 10px;">${com.content}</span>
                                </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty comments}">
                                    <div style="
                                        margin-bottom: 5px;
                                        padding-bottom: 15px;
                                        border-bottom: 1px dotted gray;">
                                        <span style="margin-right: 10px;">暂无评论</span>
                                    </div>
                            </c:if>
                        </div>
                    </div>
                </li>
                <li class="list-group-item" style="margin-bottom: 15px">
                    <div>
                        <img src="../image/publish_comment_icon.png" alt="">
                        <p style="font-family:微软雅黑;color: #333;
                                        font-weight: bold;
                                        text-decoration: none;
                                        display: inline;
                                        font-size: 16px">发表评论</p>
                        <hr style="
                            margin-bottom: 12px;
                            margin-top: 12px;
                                                    "/>
                        <div>
                            <div style="text-align: left;
                                    padding-left: 10px;
                                    margin-bottom: 10px;
                                    font-size: 16px;">
                                如何称呼您:
                                <input type="text" size="10" id="name" placeholder="名称必填..." style="
                                            border: 1px solid #aaa;
                                                border-radius: 5px;
                                                padding-left: 10px;
                                                height: 33px;"/>
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                您的邮箱:
                                <input type="text" size="10" id="mail" placeholder="邮箱..." style="
                                            border: 1px solid #aaa;
                                                border-radius: 5px;
                                                padding-left: 10px;
                                                height: 33px;"/>
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                验证码:
                                <input type="text" size="5" id="kap" style="
                                            border: 1px solid #aaa;
                                                border-radius: 5px;
                                                padding-left: 10px;
                                                height: 33px;"/>&nbsp;
                                <img src="../Kaptcha.jpg" id="Kaptcha" alt="验证码" onclick="change()"/>

                            </div>
                            <div class="comment_area" style="display: block;">
                                <textarea placeholder="来说两句呗...（文明评论，拒绝低俗！）" id="areas" rows="3"
                                style="margin-left: 9px;
                                    margin-right: 10px;
                                    border-radius: 5px;
                                    padding: 10px;
                                    width: 97.5%;
                                    height: 100px;"></textarea>
                            </div>
                            <div style="   padding-top: 10px;
                                        margin-left: 720px;
                                        margin-right: 10px;">
                                <button class="btn btn-primary" type="button" onclick="send()">发表评论</button>
                            </div>
                        </div>
                    </div>
                </li>
                <div style="padding-top: 120px">
                    <span>
			                 Copyright © 2018-2020 ·MyBlog·
		            </span>
                </div>
            </ul>
        </div>
        <div class="col-md-3">
            <%--引入body.jsp页面--%>
            <%@include file="body.jsp" %>
        </div>
    </div>
</div>

</body>
</html>
