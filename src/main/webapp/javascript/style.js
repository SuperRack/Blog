function change() {
    var time=new Date().getTime();
    //为了不让验证码缓存，为了安全起见，需要次次都刷新
    document.getElementById("Kaptcha").src="../Kaptcha?d="+time;
}

var urldate="../blog/com";

function send(){
    var blogid=$("#blogid").text();
    var name=$("#name").val();
    var mail=$("#mail").val();
    var kaptcha=$("#kap").val();
    var areas=$("#areas").val();
    $.ajax({
        url:urldate,
        type: 'POST',
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data:{
        'blogid':blogid,'name':name, 'mail':mail,
          'kaptcha':kaptcha,'areas':areas
        },
        success:function(msg){
              if (msg){
                  alert(msg)
              }
            window.location.reload();
        },
    })

};
