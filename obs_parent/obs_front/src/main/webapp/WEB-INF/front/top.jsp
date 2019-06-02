<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
$('#nav').find('li').click(function () {
    // 为当前点击的导航加上高亮，其余的移除高亮
    $(this).addClass('active').siblings('li').removeClass('active');
});
</script>
<!-- 头部公共模块 start -->
<header class="container-fluid">
    <!-- header-top-area-start -->
    <div class="row">
        <div class="col-lg-offset-9 col-lg-3" style="height:50px;text-align: center">
            <ul class="nav navbar-nav">

                <c:if test="${not empty customer}">
                    <li><a>${customer.customerName} 欢迎来到网上书城 !</a></li>
                    <li><a href="${pageContext.request.contextPath}/front/customer/toMyCenter">
                        个人中心</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/front/customer/logout">注销</a></li>
                </c:if>
                <c:if test="${empty customer}">
                    <li><a href="${pageContext.request.contextPath}/front/customer/toLogin">登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/front/customer/toRegister">注册</a></li>
                </c:if>

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
            <%--<div class="search-form">--%>
            <%--<form id="queryByInputForm"--%>
            <%--action="${pageContext.request.contextPath}/front/bookstore/queryByInput" method="post">--%>
            <%--<input type="text" placeholder="请输入的书名或书籍类型"/>--%>
            <%--<a id="queryByInput"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>--%>
            <%--</form>--%>
            <%--</div>--%>
        </div>

        <div class="col-lg-1 col-lg-offset-2">
            <img class="cart" src="${pageContext.request.contextPath}/images/cart.png" alt="购物车" href="myCart.jsp">
        </div>
    </div>
    <!-- navbar start -->
    <nav class="navbar navbar-default header-navbar">
        <div class="container">
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav" id="nav">
                    <li role="presentation"><a
                            href="${pageContext.request.contextPath}/front/bookstore/showBookstore">
                        商城主页</a></li>
                    <li role="presentation"><a
                            href="${pageContext.request.contextPath}/front/cart/queryMyCart">
                        我的购物车</a></li>
                    <li role="presentation"><a
                            href="${pageContext.request.contextPath}/front/order/queryMyOrder">
                        我的订单</a></li>
                </ul>

            </div>
        </div>
    </nav>
    <!-- navbar end -->
</header>
<!-- 头部公共模块 end-->