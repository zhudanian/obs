<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>front</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>

    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css"/>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>
    <script type="text/javascript">
        $(function () {
            // 点击切换页面
            $("#home").click(function () {
                $("#frame").attr("src", "${pageContext.request.contextPath}/front/bookstore/showBookstore");
            });
            $("#cart，#myCart").click(function () {
                $("#frame").attr("src", "${pageContext.request.contextPath}/front/cart/queryMyCart");
            });
            $("#order").click(function () {
                $("#frame").attr("src", "${pageContext.request.contextPath}/front/order/queryMyOrder");
            });
            $("#myCenter").click(function () {
                $("#frame").attr("src", "${pageContext.request.contextPath}/front/customer/myCenter");
            });
        });

        $(function () {
            $("#queryByInput").click(function () {
                $("#queryByInputForm").submit();
            });
        });


    </script>
</head>

<body>
<div>
    <!-- 头部公共模块 start -->
    <header class="container-fluid">
        <!-- header-top-area-start -->
        <div class="row">
            <div class="col-lg-offset-9 col-lg-3">
                <ul class="nav navbar-nav">
                    <li><a id="myCenter">我的账户</a></li>
                    <li><a href="${pageContext.request.contextPath}/front/customer/logout">注销</a></li>
                    <li><a href="${pageContext.request.contextPath}/front/customer/login">登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/front/customer/register">注册</a></li>
                </ul>
            </div>
        </div>
        <!-- header-top-area-end -->
        <div class="row">
            <div class="col-lg-1 col-lg-offset-1">
                <div>
                    <img class="logo" src="${pageContext.request.contextPath}/images/bookstore_logo.png"
                         alt="logo">
                </div>
            </div>
            <div class="col-lg-2 col-lg-offset-3">
                <div class="search-form">
                    <form id="queryByInputForm"
                          action="${pageContext.request.contextPath}/front/bookstore/queryByInput" method="post">
                        <input type="text" placeholder="请输入的书名或书籍类型"/>
                        <a id="queryByInput"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>
                    </form>
                </div>
            </div>

            <div class="col-lg-1 col-lg-offset-2">
                <img class="cart" src="${pageContext.request.contextPath}/images/cart.png" alt="购物车">
            </div>
        </div>
        <!-- navbar start -->
        <nav class="navbar navbar-default header-navbar">
            <div class="container">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li role="presentation" class="active"><a id="home">商城主页</a></li>
                        <li role="presentation"><a id="cart">我的购物车</a></li>
                        <li role="presentation"><a id="order">我的订单</a></li>
                    </ul>

                </div>
            </div>
        </nav>
        <!-- navbar end -->
    </header>
    <!-- 头部公共模块 end-->

    <!-- 主体模块 end-->
    <div class="container" style="height: 60%;width: auto;">
        <iframe id="frame" src="${pageContext.request.contextPath}/front/bookstore/showBookstore" width="100%"
                height="3000px" frameborder="0" scrolling="no">
        </iframe>
    </div>
    <!-- 主体模块 end-->

    <!-- footers start -->
    <div class="footers" style="height: 10%;width: 100%;margin-top: 1%" id="ccc">
        版权所有：子平
    </div>
    <!-- footers end -->

</div>
<!-- content end-->


<!-- 修改密码模态框 start -->
<div class="modal fade" id="modifyPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <form action="" class="form-horizontal" method="post">
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

</body>

</html>