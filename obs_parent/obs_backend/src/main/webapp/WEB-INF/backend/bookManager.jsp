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
        $(function () {
            //上传图像预览
            $('#book-image').on('change', function () {
                $('#img').attr('src', window.URL.createObjectURL(this.files[0]));
            });
            $('#book-image').on('change', function () {
                $('#img2').attr('src', window.URL.createObjectURL(this.files[0]));
            });

            //服务器端接收消息
            var successMsg = '${successMsg}';
            var errorMsg = '${errorMsg}';
            if (successMsg != '') {
                layer.msg(successMsg, {
                    time: 2000,
                    skin: 'successMsg'
                });

            }
            if (errorMsg != '') {
                layer.msg(errorMsg, {
                    time: 2000,
                    skin: 'successMsg'
                });

            }

            //使用bootstrap校验框架完成表单的客户端校验
            //添加模态框的客户端校验
            $('#addBookForm').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'

                },
                fields: {

                    bookName: {
                        validators: {
                            notEmpty: {
                                message: '商品名称不能为空'
                            },
                            remote: {
                                //校验该名称是否已经在数据库中存在
                                url: '${pageContext.request.contextPath}/backend/bookManager/checkBookName'

                            }
                        }
                    },
                    bookPrice: {
                        validators: {
                            notEmpty: {
                                message: '价格不能为空'
                            },
                            regexp: {
                                regexp: /^\d+\.\d+$/,
                                message: '价格必须为小数'
                            }

                        }

                    },
                    bookImage: {
                        validators: {
                            notEmpty: {
                                message: '请选择需要上传的图片'
                            }

                        }
                    },
                    bookTypeId: {
                        validators: {
                            notEmpty: {
                                message: '请选择商品类型'
                            }

                        }
                    }


                }

            });

            $('#frmModifyBook').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'

                },
                fields: {

                    name: {
                        validators: {
                            notEmpty: {
                                message: '商品名称不能为空'
                            },
                            remote: {
                                //校验该名称是否已经在数据库中存在
                                url: '${pageContext.request.contextPath}/backend/bookManager/checkName'
                            }
                        }
                    },
                    price: {
                        validators: {
                            notEmpty: {
                                message: '价格不能为空'
                            },
                            regexp: {
                                regexp: /^\d+\.\d+$/,
                                message: '价格必须为小数'
                            }

                        }

                    },
                    bookTypeId: {
                        validators: {
                            notEmpty: {
                                message: '请选择商品类型'
                            }

                        }
                    }


                }

            });

            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion: 3,
                currentPage:${book.pageNum},
                totalPages:${book.pages},
                pageUrl: function (type, page, current) {
                    return '${pageContext.request.contextPath}/backend/bookManager/queryAll?pageNum=' + page;
                },
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case 'first':
                            return '首页';
                        case 'prev':
                            return '上一页';
                        case 'next':
                            return '下一页';
                        case 'last':
                            return '尾页';
                        case 'page':
                            return page;
                    }
                }
            });
        });

        //添加商品类型
        function addBook() {
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/backend/bookManager/add',
                data: $("#addBookForm").serialize(),
                success: function (responseResult) {
                    //alert(data.message);
                    //如果添加成功
                    if (responseResult.status == 1) {
                        //使用layer.js弹出一个弹出框
                        layer.msg(responseResult.message,
                            {
                                time: 2000,//2秒钟后隐藏弹出框
                                skin: 'successMsg'//设置弹出框的样式
                            },
                            function () {
                                $("#BookTable").bootstrapTable('refresh');
                            }
                        );
                    } else {
                        layer.msg(responseResult.message, {
                            time: 2000,//2秒钟后隐藏弹出框
                            skin: 'errorMsg'//设置弹出框的样式

                        });
                    }
                }
            })
        }

        //显示修改产品模态框
        function showChangeBookModel(bookId) {
            alert(bookId);
            $.post(
                '${pageContext.request.contextPath}/backend/bookManager/queryByBookId',
                {'bookId': bookId},
                function (responseResult) {
                    //当查询成功，将查询出的记录写入到修改模态框对应的节点上
                    $('#bookId_m').val(responseResult.obj.bookId);
                    $('#bookName_m').val(responseResult.obj.bookName);
                    $('#bookAuthor_m').val(responseResult.obj.bookAuthor);
                    $('#bookPress_m').val(responseResult.obj.bookPress);
                    $('#bookPrice_m').val(responseResult.obj.bookPrice);
                    $('#bookDescription_m').val(responseResult.obj.bookDescription);
                    $('#bookTypeId_m').val(responseResult.obj.bookTypeId);
                    //设置图片预览
                    /*   $('#bookImage_m').attr('src', '${pageContext.request.contextPath}/backend/bookManager/showPic?image=' + responseResult.book.bookImage);*/
                });

            $('#modifyBookModal').modal('show');
        }

        //修改书籍
        function modifyBook() {
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/backend/bookManager/modify',
                data: $("#modifyBookForm").serialize(),
                success:
                    function (responseResult) {
                    //如果添加成功
                    if (responseResult.status == 1) {
                        //使用layer.js弹出一个弹出框
                        layer.msg(
                            responseResult.message,
                            {
                                time: 2000,//2秒钟后隐藏弹出框
                                skin: 'successMsg'//设置弹出框的样式
                            },
                            function () {
                                //$("#BookTable").bootstrapTable('refresh');
                                alert(1);
                            }
                        );
                    } else {
                        layer.msg(responseResult.message, {
                            time: 2000,//2秒钟后隐藏弹出框
                            skin: 'errorMsg'//设置弹出框的样式

                        });
                    }
                }
            })
        }

        //显示删除确认模态框
        function showRemoveBookModal(bookId) {
            //将该值写入到该模态框的隐藏表单域
            $('#bookId').val(bookId);
            //显示模态框
            $('#removeBookModal').modal('show');
        }

        //删除商品
        function removeBook() {
            $.post(
                '${pageContext.request.contextPath}/backend/bookManager/removeByBookId',
                {'bookId': $('#bookId').val()},
                function (result) {
                    if (result.status == 1) {
                        layer.msg(result.message, {
                            time: 2000,
                            skin: 'successMsg'
                        }, function () {
                            alert(1);
                        });
                    } else {
                        layer.msg(result.message, {
                            time: 2000,
                            skin: 'errorMsg'
                        });
                    }
                });
        }


    </script>
