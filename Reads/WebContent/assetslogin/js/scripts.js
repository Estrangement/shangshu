
jQuery(document).ready(function() {

    /*
        Background slideshow
    */
    $.backstretch([
      "assets/img/backgrounds/1.jpg"
    , "assets/img/backgrounds/2.jpg"
    , "assets/img/backgrounds/3.jpg"
    ], {duration: 3000, fade: 750});

    /*
        Tooltips
    */
    $('.links a.home').tooltip();
    $('.links a.blog').tooltip();

    /*
        Form validation
    */
    $('.register form').submit(function(){
        $(this).find("label[for='username']").html('用户名');
        $(this).find("label[for='pwd']").html('密码');
        ////
        var username = $(this).find('input#username').val();
        var pwd = $(this).find('input#pwd').val();
        
        if(username == '') {
            $(this).find("label[for='username']").append("<span style='display:none' class='red'> - 请输入用户名.</span>");
            $(this).find("label[for='username'] span").fadeIn('medium');
            return false;
        }
        if(pwd == '') {
            $(this).find("label[for='pwd']").append("<span style='display:none' class='red'> - 请输入正确的密码.</span>");
            $(this).find("label[for='pwd'] span").fadeIn('medium');
            return false;
        }
    });


});


