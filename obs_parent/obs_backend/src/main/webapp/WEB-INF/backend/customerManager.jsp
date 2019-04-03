<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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

        //显示客户详情模态框
        function showCustomerModal(customerId) {
            alert(customerId);
            $.post(
                '${pageContext.request.contextPath}/backend/customerManager/queryByCustomerId',
                {'customerId': customerId},
                function (responseResult) {
                    //当查询成功，将查询出的记录写入到修改模态框对应的节点上
                    $('#customerId_m').text(responseResult.obj.customerId);
                    $('#customerName_m').text(responseResult.obj.customerName);
                    $('#customerAddress_m').text(responseResult.obj.customerAddress);
                    $('#customerPhone_m').text(responseResult.obj.customerPhone);
                    $('#customerRegisterDate_m').text(responseResult.obj.customerRegisterDate);
        });

            $('#showCustomerModal').modal('show');
        }
    </script>
</head>

<body>
<div class="panel panel-default" id="userInfo" id="homeSet">
    <div class="panel-heading">
        <h3 class="panel-title">客户管理</h3>
    </div>
    <div class="panel-body">
        <div>

            <form class="form-inline" method="post">

                <div class="form-group">
                    <label for="customer_name">姓名:</label>
                    <input type="text" class="form-control" id="customer_name" name="name" placeholder="请输入姓名"
                           size="15px">
                </div>
                <div class="form-group">
                    <label for="customer_loginName">帐号:</label>
                    <input type="text" class="form-control" id="customer_loginName" name="loginName" placeholder="请输入帐号"
                           size="15px">
                </div>
                <div class="form-group">
                    <label for="customer_phone">电话:</label>
                    <input type="text" class="form-control" id="customer_phone" name="phone" placeholder="请输入电话"
                           size="15px">
                </div>
                <div class="form-group">
                    <label for="customer_address">地址:</label>
                    <input type="text" class="form-control" id="customer_address" name="address" placeholder="请输入地址">
                </div>

                <input type="button" value="查询" class="btn btn-primary" id="search">
                <input type="reset" value="重置" class="btn btn-primary" id="doSearch">
            </form>
        </div>

        <div class="show-list" style="position: relative;top: 30px;">
            <table class="table table-bordered table-hover" style='text-align: center;'>
                <thead>
                <tr class="text-danger">
                    <th class="text-center">编号</th>
                    <th class="text-center">帐号</th>
                    <th class="text-center">电话</th>
                    <th class="text-center">地址</th>
                    <th class="text-center">注册日期</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${customer.list}" var="customer">
                    <tr>
                        <td>${customer.customerId}</td>
                        <td>${customer.customerName}</td>
                        <td>${customer.customerPhone}</td>
                        <td>${customer.customerAddress}</td>
                        <td>${customer.customerRegisterDate}</td>
                            <%--<td><fmt:formatDate value="${customer.customerRegisterDate}" pattern="yyyy年MM月dd日"/></td>--%>
                        <td class="text-center">
                            <button type="button" class="btn btn-primary btn-sm"
                                    onclick="showCustomerModal(${customer.customerId})">查看
                            </button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>

<!--查看客户详情 start -->
<div class="modal fade" tabindex="-1" id="showCustomerModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <input type="hidden" name="pageNum" value="${sysUser.pageNum}">

        <form enctype="multipart/form-data" class="form-horizontal" id="showCustomerForm">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">查看客户</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="modal-body text-center row">
                        <div class="col-sm-8 col-sm-offset-1">
                            <div class="form-group">
                                <label for="customerId_m" class="col-sm-4 control-label">编号：</label>
                                <div class="col-sm-8">
                                    <label type="text" class="form-control" id="customerId_m"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="customerName_m" class="col-sm-4 control-label">账号：</label>
                                <div class="col-sm-8">
                                    <label type="text" class="form-control" id="customerName_m"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="customerAddress_m" class="col-sm-4 control-label">地址：</label>
                                <div class="col-sm-8">
                                    <label type="text" class="form-control" id="customerAddress_m"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="customerPhone_m" class="col-sm-4 control-label">联系电话：</label>
                                <div class="col-sm-8">
                                    <label type="text" class="form-control" id="customerPhone_m"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="customerRegisterDate_m" class="col-sm-4 control-label">注册日期：</label>
                                <div class="col-sm-8">
                                    <label type="text" class="form-control" id="customerRegisterDate_m"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary cancel" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- 客户信息 end -->
</div>
</body>

</html>