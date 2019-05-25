<%--
  Created by IntelliJ IDEA.
  User: ZDN
  Date: 2019/4/13
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--查看订单详情 start -->
<div class="modal fade" tabindex="-1" id="orderModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form enctype="multipart/form-data" class="form-horizontal" id="showCustomerForm">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">查看订单</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="modal-body text-center row">
                        <div class="col-lg-8">
                            <table class="table table-hover table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>书名</th>
                                    <th>封面</th>
                                    <th>数量</th>
                                    <th>单价</th>
                                    <th>总价</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="orderBookDetail">
                                <c:forEach items="${orderBookList}" var="orderBook">
                                    <tr>
                                        <td></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-lg-4">hhe</div>
                    </div>
                    <div class="modal-footer">
                        <span> 总计： <b><span>${shoppingcart.totalMoney}</span> </b>元</span>
                        <button class="btn btn-primary cancel" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- 订单详情 end -->
</div>
</body>
</html>
