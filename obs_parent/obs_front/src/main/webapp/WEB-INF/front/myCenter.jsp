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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/iconfont/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/msg.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
   <%-- <script src="${pageContext.request.contextPath}/js/obs.js"></script>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.css"/>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>

    <script>
        $(function () {
            //修改用户表单的客户端校验
            $('#modifyBaseInfoForm').bootstrapValidator({
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

            //修改用户表单的客户端校验
            $('#addAddressForm').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'

                },
                fields: {
                    contactName: {
                        validators: {
                            notEmpty: {
                                message: '收货人不能为空'
                            }
                        }
                    },
                    contactPhone: {
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
                    contactAddress: {
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
        });

        function showModifyPasswordModal() {
            $('#modifyPasswordModal').modal('show');
        }

        function showModifyCustomerBaseInfo() {
            $('#modifyCustomerBaseInfo').modal('show');
        }

        //修改客户信息
        function modifyBaseInfo() {
            var bv = $('#modifyBaseInfoForm').data('bootstrapValidator');
            bv.validate();
            if (bv.isValid()) {
                $.post(
                    '${pageContext.request.contextPath}/front/customer/modifyBaseInfo',
                    {
                        'customerName': $('#customerName_m').val(),
                        'customerPhone': $('#customerPhone_m').val(),
                        'customerAddress': $('#customerAddress_m').val()
                    },
                    function (responseResult) {
                        // alert(responseResult.status);
                        if (responseResult.status == 1) {

                            //使用layer.js弹出一个弹出框
                            layer.msg(
                                responseResult.message,
                                {
                                    time: 2000,//2秒钟后隐藏弹出框
                                    skin: 'successMsg'//设置弹出框的样式
                                },
                                function () {
                                    alert(1);
                                }
                            );
                        } else {
                            layer.msg(responseResult.message, {
                                time: 2000,//2秒钟后隐藏弹出框
                                skin: 'errorMsg'//设置弹出框的样式
                            });
                        }
                    });
            }

        }


    </script>
</head>
<body>
<jsp:include page="top.jsp"/>
<!-- content start -->

<div class="container">
    <div class="col-lg-2">
        <ul style="list-style: none;">
            <li onclick="showModifyPasswordModal()" style="cursor: pointer;padding: 20px;font-size: large">
                修改密码
            </li>
            <li onclick="showModifyCustomerBaseInfo()" style="cursor: pointer;padding: 20px;font-size: large">
                修改资料
            </li>
            <li style="cursor: pointer;padding: 20px;font-size: large">
                充值会员
            </li>
        </ul>
    </div>
    <div class="col-lg-8">
        <div class="container">
            <div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-header" style="margin-bottom: 0px;">
                            <h3>基本资料</h3>
                        </div>
                    </div>
                </div>

                <form class="form-horizontal" style="margin-top: 20px">
                    <div class="form-group">
                        <label class="col-md-2  col-sm-2 control-label">用户姓名:</label>
                        <div class="col-md-4 col-sm-10">
                            <label type="text" class="form-control" readonly="readonly">${customer.customerName}</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-2  col-sm-2 control-label">联系电话:</label>
                        <div class="col-md-4 col-sm-10">
                            <label type="text" class="form-control"
                                   readonly="readonly">${customer.customerPhone}</label>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-md-2   col-sm-2  control-label">联系地址:</label>
                        <div class="col-md-4 col-sm-10">
                            <label type="text" class="form-control"
                                   readonly="readonly">${customer.customerAddress}</label>
                        </div>
                    </div>
                </form>
            </div>
            <div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-header" style="margin-bottom: 10px;">
                            <h3>收货地址</h3>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" data-toggle="modal" data-target="#addAddressModal">新增收获地址</button>
                <table class="table table-striped table-bordered table-hover" style="margin-top: 10px;text-align: center">
                    <thead>
                    <tr>
                        <td> 收货人</td>
                        <td>联系电话</td>
                        <td>收货地址</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${contactList}" var="contact">
                        <tr>
                            <td>${contact.contactName}</td>
                            <td>${contact.contactPhone}</td>
                            <td>${contact.contactAddress}</td>
                            <td>
                                <button class="btn btn-primary" onclick="modifyContact()">修改</button>
                                <button class="btn btn-warning" onclick="deleteContact()">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>

<!-- content end-->

<jsp:include page="bottom.jsp"/>
</body>
<!-- 修改密码模态框 start -->
<div class="modal fade" id="modifyPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <form action="" class="form-horizontal" method="post" id="modifyPasswordForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">原密码：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">新密码：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">重复密码：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="password">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal" aria-label="Close">
                        关&nbsp;&nbsp;闭
                    </button>
                    <button type="reset" class="btn btn-warning">重&nbsp;&nbsp;置</button>
                    <button type="submit" class="btn btn-warning">修&nbsp;&nbsp;改</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 修改密码模态框 end -->

<!-- 修改基本资料模态框 start-->
<div class="modal fade" id="modifyCustomerBaseInfo" tabindex="-1">
    <div class="modal-dialog">
        <form id="modifyBaseInfoForm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">修改资料</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="customerName_m" class="col-sm-4 col-sm-offset-2 control-label">
                            用户姓名:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="customerName_m"
                                   name="customerName"
                                   value="${customer.customerName}">
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label for="customerPhone_m" class="col-sm-4 col-sm-offset-2 control-label">
                            联系电话:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="customerPhone_m"
                                   name="customerPhone"
                                   value="${customer.customerPhone}">
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label for="customerAddress_m" class="col-sm-4 col-sm-offset-2 control-label">
                            联系地址:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="customerAddress_m"
                                   name="customerAddress"
                                   value="${customer.customerAddress}">
                        </div>
                    </div>
                    <br>
                    <br>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-warning updateProType" onclick="modifyBaseInfo()">修改</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>


            </div>
        </form>
    </div>
</div>
<!-- 修改基本资料模态框 end-->

<!-- 新增地址模态框 start-->
<div class="modal fade" id="addAddressModal" tabindex="-1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增收获地址</h4>
            </div>
            <form action="${pageContext.request.contextPath}/customer/addAddress" class="form-horizontal" method="post" id="addAddressForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">联系人：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="text" name="contactName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">电话：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="text" name="contactPhone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">收货地址：</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="text" name="contactAddress">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal" aria-label="Close">
                        关&nbsp;&nbsp;闭
                    </button>
                    <button type="reset" class="btn btn-warning">重&nbsp;&nbsp;置</button>
                    <button type="submit" class="btn btn-warning">添&nbsp;&nbsp;加</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 新增地址模态框 end-->

<!-- 修改地址模态框 start-->
<!-- 修改地址模态框 end-->
</html>