</head>

<body>
<div class="panel panel-default" id="userPic">
    <div class="panel-heading">
        <h3 class="panel-title">书籍管理</h3>
    </div>
    <div class="panel-body">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addBookModal">添加书籍
        </button>
        <br>
        <br>
        <div class="show-list text-center">
            <table class="table table-bordered table-hover" style='text-align: center;' id="BookTable">
                <thead>
                <tr class="text-danger">
                    <th class="text-center">编号</th>
                    <th class="text-center">商品</th>
                    <th class="text-center">价格</th>
                    <th class="text-center">产品类型</th>
                    <th class="text-center">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${book.list}" var="book">

                    <tr>
                        <td>${book.bookId}</td>
                        <td>${book.bookName}</td>
                        <td>${book.bookPrice}</td>
                        <td>${book.bookType.bookTypeName}</td>
                        <td>
                            <c:if test="${book.bookType.bookTypeState==1}">有效商品</c:if>
                            <c:if test="${book.bookType.bookTypeState==0}">无效商品</c:if>
                        </td>
                        <td class="text-center">
                            <input type="button" class="btn btn-warning btn-sm" value="修改"
                                   onclick="showChangeBookModel(${book.bookId})">
                            <input type="button" class="btn btn-warning btn-sm" value="删除"
                                   onclick="showRemoveBookModal(${book.bookId})">
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <ul id="pagination"></ul>
        </div>
    </div>
