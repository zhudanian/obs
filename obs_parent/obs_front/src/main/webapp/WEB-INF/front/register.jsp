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
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/obs.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css"/>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>

    <script>
        $(function () {
            //添加用户表单的客户端校验
            $('#registerCustomerForm').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'

                },
                fields: {
                    customerName: {
                        validators: {
                            notEmpty: {
                                message: '登录账号不能为空'
                            },
                            remote: {
                                //ajax后端校验该登录账号是否已经存在
                                url: '${pageContext.request.contextPath}/front/customer/checkCustomerName'
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
                    rePassword: {
                        validators: {
                            notEmpty: {
                                message: '确认密码不能为空'
                            },
                            identical: {
                                field: 'customerPassword',
                                message: '两次密码不一致'
                            }
                        }
                    },
                    customerPhone: {
                        validators: {
                            notEmpty: {
                                message: '电话号码不能为空'
                            },
                            regexp: {
                                regexp: /^1\d{10}$/,
                                message: '手机号格式错误'
                            }
                        }
                    },
                    customerAddress: {
                        validators: {
                            notEmpty: {
                                message: '地址不能为空'
                            }
                        }
                    }
                }

            });

            //服务端校验
            var errorMsg = '${errorMessage}';
            if (errorMsg != '') {
                layer.msg(errorMsg, {
                    time: 2000,
                    skin: 'errorMsg'
                });
            }
        })
    </script>

</head>

<body>
<jsp:include page="top.jsp"/>
<div class="container" style="margin-top: 50px">
    <div class="col-lg-6 col-lg-offset-3">
        <div style="border: #2E2D3C 1px solid;border-radius: 20px">
            <div class="modal-header">
                <h4 class="modal-title">会员注册</h4>
            </div>
            <form action="${pageContext.request.contextPath}/front/customer/register" class="form-horizontal"
                  id="registerCustomerForm" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">登陆账号:</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" name="customerName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">登录密码:</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="password" name="customerPassword">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">确认登录密码:</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="password" name="rePassword">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">联系电话:</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" name="customerPhone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">联系地址:</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" name="customerAddress">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-warning">重&nbsp;&nbsp;置</button>
                    <input class="btn btn-primary" type="submit" value="注&nbsp;&nbsp;册"/>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal-dialog" role="document">

</div>
</body>
</html>
