var time
var my_Interval
$(function () {
    $("#username").focus()
    $("#getMailCode").click(function () {
       click_operate()
    })
    msg = $(".no_use_msg").text();
    if(msg != ""){
        zlalert.alertError('动态码错误！')
    }
})

function getValidete() {

     if(time == 0){
         $("#getMailCode").html('<a href="#">点击获取验证码</a>')
         clearInterval(my_Interval)
          $("#getMailCode").bind('click',function () {
              click_operate()
          })
        }
    else{
        $("#getMailCode").html("<font color='red'>"+time+"</font>"+"秒后可重发")
        time--
    }
}

function click_operate() {
    var email = $("#email").val();
    var regex = /^[a-zA-Z0-9]{5,15}$/;
    var suffix = "@tongji.edu.cn";

    if (regex.test(email)) {
        var fullEmail = email.trim() + suffix;
        zlalert.alertInfo("验证码已发送，可能会有验证，请耐心等待！");

        $.getJSON("/user/sendMail", "email=" + fullEmail, function(result) {
            if (result.status != 200) {
                zlalert.alertInfo(result.msg);
            } else {
                click_css();
            }
        });
    } else {
        $("#email").focus();
        zlalert.alertError('请输入正确的tongji.edu.cn邮箱');
    }
}

function click_css() {

        $("#getMailCode").unbind('click')
        time = 120
        my_Interval = setInterval(getValidete,1000)
}
function checkAll() {
    var i = 0;
    $(".must_input").each(function () {
        if($(this).val().trim() == ""){
            $(this).focus()
            i++;
            return false
        }
    })
    password = $("#password").val();
    repassword = $("#repassword").val();
    if(password != repassword){
        $("#password").val("")
        $("#repassword").val("")
        $("#password").focus()
        $(".password_msg").text("两次密码输入不一致")
        i++;
    }
    if(i != 0){
        return false;
    }
}
function clear_val() {
    $(".password_msg").text('')
}