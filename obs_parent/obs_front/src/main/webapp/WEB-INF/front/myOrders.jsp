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
    <script src="${pageContext.request.contextPath}/js/obs.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
</head>
<body>

<jsp:include page="top.jsp"/>
<div class="container">
    <!-- content start -->
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="page-header" style="margin-bottom: 0px;">
                    <h3>我的订单</h3>
                </div>
            </div>
        </div>
        <table class="table table-hover orderDetail">
            <c:forEach items="${orderList.list}" var="order">
                <tr>
                    <td colspan="5">
                        <span><b>订单编号：</b>${order.orderId}</span>&nbsp;&nbsp;
                        <span><b>下单时间：</b>${order.confirmDate}</span>&nbsp;&nbsp;
                        <span><b>收货人：</b>${order.contactName}</span>&nbsp;&nbsp;
                        <span><b>电话：</b>${order.contactPhone}</span>&nbsp;&nbsp;
                        <span><b>地址：</b>${order.contactAddress}</span>&nbsp;&nbsp;
                        <span>
                            <c:if test="${order.orderState==0}">待付款</c:if>
                            <c:if test="${order.orderState==1}">未发货</c:if>
                            <c:if test="${order.orderState==2}">已发货</c:if>
                            <c:if test="${order.orderState==3}">已完成</c:if>
                        </span>
                    </td>
                </tr>
                <c:forEach items="${order.orderBookList}" var="orderBook">
                    <tr>
                        <td><img
                                src="${pageContext.request.contextPath}/front/bookstore/showPic?image=${orderBook.book.bookImage}"
                                style="width: 150px;"
                                alt=""></td>
                        <td class="order-content">
                            <p><b>书名：《${orderBook.book.bookName}》</b></p>
                            <p><b>作者： ${orderBook.book.bookAuthor}</b></p>
                        </td>
                        <td>
                            单价：${orderBook.book.bookPrice}
                        </td>
                        <td>
                            数量： ${orderBook.num}
                        </td>
                        <td class="text-color">
                            小计：${orderBook.book.bookPrice*orderBook.num}
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="pull-right">总计:<span class="text-color">￥${order.totalPrice}</span></span>&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </c:forEach>


        </table>
    </div>
    <!-- content end-->
</div>
<jsp:include page="bottom.jsp"/>
</body>
</html>
