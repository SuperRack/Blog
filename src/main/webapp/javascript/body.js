window.onload = function () {

    //获取图片
    var img1 = document.getElementById("img1");
    var img2 = document.getElementById("img2");
    var img3 = document.getElementById("img3");
    //鼠标经过图片
    img1.onmouseover = function () {
        this.src = "../image/sina.png"
    }
    img2.onmouseover = function () {
        this.src = "../image/wechat.png"
    }
    img3.onmouseover = function () {
        this.src = "../image/mail.png"
    }
    //鼠标离开图片
    img1.onmouseout = function () {
        this.src = "../image/_sina.png";
    }
    img2.onmouseout = function () {
        this.src = "../image/_wechat.png";
    }
    img3.onmouseout = function () {
        this.src = "../image/_mail.png";
    }




}
