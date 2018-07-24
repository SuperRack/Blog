<%--
  Created by IntelliJ IDEA.
  User: 李京松
  Date: 2018/5/30
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../javascript/body.js"></script>
    <script>
        function shareTo(stype){

            var ftit = '';
            var flink = '';
            var lk = '';
            //获取文章标题
            ftit =$("#title").text();
            if(typeof flink == 'undefined'){
                flink='';
            }
            //当内容中没有图片时，设置分享图片为网站logo
            if(flink == ''){
                lk = 'http://'+window.location.host+'/Test/image/face.jpg';
            }
            //如果是上传的图片则进行绝对路径拼接
            if(flink.indexOf('/uploads/') != -1) {
                lk = 'http://'+window.location.host+flink;
            }
            //百度编辑器自带图片获取
            if(flink.indexOf('ueditor') != -1){
                lk = flink;
            }
            //url=https%3A%2F%2Fblog.csdn.net%2Fqq_18661793%2Farticle%2Fdetails%2F51860717%230-qzone-1-83503-d020d2d2a4e8d1a374a433f596ad1440&title=SSM%28二%29Lucene全文检索%20-%20CSDN博客&desc=&summary=&site=
            //qq空间接口的传参
            if(stype=='qzone'){
                window.open('https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+document.location.href+'&title='+ftit+'&pic='+lk);
            }
            //新浪微博接口的传参
            if(stype=='sina'){
                window.open('http://service.weibo.com/share/share.php?url='+document.location.href+'?sharesource=weibo&title='+ftit+'&pic='+lk+'&appkey=2706825840');
            }
            //qq好友接口的传参
            if(stype == 'qq'){
                window.open('http://connect.qq.com/widget/shareqq/index.html');
            }
            //生成二维码给微信扫描分享
            if(stype == 'wechat'){

            }
        }
    </script>
</head>
<body>
<ul class="list-group">
    <li class="list-group-item" style="margin-bottom: 15px">
        <div style="height: 400px;">
            <img src="../image/icon.png" alt="">
            <p style="font-family:微软雅黑;color: #333;
                                        font-weight: bold;
                                        text-decoration: none;
                                        display: inline;
                                        font-size: 16px">博主信息</p>
            <hr />
            <%--头像框--%>
            <div style="width: 240px;height: 150px;">
                <a href="http://www.tuling123.com/static/talk/?a=256028%2FigLf&u=E6493BE2F51333AE" target="_blank"
                   style=" text-decoration: none;
                    cursor: pointer;">
                <img src="../image/face.jpg" style="
                                        margin-left: 48px;
                                        width: 125px;
                                        height: 125px;
                                        border-radius: 125px;
                                        overflow: hidden;"
                >
                </a>
            </div>
            <div style="    text-align: center;
                                font-family: RogueDesign;
                                font-size: 16px;
                                margin-bottom: 10px;">
                adminhome
            </div>
            <div style="text-indent: 2em;
                                text-align: left;
                                margin: 5px 15px 10px 15px;">
                梦想也许难以实现，但梦想还是要有的，万一实现了呢！
            </div>
            <div style="font-size: 15px;
                                font-weight: bold;
                                border-bottom: 1px solid #E5E5E5;
                                padding-bottom: 10px;
                                padding-top: 5px;">
                <img src="../image/heart.png" alt="">
                关注我
            </div>
            <div>
                <a href="#" target="_blank">
                    <img id="img1" src="../image/_sina.png" style="margin-top: 10px;margin-left: 20px;" />
                </a>
                <a href="#" target="_blank">
                    <img id="img2" src="../image/_wechat.png" style="margin-top: 10px;margin-left: 20px;" />
                </a>
                <a href="#" target="_blank">
                    <img id="img3" src="../image/_mail.png" style="margin-top: 10px;margin-left: 20px;" />
                </a>
            </div>
        </div>
    </li>
    <li class="list-group-item" style="margin-bottom: 15px">
        <div>
            <img src="../image/byType_icon.png" alt="" />
            <p style="font-family:微软雅黑;color: #333;
                                        font-weight: bold;
                                        text-decoration: none;
                                        display: inline;
                                        font-size: 16px">按日志类别</p>
            <hr style="
                            margin-bottom: 12px;
                            margin-top: 12px;
                                                    "/>
            <div>
                <ul style="    list-style-type: none;
                                        padding-left: 15px;">
                   <c:forEach items="${stringlist}" var="list">
                    <li style="    margin-top: 10px;">
                          <span><a href="#" style="color: #337ab7;
                                        text-decoration: none;">${list}</a></span>
                    </li>
                   </c:forEach>
                </ul>
            </div>
        </div>
    </li>
    <li class="list-group-item" style="margin-bottom: 15px">
        <div>
            <img src="../image/byDate_icon.png" alt="">
            <p style="font-family:微软雅黑;color: #333;
                                        font-weight: bold;
                                        text-decoration: none;
                                        display: inline;
                                        font-size: 16px">按日志日期</p>
            <hr style="
                            margin-bottom: 12px;
                            margin-top: 12px;"/>
            <div>
                <ul style=" list-style-type: none;
                                        padding-left: 15px;">
                    <c:forEach items="${rlist}" var="rtime">
                    <li style="    margin-top: 10px;">
                         <span><a href="#" style="color: #337ab7;
                                        text-decoration: none;">${rtime}</a></span>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </li>
    <li class="list-group-item" style="margin-bottom: 15px">
        <div>
            <img src="../image/link_icon.png" alt="">
            <p style="font-family:微软雅黑;color: #333;
                                        font-weight: bold;
                                        text-decoration: none;
                                        display: inline;
                                        font-size: 16px">友情链接</p>
            <hr />
          <div>
            <div class="fl">分享到：</div>
            <div onclick="shareTo('qzone')" style="display: inline-block">
                <img src="http://zixuephp.net/static/images/qqzoneshare.png" width="30">
            </div>
            <div onclick="shareTo('qq')"  style="display: inline-block">
                <img src="http://zixuephp.net/static/images/qqshare.png" width="32">
            </div>
            <div onclick="shareTo('sina')" style="display: inline-block">
                <img src="http://zixuephp.net/static/images/sinaweiboshare.png" width="36">
            </div>
            <div onclick="shareTo('wechat')" style="display: inline-block">
                <img src="http://zixuephp.net/static/images/wechatshare.png" width="32">
            </div>
        </div>
        </div>
    </li>
    <li class="list-group-item" style="margin-bottom: 15px">
        <div>
            <img src="../image/dollars.png" alt="">
            <p style="font-family:微软雅黑;color: #333;
                                        font-weight: bold;
                                        text-decoration: none;
                                        display: inline;
                                        font-size: 16px">慷慨解囊</p>
            <hr style="
                            margin-bottom: 12px;
                            margin-top: 12px;"/>
        </div>

            <label>所选金额(元):</label>
            <div>
                <input type="text" size="10" placeholder="请输入金额!" style="
                                            border: 1px solid #aaa;
                                                border-radius: 5px;
                                                padding-left: 10px;
                                                height: 33px;">
            <button class="btn btn-info">确定</button>
            </div>
    </li>
</ul>
</body>
</html>
