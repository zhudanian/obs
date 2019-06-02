<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

        function queryByBookTypeId(bookTypeId) {
            $("#frame-id").attr("src", "${pageContext.request.contextPath}/front/bookstore/queryByBookTypeId?bookTypeId=" + bookTypeId);

        }
        function queryByNew() {
            $("#frame-id").attr("src", "${pageContext.request.contextPath}/front/bookstore/queryByNew" );
        }
        function queryByHot() {
            $("#frame-id").attr("src", "${pageContext.request.contextPath}/front/bookstore/queryByHot" );
        }
    </script>
</head>
<body>
<jsp:include page="top.jsp"/>

<div class="container">

    <div class="row bookstore-top">
        <!-- 轮播 -->
        <div class="carousel slide col-lg-12" id="carousel-example-generic" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/images/a.jpg" alt="...">
                    <div class="carousel-caption">
                       <%-- <h3>新书上架!!!</h3>
                        <h2>《哈利波特》</h2>--%>
                    </div>
                </div>
                <div class="item">
                    <img  src="${pageContext.request.contextPath}/images/b.jpg" alt="...">
                    <div class="carousel-caption">
                      <%--  <h3>新书上架!!!</h3>
                        <h2>《哈利波特》</h2>--%>
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/images/g.jpg" alt="...">
                    <div class="carousel-caption">
                   <%--     <h3>新书上架!!!</h3>
                        <h2>《哈利波特》</h2>--%>
                    </div>
                </div>
            </div>
            <!-- Controls -->
            <a class="left carousel-control " href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    </div>

    <div class="row bookstore-center">
        <div class="category-area col-lg-2">
            <h3>书籍类型</h3>
            <div class="category-menu">
                <nav class="menu">
                    <ul class="list-unstyled">
                        <li><a onclick="queryByNew()">新书</a></li>
                        <li><a onclick="queryByHot()">热销</a></li>
                        <c:forEach items="${bookTypeList}" var="bookType">
                            <li value="${bookType.bookTypeId}"
                                onclick="queryByBookTypeId(${bookType.bookTypeId})">
                                <a>${bookType.bookTypeName}</a></li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>

        <iframe id="frame-id" class="col-lg-10"
                src="${pageContext.request.contextPath}/front/bookstore/queryByHot"
               height="920px" frameborder="0" scrolling="no">
              <%--  width="100%" height="100%" >--%>
        </iframe>


    </div>

</div>

<jsp:include page="bottom.jsp"/>

<!-- Modal -->
<div class="modal fade col-lg-6 col-lg-offset-3" tabindex="-1" id="bookDetail">

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
                        <div class="col-lg-6">
                            <img id="bookImage_qid" style="width: 200px;height: 300px;margin-left: 30px"/>
                        </div>
                        <div class="col-lg-6">
                            <div class="modal-pro-content">
                                <input type="hidden" id="bookId_qid" name="bookId">
                                <span class="col-lg-12">
                                     <h3>《<label id="bookName_qid" name="bookName"></label>》</h3>
                                </span>
                                <span class="col-lg-12" style="font-size: large;color: #f8bf0f">
                                     <h4>￥<label id="bookPrice_qid" name="bookPrice_qid"></label></h4>
                                </span>
                                <p class="col-lg-12" id="bookDescription_qid" style="height:150px"></p>
                                <div class="row">
                                    <span class="col-lg-6" style="float: left">
                                         <input type="number" value="1" name="num" id="num" style="width: 50px"/>
                                    </span>
                                    <span class="col-lg-6">
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
</html>
