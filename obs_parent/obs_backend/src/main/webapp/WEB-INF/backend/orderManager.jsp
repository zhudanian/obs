<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>backend</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css"/>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css"/>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>

    <script>
        function showOrderDetailModel(orderId) {
            // alert(orderId);
            $.get(
                '${pageContext.request.contextPath}/backend/orderBookManager/queryByOrderId',
                {'orderId': orderId},
                function (orderBookList) {
                    for (var orderBook in orderBookList) {
                        alert(orderBook);
                        alert(orderBookList[orderBook]);
                        console.info(orderBookList[orderBook].bookName);
                    }
                });

            $('#orderModal').modal('show');
        }

        function changeOrderState(orderId) {
            $.post(
                '${pageContext.request.contextPath}/backend/orderBookManager/changeOrderState',
                {'orderId': orderId},
                function () {
                    $('#tb tr td:eq(6)').text("已发货");
                    $('#tb tr td:eq(7):eq(1)').removeClass(button).text("已发货")
                }
            )

        }

    </script>
</head>

<body>
<div class="panel panel-default" id="userPic">
    <div class="panel-heading">
        <h3 class="panel-title">订单管理</h3>
    </div>
    <div class="panel-body">
        <br>
        <br>
        <div class="show-list text-center">
            <table class="table table-bordered table-hover table-striped" style='text-align: center;' id="OrderTable">
                <thead>
                <tr class="text-danger">
                    <th class="text-center">订单编号</th>
                    <th class="text-center">总价</th>
                    <th class="text-center">收货人</th>
                    <th class="text-center">电话</th>
                    <th class="text-center">收货地址</th>
                    <th class="text-center">下单时间</th>
                    <th class="text-center">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                <c:forEach items="${order.list}" var="order">
                </thead>
                <tbody id="tb">

                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.totalPrice}</td>
                    <td>${order.contactName}</td>
                    <td>${order.contactPhone}</td>
                    <td>${order.contactAddress}</td>
                    <td>${order.confirmDate}</td>
                        <%-- <td><fmt:formatDate value="${order.confirmDate}" pattern="yyyy年MM月dd日"/></td>--%>
                    <td>
                        <c:if test="${order.orderState==0}">待付款</c:if>
                        <c:if test="${order.orderState==1}">未发货</c:if>
                        <c:if test="${order.orderState==2}">已发货</c:if>
                        <c:if test="${order.orderState==3}">已完成</c:if>
                    </td>
                    <td class="text-center">
                        <input type="button" class="btn btn-warning btn-sm" value="查看"
                               onclick="showOrderDetailModel(${order.orderId})"/>

                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <c:if test="${order.orderState==1}">
                            <input type="button" class="btn btn-warning btn-sm" value="发货"
                                   onclick="changeOrderState(${order.orderId})"/>
                        </c:if>

                        <c:if test="${order.orderState==2}">已发货</c:if>
                        <c:if test="${order.orderState==3}">已完成</c:if>
                    </td>
                </tr>
                </c:forEach>

                </tbody>
            </table>
            <ul id="pagination"></ul>
        </div>
    </div>
</div>


</body>

</html>