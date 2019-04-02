
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
        $(this).find("label[for='truename']").html('真实姓名');
        $(this).find("label[for='age']").html('年龄');
        $(this).find("label[for='yans']").html('验证码');
        $(this).find("label[for='tel']").html('电话');
        $(this).find("label[for='username']").html('用户名');
        $(this).find("label[for='pwd']").html('密码');
        $(this).find("label[for='email']").html('邮箱');
        $(this).find("label[for='address']").html('住址');
        ////
        var truename = $(this).find('input#truename').val();
        var age = $(this).find('input#age').val();
        var yans = $(this).find('input#yans').val();
        var tel = $(this).find('input#tel').val();
        var username = $(this).find('input#username').val();
        var pwd = $(this).find('input#pwd').val();
        var email = $(this).find('input#email').val();
        var email = $(this).find('input#address').val();
        if(truename == '') {
            $(this).find("label[for='truename']").append("<span style='display:none' class='red'> - 请输入真实姓名.</span>");
            $(this).find("label[for='truename'] span").fadeIn('medium');
            return false;
        }
        if(age == '') {
            $(this).find("label[for='age']").append("<span style='display:none' class='red'> - 请输入年龄.</span>");
            $(this).find("label[for='age'] span").fadeIn('medium');
            return false;
        }
        if(yans == '') {
            $(this).find("label[for='yans']").append("<span style='display:none' class='red'> - 请输入验证码.</span>");
            $(this).find("label[for='yans'] span").fadeIn('medium');
            return false;
        }
        if(tel == '') {
            $(this).find("label[for='tel']").append("<span style='display:none' class='red'> - 请输入电话.</span>");
            $(this).find("label[for='tel'] span").fadeIn('medium');
            return false;
        }
        if(username == '') {
            $(this).find("label[for='username']").append("<span style='display:none' class='red'> - 请输入用户名.</span>");
            $(this).find("label[for='username'] span").fadeIn('medium');
            return false;
        }
        if(pwd == '') {
            $(this).find("label[for='pwd']").append("<span style='display:none' class='red'> - 请输入规范的密码.</span>");
            $(this).find("label[for='pwd'] span").fadeIn('medium');
            return false;
        }
        if(email == '') {
            $(this).find("label[for='email']").append("<span style='display:none' class='red'> - 请输入规范的邮箱.</span>");
            $(this).find("label[for='email'] span").fadeIn('medium');
            return false;
        }
        if(address == '') {
            $(this).find("label[for='address']").append("<span style='display:none' class='red'> - 请输入住址.</span>");
            $(this).find("label[for='address'] span").fadeIn('medium');
            return false;
        }
    });


});


