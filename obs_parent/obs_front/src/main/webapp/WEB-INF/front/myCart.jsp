<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <script>


    function removeFromCartByIds() {
        var bookIds = [];
        $("[name='test']:checked").each(function () {
            bookIds.push($(this).val());
        });
        // console.info(bookIds);
        if (bookIds.length < 1) {
            alert("请选择要删除的书籍！");
        } else {
            $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/front/cart/removeFromCartByIds",
                    data: {"bookIds": bookIds},
                    traditional: true,//如果要传数组，这行一定要加！用传统的方式来序列化数据
                    success: function () {
                        $("input[name='test']:checked").each(function () { // 遍历选中的checkbox
                            var checkedBook = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
                            $("#cartTb").find("tr:eq(" + checkedBook + ")").remove();
                        });
                    }
                }
            )
        }


    }

    function removeBookFromCart(btn, bookId) {
        $.post(
            '${pageContext.request.contextPath}/front/cart/removeFromCartById',
            {"bookId": bookId},
            function () {
                $(btn).parent().parent().remove();
            }
        )
    }

    function changeNum(bookId, num) {
        $.post(
            '${pageContext.request.contextPath}/front/cart/changeNum',
            {

                "bookId": bookId,
                "num": $(num).val()
            },
            function () {
                alert(1);
            }
        )
    }

    function clearCart() {
        $.post(
            '${pageContext.request.contextPath}/front/cart/clearCart',
            {},
            function () {
                $('.cartTbBooks').remove();
            }
        )
    }

    function selectAll(btn) {
        if ($(btn).is(':checked')) {
            $('input[name="test"]').each(function () {
                $(this).prop("checked", true);
            });
        } else {
            $('input[name="test"]').each(function () {
                $(this).prop("checked", false);
            });
        }
    }

    function setContact(tr) {
        // alert($(this).children().children());
        $('#contactName').val($(tr).children().eq(0).text());
        $('#contactPhone').val($(tr).children().eq(1).text());
        $('#contactAddress').val($(tr).children().eq(2).text());
    }

    function generatorOrder() {
        if ($('#contactName').val() === "" || $('#contactPhone').val() === "" || $('#contactAddress').val() === "") {
            alert("请填写完整收货人信息!");
        } else {
            var item = {};
            var items = [];
            var bookIds = [];
            $("[name='test']:checked").each(function () {
                bookIds.push($(this).val());
                item.bookId = $(this).val();
                item.num = $(this).parent().parent().children().eq(4).children().val();
                items.push(item);
            });

            if (items.length === 0) {
                alert("请选择图书!");
            } else {
                $.post(
                    '${pageContext.request.contextPath}/front/order/generateOrder',
                    {
                        "contactName": $('#contactName').val(),
                        "contactPhone": $('#contactPhone').val(),
                        "contactAddress": $('#contactAddress').val(),
                        "items": JSON.stringify(items)
                    },
                    function () {
                        $.ajax({
                                type: "post",
                                url: "${pageContext.request.contextPath}/front/cart/removeFromCartByIds",
                                data: {"bookIds": bookIds},
                                traditional: true,//如果要传数组，这行一定要加！用传统的方式来序列化数据
                                success: function () {
                                    $("input[name='test']:checked").each(function () { // 遍历选中的checkbox
                                        var checkedBook = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
                                        $("#cartTb").find("tr:eq(" + checkedBook + ")").remove();
                                        alert("购买成功！");
                                    });
                                }
                            }
                        )
                    });
            }
        }


    }
    </script>

</head>

<body>
<jsp:include page="top.jsp"/>
<!-- content start -->
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="page-header" style="margin-bottom: 0px;">
                <h3>我的购物车</h3>
            </div>
        </div>
    </div>
    <table class="table table-hover table-striped table-bordered">
        <thead>
        <tr>
            <th>
                <label>
                    <input type="checkbox" onclick="selectAll(this)">
                </label>
            </th>
            <th>序号</th>
            <th>书名</th>
            <th>封面</th>
            <th>数量</th>
            <th>单价</th>
            <th>小计</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="cartTb">
        <c:forEach items="${bookCart.items}" var="item" varStatus="status">
            <tr class="cartTbBooks">
                <td>
                    <input type="checkbox" name="test" value="${item.book.bookId}">

                </td>
                <td>${status.count}</td>
                <td>${item.book.bookName}</td>
                <td><img src="${pageContext.request.contextPath}/front/bookstore/showPic?image=${item.book.bookImage}"
                         alt="" width="60" height="60"></td>
                <td>
                    <input type="text" value="${item.num}" size="5"
                           onblur="changeNum(${item.book.bookId},this)">
                </td>
                <td>${item.book.bookPrice}</td>
                <td>${item.book.bookPrice*item.num}</td>
                <td>
                    <button class="btn btn-danger" type="button"
                            onclick="removeBookFromCart(this,${item.book.bookId})">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                    </button>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8" align="right">

                <button class="btn btn-warning margin-right-15" type="button" onclick="removeFromCartByIds()"> 删除选中项
                </button>


                <button class="btn btn-warning margin-right-15" type="button" onclick="clearCart()">清空购物车</button>
                <a href="${pageContext.request.contextPath}/front/bookstore/showBookstore">
                    <button class="btn btn-warning margin-right-15" type="button"> 继续购物</button>
                </a>

                <button class="btn btn-warning" type="button" onclick="generatorOrder()">提交订单</button>
            </td>
        </tr>
        <tr>
            <td colspan="8" align="right" class="foot-msg">
                总计： <b><span>${sessionScope.bookCart.totalMoney}</span> </b>元
            </td>
        </tr>
        </tbody>
    </table>


    <c:if test="${not empty customer}">
        <div class="container row">
            <form id="contactForm" class="form-inline" style="text-align: center">
                <div class="form-group">
                    <label for="contactName">收货人：</label>
                    <input type="text" id="contactName" name="contactName">
                </div>
                <div class="form-group">
                    <label for="contactPhone">联系电话：</label>
                    <input type="text" id="contactPhone" name="contactPhone">
                </div>
                <div class="form-group">
                    <label for="contactAddress">收货地址：</label>
                    <input type="text" id="contactAddress" name="contactAddress">
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
            <table class="table table-striped table-bordered table-hover" style="margin-top: 10px;text-align: center">
                <thead>
                <tr>
                    <td> 收货人</td>
                    <td>联系电话</td>
                    <td>收货地址</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${contactList}" var="contact">
                    <tr onclick="setContact(this)" style="cursor: pointer">
                        <td>${contact.contactName}</td>
                        <td>${contact.contactPhone}</td>
                        <td>${contact.contactAddress}</td>
                            <%--<td>
                                <button class="btn btn-primary" onclick="modifyContact()">修改</button>
                                <button class="btn btn-warning" onclick="deleteContact()">删除</button>
                            </td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
    <!-- content end-->
</div>
<jsp:include page="bottom.jsp"/>
</body>

</html>