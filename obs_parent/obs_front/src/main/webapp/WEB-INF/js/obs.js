$(function(){
    //用户名密码登陆和短信登陆的切换
    $('#btn-sms-back').click(function(){
        $('#login-account').css('display','none');
        $('#login-sms').css('display','block');
    });
    $('#btn-account-back').click(function(){
        $('#login-sms').css('display','none');
        $('#login-account').css('display','block');
    });
    
});
function jsonDateFormat(jsonDate) {//json日期格式转换为正常格式
    try {
        var date = new Date(parseInt(jsonDate));
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        console.log(date.getFullYear() + "年" + month + "月" + day+"日");
        return date.getFullYear() + "年" + month + "月" + day+"日";
    } catch (ex) {
        return "";
    }
}