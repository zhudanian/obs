<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script SRC="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css">
    <script>
        $(function () {
            $('#addBookTypeForm').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'

                },
                fields: {
                    bookTypeName: {
                        validators: {
                            notEmpty: {
                                message: '书籍类型不能为空'
                            },
                            remote: {
                                url: '${pageContext.request.contextPath}/backend/bookTypeManager/checkBookTypeName'
                            }
                        }
                    }
                }

            });
            $('#modifyBookTypeForm').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'

                },
                fields: {
                    bookTypeName: {
                        validators: {
                            notEmpty: {
                                message: '书籍类型不能为空'
                            },
                            remote: {
                                url: '${pageContext.request.contextPath}/backend/bookTypeManager/checkBookTypeName'
                            }
                        }
                    }
                }

            });

            //在页面加载完成后初始化分页条
            $('#pagination').bootstrapPaginator({
                //主版本号
                bootstrapMajorVersion: 4,
                //当前页
                currentPage:${bookType.pageNum},
                //总页数
                totalPages:${bookType.pages},//el表达式取的是对应属性的get方法
                //分页时用到的url请求
                //page:当前页
                pageUrl: function (type, page, current) {
                    return '${pageContext.request.contextPath}/backend/bookTypeManager/queryAll?pageNum=' + page;
                },
                itemTexts: function (type, page, current) {//根据type的值，显示对应的分页栏
                    switch (type) {
                        case "first":
                            return '首页';
                        case "prev":
                            return '上一页';
                        case "next":
                            return '下一页';
                        case "last":
                            return '尾页';
                        case "page":
                            return page;
                    }
                }
            });
            //服务端校验
            var errorMsg = '${message}';
            if (errorMsg != '') {
                layer.msg(errorMsg, {
                    time: 2000,
                    skin: 'errorMsg'
                });
            }
        });


        //添加商品类型
        function addBookType() {
            var bv = $('#addBookTypeForm').data('bootstrapValidator');
            bv.validate();
            if (bv.isValid()) {
                $.post(
                    '${pageContext.request.contextPath}/backend/bookTypeManager/add',
                    {'bookTypeName': $('#bookTypeName').val()},
                    function (responseResult) {
                        alert(responseResult.status);
                        if (responseResult.status == 1) {

                            //使用layer.js弹出一个弹出框
                            layer.msg(
                                responseResult.message,
                                {
                                    time: 2000,//2秒钟后隐藏弹出框
                                    skin: 'successMsg'//设置弹出框的样式
                                },
                                function () {
                                    $("#BookTypeTable").bootstrapTable('refresh');
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

        //显示修改  书籍类型名称
        function modifyBookType(bookTypeId) {
            // alert(bookTypeId);
            $.post(
                '${pageContext.request.contextPath}/backend/bookTypeManager/queryByBookTypeId',
                {'bookTypeId': bookTypeId},
                function (result) {
                    //console.log(result);
                    //如果成功，将值写入修改模态框
                    if (result.status == 1) {
                        $('#bookTypeId_m').val(result.obj.bookTypeId);
                        $('#bookTypeName_m').val(result.obj.bookTypeName);
                    }
                });
            $('#modifyBookTypeModal').modal('show');

        }

        //修改商品类型名称
        function modifyName() {
            var bv = $('#modifyBookTypeForm').data('bootstrapValidator');
            bv.validate();
            if (bv.isValid()) {
                $.post(
                    '${pageContext.request.contextPath}/backend/bookTypeManager/modify',
                    {
                        'bookTypeId': $('#bookTypeId_m').val(),
                        'bookTypeName': $('#bookTypeName_m').val()
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
                                    $("#BookTypeTable").bootstrapTable('refresh');
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

        //显示确认删除商品模态框
        /* removeBookType = function (id) {
             alert(id);
             //将id值存入删除模态框的隐藏域
             $('#bookTypeId').val(id);
         }

         //删除商品类型
         function deleteBookType() {
             $.post(
                 '${pageContext.request.contextPath}/backend/bookTypeManager/removeByBookTypeId',
                {'bookTypeId': $('#bookTypeId').val()},
                function (responseResult) {
                    if (responseResult.status == 1) {
                        layer.msg(
                            responseResult.message, {
                                time: 2000,
                                skin: 'successMsg'
                            },
                            function () {
                                alert(1);
                                $('#BookTypeTable').bootstrapTable('refresh');
                            }
                        );
                    } else {
                        layer.msg(responseResult.message, {
                            time: 2000,
                            skin: 'errorMsg'
                        });
                    }
                });
        }*/

        //更新状态
        function modifyStatus(id, btn) {
            //alert(id);
            $.post(
                '${pageContext.request.contextPath}/backend/bookTypeManager/modifyStatus',
                {'id': id}, function () {
                    alert(id);
                    //异步局部刷新页面
                    //找到该点击的按钮的父元素的上一个元素
                    var $td = $(btn).parent().prev();
                    if ($td.text().trim() == '启用') {
                        $td.text('禁用');
                        $(btn).val('启用').removeClass('btn-danger').addClass('btn-success');
                    } else {
                        $td.text('启用');
                        $(btn).val('禁用').removeClass('btn-success').addClass('btn-danger');
                    }
                });
        }
    </script>

</head>

<body>
<div class="panel panel-default" id="userSet">
    <div class="panel-heading">
        <h3 class="panel-title">书籍类型管理</h3>
    </div>
    <div class="panel-body">

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addBookTypeModal">添加书籍类型
        </button>
        <br>
        <br>
        <div class="show-list text-center">
            <table class="table table-bordered table-hover table-striped" style='text-align: center;'
                   id="BookTypeTable"
                   data-pagination="true"
                   data-side-pagination="server"
                   data-total-field="count"
                   datapagesize="5"
            >
                <thead>
                <tr class="text-danger">
                    <th class="text-center">编号</th>
                    <th class="text-center">类型名称</th>
                    <th class="text-center">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${bookType.list}" var="bookType">
                    <tr>
                        <td>${bookType.bookTypeId}</td>
                        <td>${bookType.bookTypeName}</td>
                        <td>
                            <c:if test="${bookType.bookTypeState==1}">启用</c:if>
                            <c:if test="${bookType.bookTypeState==0}">禁用</c:if>
                        </td>
                        <td class="text-center">

                            <button type="button" class="btn btn-primary btn-sm"
                                    onclick="modifyBookType(${bookType.bookTypeId})">修改
                            </button>

                                <%--  <button type="button" class="btn btn-warning btn-sm" data-toggle="modal"
                                          data-target="#removeBookTypeModal"
                                          onclick="removeBookType(${bookType.bookTypeId});">删除
                                  </button>--%>

                            <c:if test="${bookType.bookTypeState==1}">
                                <input type="button" class="btn btn-danger btn-sm" value="禁用"
                                       onclick="modifyStatus(${bookType.bookTypeId},this)">
                            </c:if>
                            <c:if test="${bookType.bookTypeState==0}">
                                <input type="button" class="btn btn-success btn-sm" value="启用"
                                       onclick="modifyStatus(${bookType.bookTypeId},this)">
                            </c:if>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <%--bootstrap分页条--%>
            <ul id="pagination"/>
        </div>
    </div>
</div>

<!-- 添加商品类型 start -->
<div class="modal fade" tabindex="-1" id="addBookTypeModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <div class="modal-content">
            <form id="addBookTypeForm">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加商品类型</h4>
                </div>
                <div class="modal-body text-center">

                    <form-group>
                        <div class="row text-right">
                            <label for="bookTypeName" class="col-sm-4 control-label">类型名称：</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="bookTypeName" name="bookTypeName">
                            </div>
                        </div>
                    </form-group>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" onclick="addBookType()">添加</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 添加商品类型 end -->

<!-- 修改商品类型 start -->
<div class="modal fade" tabindex="-1" id="modifyBookTypeModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <form id="modifyBookTypeForm">
            <!-- 内容声明 -->
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">修改商品类型</h4>
                </div>
                <div class="modal-body text-center">
                    <div class="row text-right">
                        <label for="bookTypeId_m" class="col-sm-4 control-label">编号：</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="bookTypeId_m" readonly>
                        </div>
                    </div>
                    <br>
                    <div class="row text-right">
                        <label for="bookTypeName_m" class="col-sm-4 control-label">类型名称</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="bookTypeName_m" name="bookTypeName">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-warning updateProType" onclick="modifyName()">修改</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 修改商品类型 end -->

<!-- 确认删除商品类型 start -->
<%--<div class="modal fade" tabindex="-1" id="removeBookTypeModal">
    <input type="hidden" id="bookTypeId"/>
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-sm">
        <!-- 内容声明 -->
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">提示消息</h4>
            </div>
            <div class="modal-body text-center">
                <h4>确认删除该商品类型吗？</h4>

            </div>
            <div class="modal-footer">
                <button class="btn btn-warning updateProType" onclick="deleteBookType()">确认</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>--%>
<!-- 确认删除商品类型 end -->


</body>

</html>