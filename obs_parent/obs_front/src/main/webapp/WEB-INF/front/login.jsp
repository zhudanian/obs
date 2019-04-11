<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>在线购物商城</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/iconfont/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/msg.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/zshop.js"></script>
</head>

<body>
<div class="container">
    <div class="row" style="margin-top: 30px">
        <div class="col-lg-8">
            <img class="img-responsive center-block" src="${pageContext.request.contextPath}/images/33.jpg">
        </div>
        <div class="col-lg-4">
            <div class="col-lg-offset-1" style="margin-top: 100px">
                <!-- 用户名密码登陆 start -->
                <div id="login-account">
                    <div>
                        <h4 class="modal-title">用户名密码登录</h4>
                    </div>
                    <form action="${pageContext.request.contextPath}/front/customer/login" class="form-horizontal"
                          method="post">
                        <div class="body" style="text-align: center;margin-top: 30px">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户名：</label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" placeholder="请输入用户名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="password" placeholder="请输入密码">
                                </div>
                            </div>
                        </div>
                        <div class="footer" style="text-align: center;margin-top: 30px">
                            <div class="row">
                                <button class="btn btn-warning"
                                        href="${pageContext.request.contextPath}/front/customer/register">
                                    注&nbsp;&nbsp;册
                                </button>
                                <button type="submit" class="btn btn-warning" style="margin-left: 20px">登&nbsp;&nbsp;陆
                                </button> &nbsp;&nbsp;
                            </div>
                            <div class="row" style="margin-top: 20px">
                                <a class="btn-link">忘记密码？请联系管理员</a>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 用户名密码登陆 end -->
            </div>
        </div>
    </div>
</div>

</body>
</html>
