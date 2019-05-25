<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>网上书城-主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>

    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js"></script>

    <script src="${pageContext.request.contextPath}/js/userSetting.js"></script>
    <script src="${pageContext.request.contextPath}/js/obs.js"></script>
    <script>

        $(function () {
            $('.card').click(function () {
                var bookId = $(this).children().val();
                alert(bookId);
                $.post(
                    '${pageContext.request.contextPath}/front/bookstore/queryByBookId',
                    {"bookId": bookId},
                    function (responseResult) {
                        $('#bookId_qid').val(responseResult.obj.bookId);
                        $('#bookImage_qid').attr('src', '${pageContext.request.contextPath}/front/bookstore/showPic?image=' + responseResult.obj.bookImage);
                        $('#bookName_qid').text(responseResult.obj.bookName);
                        $('#bookPrice_qid').text(responseResult.obj.bookPrice);
                        $('#bookDescription_qid').text(responseResult.obj.bookDescription)
                    });
                $('#bookDetail').modal('show');
            });

            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion: 3,
                currentPage:${bookList.pageNum},
                totalPages:${bookList.pages},
                pageUrl: function (type, page, current) {
                    return '${pageContext.request.contextPath}/front/bookstore/queryByNew?pageNum=' + page;
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

        function addToCart(bookId) {
            $.post(
                '${pageContext.request.contextPath}/front/cart/addToCart',
                {
                    "bookId": bookId,
                    "num": $('#num').val()
                },
                function (responseResult) {
                    alert(1);
                }
            )
        }

    </script>
</head>
<body>
<div class="col-md-12">

    <div>
        <div class="row">
            <h1>新书上市</h1>
            <hr/>
        </div>

        <div class="row" style="display: inline">
            <c:forEach items="${bookList.list}" var="newBook">
                <div class="card col-md-2">
                    <input type="hidden" value="${newBook.bookId}">
                    <img class="card-img-top"
                         src="${pageContext.request.contextPath}/front/bookstore/showPic?image=${newBook.bookImage}"
                         width="175px" height="200px">
                    <div class="card-body">

                        <h4 class="card-title">《${newBook.bookName}》</h4>
                        <label>作者 ：${newBook.bookAuthor}</label>
                        <span class="user clearfix pull-right"
                              style="margin-top: 20px;font-size: large;color: #f8bf0f">￥${newBook.bookPrice}</span>

                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <ul id="pagination"/>
        </div>
    </div>

</div>
<!-- Modal -->
<div class="modal fade col-md-6 col-md-offset-3" tabindex="-1" id="bookDetail">

    <!-- 窗口声明 -->
    <div class="modal-dialog">

        <form enctype="multipart/form-data" class="form-horizontal" id="addToCartForm">
            <div class="modal-content">
                <!-- 头部、主体、脚注 -->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">商品详情</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <img id="bookImage_qid" style="width: 200px;height: 300px;margin-left: 30px"/>
                        </div>
                        <div class="col-md-6">
                            <div class="modal-pro-content">
                                <input type="hidden" id="bookId_qid" name="bookId">
                                <span class="col-md-12">
                                     <h3>《<label id="bookName_qid" name="bookName"></label>》</h3>
                                </span>
                                <span class="col-md-12" style="font-size: large;color: #f8bf0f">
                                     <h4>￥<label id="bookPrice_qid" name="bookPrice_qid"></label></h4>
                                </span>
                                <p class="col-md-12" id="bookDescription_qid" style="height:150px"></p>
                                <div class="row">
                                    <span class="col-md-6" style="float: left">
                                         <input type="number" value="1" name="num" id="num" style="width: 50px"/>
                                    </span>
                                    <span class="col-md-6">
                                          <button onclick="addToCart($('#bookId_qid').val())">加入购物车</button>
                                    </span>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-warning cancel" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </form>
    </div>
    <!-- Modal end -->

</div>

</body>