window.onload = function () {
    var readnum=$("#rid").text();
    var dataurl="../blog/one";
    function readsend() {
        $.get(
            "dataurl",
            {
                readnum:readnum
            }
        );
    }

}