</div>

<!-- 添加商品 start -->
<div class="modal fade" tabindex="-1" id="addBookModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <form id="addBookForm" enctype="multipart/form-data" class="form-horizontal">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加商品</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="bookName" class="col-sm-4 control-label">书名：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="bookName" name="bookName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookName" class="col-sm-4 control-label">作者：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="bookAuthor" name="bookAuthor">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="bookPrice" class="col-sm-4 control-label">出版社：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="bookPress" name="bookPress">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookPrice" class="col-sm-4 control-label">价格：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="bookPrice" name="bookPrice">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookPrice" class="col-sm-4 control-label">描述：</label>
                            <div class="col-sm-8">
                                <textarea type="text" class="form-control" id="bookDescription"
                                          name="bookDescription"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookImage" class="col-sm-4 control-label">封面：</label>
                            <div class="col-sm-8">
                                <a href="javascript:" class="file">选择文件
                                    <input type="file" name="bookImage" id="bookImage">
                                </a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="bookTypeId">类型：</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="bookTypeId" id="bookTypeId">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${bookTypes}" var="bookType">
                                        <option value="${bookType.bookTypeId}">${bookType.bookTypeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <!-- 显示图像预览 -->
                        <img style="width: 160px;height: 180px;" id="bookImage_add_preview">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal" onclick="addBook()">添加</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 添加商品 end -->

<!-- 修改商品 start -->
<div class="modal fade" tabindex="-1" id="modifyBookModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog modal-lg">
        <!-- 内容声明 -->
        <input type="hidden" name="pageNum" value="${pageInfo.pageNum}">

        <form enctype="multipart/form-data" class="form-horizontal" id="modifyBookForm">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">修改商品</h4>
                </div>
                <div class="modal-body text-center row">
                    <div class="modal-body text-center row">
                        <div class="col-sm-8">
                            <div class="form-group">
                                <label for="bookId_m" class="col-sm-4 control-label">编号：</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="bookId_m" name="bookId" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bookName_m" class="col-sm-4 control-label">书名：</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="bookName_m" name="bookName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bookAuthor_m" class="col-sm-4 control-label">作者：</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="bookAuthor_m" name="bookAuthor">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="bookPress_m" class="col-sm-4 control-label">出版社：</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="bookPress_m" name="bookPress">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bookPrice_m" class="col-sm-4 control-label">价格：</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="bookPrice_m" name="bookPrice">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bookDescription_m" class="col-sm-4 control-label">描述：</label>
                                <div class="col-sm-8">
                                <textarea type="text" class="form-control" id="bookDescription_m"
                                          name="bookDescription"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">封面：</label>
                                <div class="col-sm-8">
                                    <a href="javascript:" class="file">选择文件
                                        <input type="file" id="bookImage_m" name="bookImage">
                                    </a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label" for="bookTypeId">类型：</label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="bookTypeId_m" name="bookTypeId">
                                        <option value="">--请选择--</option>
                                        <c:forEach items="${bookTypes}" var="bookType">
                                            <option value="${bookType.bookTypeId}">${bookType.bookTypeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <!-- 显示图像预览 -->
                            <img style="width: 160px;height: 180px;" id="bookImage_modify_preview">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="button" data-dismiss="modal" onclick="modifyBook()">修改</button>
                        <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- 修改商品 end -->
</div>

<!-- 确认删除商品 start -->
<div class="modal fade" tabindex="-1" id="removeBookModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <input type="hidden" id="bookId">
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">提示消息</h4>
            </div>

            <div class="modal-body text-center row">
                <div class="col-sm-8">
                    <h4>确认要删除该商品吗？</h4>
                </div>
            </div>

            <div class="modal-footer">
                <button class="btn btn-primary" onclick="removeBook()">确认</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 确认删除商品 end -->
</body>

</html>