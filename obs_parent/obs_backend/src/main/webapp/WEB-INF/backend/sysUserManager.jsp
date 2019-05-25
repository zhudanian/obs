<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css"/>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zshop.css">

    <script>
        $(function () {
            //添加用户表单的客户端校验
            $('#addSysUserForm').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'

                },
                fields: {
                    sysName: {
                        validators: {
                            notEmpty: {
                                message: '用户姓名不能为空'
                            }
                        }
                    },
                    sysLoginName: {
                        validators: {
                            notEmpty: {
                                message: '登录账号不能为空'
                            },
                            remote: {
                                //ajax后端校验该登录账号是否已经存在
                                url: '${pageContext.request.contextPath}/backend/sysUserManager/checkSysLoginName'
                            }
                        }
                    },
                    sysPassword: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            }
                        }
                    },
                    confirmSysPassword: {
                        validators: {
                            notEmpty: {
                                message: '确认密码不能为空'
                            },
                            identical: {
                                field: 'sysPassword',
                                message: '两次密码不一致'
                            }
                        }
                    },
                    sysPhone: {
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
                    sysEmail: {
                        validators: {
                            notEmpty: {
                                message: '邮箱不能为空'
                            },
                            emailAddress: {
                                message: '邮箱格式不正确'
                            }
                        }
                    }
                }

            });

            $('#modifySysUserForm').bootstrapValidator({
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'

                },
                fields: {
                    sysLoginName: {
                        validators: {
                            notEmpty: {
                                message: '登录账号不能为空'
                            },
                            remote: {
                                //ajax后端校验该登录账号是否已经存在
                                url: '${pageContext.request.contextPath}/backend/sysUserManager/checkSysLoginName',
                                type: "post",
                                dataType: "json",
                                data: {
                                    sysLoginName: function () {
                                        return $('#sysId_m').val();
                                    },
                                    sysId: function () {
                                        return $('#sysId_m').val();
                                    }
                                }
                            }
                        }
                    },
                    sysPhone: {
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
                    sysEmail: {
                        validators: {
                            notEmpty: {
                                message: '邮箱不能为空'
                            },
                            emailAddress: {
                                message: '邮箱格式不正确'
                            }
                        }
                    }
                }

            });

            //在页面加载完成后初始化分页条
            $('#pagination').bootstrapPaginator({

                //主版本号
                bootstrapMajorVersion: 3,
                //当前页
                currentPage:${sysUser.pageNum},
                //总页数
                totalPages:${sysUser.pages},//el表达式取的是对应属性的get方法
                //分页时用到的url请求
                //page:当前页
                onPageClicked: function (event, originalEvent, type, page) {
                    //alert(page);
                    //给隐藏表单域的pageNum重新赋值为当前点击的页号page
                    $('#pageNum').val(page);
                    //重新提交表单
                    $('#frmQuery').submit();
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
        });

        function showChangeSysUserModel(sysId) {
            $.post(
                '${pageContext.request.contextPath}/backend/sysUserManager/queryBySysId',
                {"sysId": sysId},
                function (responseResult) {
                    $('#sysId_m').val(responseResult.obj.sysId);
                    $('#sysName_m').val(responseResult.obj.sysName);
                    $('#sysLoginName_m').val(responseResult.obj.sysLoginName);
                    $('#sysPhone_m').val(responseResult.obj.sysPhone);
                    $('#sysEmail_m').val(responseResult.obj.sysEmail);
                });
            $('#modifySysUserModal').modal('show');
        }

        function modifySysUser() {
            var bv = $('#modifySysUserForm').data('bootstrapValidator');
            bv.validate();
            if (bv.isValid()) {
                $.post('${pageContext.request.contextPath}/backend/sysUserManager/modify',
                    //将表单中的元素以key=value的形式序列化，key就是name属性的值，value就是value属性的值
                    $('#modifySysUserForm').serialize(), function (responseResult) {

                        if (responseResult.status == 1) {
                            layer.msg(responseResult.message, {
                                time: 2000,
                                skin: 'successMsg'
                            }, function () {
                                $("#sysUserTable").bootstrapTable('refresh');
                            });

                        } else if (responseResult.status == 0) {
                            layer.msg(responseResult.message, {
                                time: 2000,
                                skin: 'errorMsg'
                            });
                        }

                    });
            }

        }

        function modifyStatus(sysId, btn) {
            $.post(
                '${pageContext.request.contextPath}/backend/sysUserManager/modifyStatus',
                {'sysId': sysId},
                function (responseResult) {
                    if (responseResult.status == 1) {
                        alert(1);
                        var $td = $(btn).parent().parent().children().eq(6);
                        if ($td.text().trim() == '无效') {
                            $td.text('有效');
                            $(btn).val('禁用').removeClass('btn-success').addClass('btn-danger');

                        } else {
                            $td.text('无效');
                            $(btn).val('启用').removeClass('btn-danger').addClass('btn-success');
                        }
                    }
                });
        }

        function addSysUser() {
            //alert(1);
            //进行表单校验
            var bv = $('#addSysUserForm').data('bootstrapValidator');
            bv.validate();
            if (bv.isValid()) {
                //alert(1);
                //调用ajax到后台执行添加用户
                $.post(
                    '${pageContext.request.contextPath}/backend/sysUserManager/add',
                    //将表单中的元素以key=value的形式序列化，key就是name属性的值，value就是value属性的值
                    $('#addSysUserForm').serialize(),
                    function (responseResult) {

                        if (responseResult.status == 1) {
                            layer.msg(responseResult.message, {
                                time: 2000,
                                skin: 'successMsg'
                            }, function () {
                                alert(1);
                            });

                        } else if (responseResult.status == 0) {
                            layer.msg(responseResult.message, {
                                time: 2000,
                                skin: 'errorMsg'
                            });
                        }

                    });
            }

        }


    </script>
</head>

<body>
<!-- 系统用户管理 -->
<div class="panel panel-default" id="adminSet">
    <div class="panel-heading">
        <h3 class="panel-title">系统用户管理</h3>
    </div>
    <div class="panel-body">
        <%--<div>--%>
            <%--<form class="form-inline" method="post" id="frmQuery">--%>
                <%--<input type="hidden" id="pageNum" name="pageNum" value="${data.pageNum}"/>--%>

                <%--<div class="form-group">--%>
                    <%--<label for="sysName_q">姓名:</label>--%>
                    <%--<input type="text" class="form-control" id="sysName_q" placeholder="请输入姓名" name="sysName"--%>
                           <%--value="${sysUserParam.sysName}">--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                    <%--<label for="sysLoginName_q">帐号:</label>--%>
                    <%--<input type="text" class="form-control" id="sysLoginName_q" placeholder="请输入帐号" name="sysLoginName"--%>
                           <%--value="${sysUserParam.sysLoginName}">--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                    <%--<label for="sysPhone_q">电话:</label>--%>
                    <%--<input type="text" class="form-control" id="sysPhone_q" placeholder="请输入电话" name="sysPhone"--%>
                           <%--value="${sysUserParam.sysPhone}">--%>
                <%--</div>--%>
                <%--<div class="form-group">--%>
                    <%--<label for="status_q">状态</label>--%>
                    <%--<select class="form-control" name="isValid" id="status_q">--%>
                        <%--<option value="-1">全部</option>--%>
                        <%--<option value="1" <c:if test="${sysUserParam.isValid==1}">selected</c:if>>---有效---</option>--%>
                        <%--<option value="0" <c:if test="${sysUserParam.isValid==0}">selected</c:if>>---无效---</option>--%>
                    <%--</select>--%>
                <%--</div>--%>
                <%--<input type="submit" value="查询" class="btn btn-primary" id="searchSysUser">--%>
            <%--</form>--%>
        <%--</div>--%>
        <br>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSysUserModal">添加系统用户
        </button>
        <div class="show-list text-center" style="position: relative; top: 10px;">
            <table class="table table-bordered table-hover table-striped" style='text-align: center;' id="sysUserTable">
                <thead>
                <tr class="text-danger">
                    <th class="text-center">序号</th>
                    <th class="text-center">姓名</th>
                    <th class="text-center">帐号</th>
                    <th class="text-center">电话</th>
                    <th class="text-center">邮箱</th>
                    <th class="text-center">注册时间</th>
                    <th class="text-center">状态</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody id="tb">
                <c:forEach items="${sysUser.list}" var="sysUser">
                    <tr>
                        <td>${sysUser.sysId}</td>
                        <td>${sysUser.sysName}</td>
                        <td>${sysUser.sysLoginName}</td>
                        <td>${sysUser.sysPhone}</td>
                        <td>${sysUser.sysEmail}</td>
                        <td><fmt:formatDate value="${sysUser.createDate}" pattern="yyyy年MM月dd日"/></td>
                        <td>
                            <c:if test="${sysUser.isValid==1}">有效</c:if>
                            <c:if test="${sysUser.isValid==0}">无效</c:if>
                        </td>
                        <td class="text-center">
                            <input type="button" class="btn btn-primary btn-sm" value="修改"
                                   onclick="showChangeSysUserModel(${sysUser.sysId})">

                            <c:if test="${sysUser.isValid==1}">
                                <input type="button" class="btn btn-danger btn-sm" value="禁用"
                                       onclick="modifyStatus(${sysUser.sysId},this)">
                            </c:if>
                            <c:if test="${sysUser.isValid==0}">
                                <input type="button" class="btn btn-success btn-sm" value="启用"
                                       onclick="modifyStatus(${sysUser.sysId},this)">
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <ul id="pagination"></ul>
        </div>
    </div>
</div>

<!-- 添加系统用户 start -->
<div class="modal fade" tabindex="-1" id="addSysUserModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <form id="addSysUserForm">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">添加系统用户</h4>
                </div>
                <div class="modal-body text-center">
                    <div class="form-group">
                        <div class="row text-right">
                            <label for="marger-username" class="col-sm-4 control-label">用户姓名：</label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="marger-username" name="sysName">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="row text-right">I
                            <label for="marger-loginName" class="col-sm-4 control-label">登录帐号：</label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="marger-loginName" name="sysLoginName">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="row text-right">
                            <label for="marger-password" class="col-sm-4 control-label">登录密码：</label>

                            <div class="col-sm-4">
                                <input type="password" class="form-control" id="marger-password" name="sysPassword">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="row text-right">
                            <label for="marger-repassword" class="col-sm-4 control-label">确认登录密码：</label>

                            <div class="col-sm-4">
                                <input type="password" class="form-control" id="marger-repassword"
                                       name="confirmSysPassword">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="row text-right">
                            <label for="marger-phone" class="col-sm-4 control-label">联系电话：</label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="marger-phone" name="sysPhone">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="row text-right">
                            <label for="marger-email" class="col-sm-4 control-label">联系邮箱：</label>

                            <div class="col-sm-4">
                                <input type="email" class="form-control" id="marger-email" name="sysEmail">
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" onclick="addSysUser()">添加</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal" type="button">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 添加系统用户 end -->

<!-- 修改系统用户 start -->
<div class="modal fade" tabindex="-1" id="modifySysUserModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <form id="modifySysUserForm">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">系统用户修改</h4>
                </div>

                <div class="modal-body text-center">
                    <div class="form-group">
                        <div class="row text-right">
                            <label for="sysId_m" class="col-sm-4 control-label">用户编号：</label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="sysId_m" readonly="readonly" name="sysId">
                            </div>
                        </div>
                    </div>

                    <br>
                    <div class="form-group">
                        <div class="row text-right">
                            <label for="sysName_q" class="col-sm-4 control-label">用户姓名：</label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="sysName_m" readonly="readonly"
                                       name="sysName">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="row text-right">
                            <label for="sysLoginName_m" class="col-sm-4 control-label">登录帐号：</label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="sysLoginName_m" name="sysLoginName">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="row text-right">
                            <label for="sysPhone_m" class="col-sm-4 control-label">联系电话：</label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="sysPhone_m" name="sysPhone">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="row text-right">
                            <label for="sysEmail_m" class="col-sm-4 control-label">联系邮箱：</label>

                            <div class="col-sm-4">
                                <input type="email" class="form-control" id="sysEmail_m" name="sysEmail">
                            </div>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" onclick="modifySysUser()">修改</button>
                    <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
            <br>
        </form>
    </div>
</div>
<!-- 修改系统用户 end -->

</body>

</html>