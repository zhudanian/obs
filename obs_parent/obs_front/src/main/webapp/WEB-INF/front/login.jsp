<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>网上书城</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/iconfont/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/msg.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/obs.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css"/>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css">

    <script>
        $(function () {
            $('#customerLoginForm').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'

                },
                fields: {
                    customerName: {
                        validators: {
                            notEmpty: {
                                message: '登录名不能为空'
                            }
                        }
                    },
                    customerPassword: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            }
                        }
                    },
                    code: {
                        validators: {
                            notEmpty: {
                                message: '请输入验证码'
                            },
                            remote: {
                                url: '${pageContext.request.contextPath}/front/code/checkName',
                                message: '验证码错误'
                            }
                        }
                    }

                }
            });
            //服务端校验
            var successMessage = '${successMessage}';
            if (successMessage != '') {
                layer.msg(successMessage, {
                    time: 2000,
                    skin: 'successMsg'
                });
            }
            //服务端校验
            var errorMsg = '${errorMsg}';
            if (errorMsg != '') {
                layer.msg(errorMsg, {
                    time: 2000,
                    skin: 'errorMsg'
                });
            }

        });

        function reloadImage() {
            $('#codeImg').attr('src', '${pageContext.request.contextPath}/front/code/image?time=' + new Date().getTime());
            //将原来的验证码清空
            $('#code').val('');

        }
    </script>

</head>

<body>
<jsp:include page="top.jsp"/>
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
                    <form id="customerLoginForm" action="${pageContext.request.contextPath}/front/customer/login"
                          class="form-horizontal" method="post">
                        <div class="body" style="text-align: center;margin-top: 30px">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户名：</label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" placeholder="请输入用户名" name="customerName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="password" placeholder="请输入密码"
                                           name="customerPassword">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">验证码：</label>
                                <div class="col-sm-4">
                                    <input class="form-control" type="text" id="code" name="code" placeholder="验证码">
                                </div>
                                <div class="col-sm-2">
                                    <!-- 验证码 -->
                                    <img class="img-rounded" id="codeImg"
                                         src="${pageContext.request.contextPath}/front/code/image"
                                         style="height: 32px; width: 70px;"/>
                                </div>
                                <div class="col-sm-2">
                                    <button type="button" class="btn btn-link" onclick="reloadImage()">看不清</button>
                                </div>
                            </div>
                        </div>
                        <div  style="text-align: center;margin-top: 30px">
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
