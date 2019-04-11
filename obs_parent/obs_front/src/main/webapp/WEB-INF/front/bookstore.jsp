<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>backend</title>
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
    <script src="${pageContext.request.contextPath}/js/zshop.js"></script>
    <script>
       /* (function ($) {
            /!* Quickview-active active *!/
            $('.quickview-active').owlCarousel({
                loop: true,
                autoplay: false,
                autoplayTimeout: 5000,
                navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
                nav: true,
                item: 3,
                margin: 12,
            });

            /!*--------------------------
               Tab active
               ---------------------------- *!/
            var ProductDetailsSmall = $('.product-details-small a');
            ProductDetailsSmall.on('click', function (e) {
                e.preventDefault();
                var $href = $(this).attr('href');
                ProductDetailsSmall.removeClass('active');
                $(this).addClass('active');
                $('.product-details-large .tab-pane').removeClass('active');
                $('.product-details-large ' + $href).addClass('active');
            })
        })(jQuery);*/



        function queryByBookTypeId(bookTypeId) {
            $.post(
                '${pageContext.request.contextPath}/book'
            )

        }

    </script>
</head>
<body>
<div class="container">

    <div class="row bookstore-top">
        <!-- 轮播 -->
        <div class="carousel slide col-lg-8" id="carousel-example-generic" data-ride="carousel">
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
                        <h3>新书上架!!!</h3>
                        <h2>《哈利波特》</h2>
                        <h1><a onclick="addToCart()">加入购物车!</a></h1>
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/images/b.jpg" alt="...">
                    <div class="carousel-caption">
                        <h3>新书上架!!!</h3>
                        <h2>《哈利波特》</h2>
                        <h1><a onclick="addToCart()">加入购物车!</a></h1>
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/images/g.jpg" alt="...">
                    <div class="carousel-caption">
                        <h3>新书上架!!!</h3>
                        <h2>《哈利波特》</h2>
                        <h1><a onclick="addToCart()">加入购物车!</a></h1>
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
        <!-- 轮播结束 -->

        <div class="col-lg-4">
            <div class="col col-lg-4 activities">
                <div>1</div>
                <div>2</div>
                <div>3</div>
            </div>
        </div>
        <!-- 活动-->
    </div>

    <div class="row bookstore-center">
        <div class="category-area col-lg-3">
            <h3>书籍类型</h3>
            <div class="category-menu">
                <nav class="menu">
                    <ul class="list-unstyled">
                        <c:forEach items="${bookTypeList}" var="bookType">
                            <li value="${bookType.bookTypeId}"
                                onclick="queryByBookTypeId(${bookType.bookTypeId})"><a>${bookType.bookTypeName}</a></li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>

        <div class="col-lg-9">
            <div style="margin-left: 30px">
                <div class="row">
                    <h1>热销书籍</h1>
                    <hr/>
                </div>

                <div class="row">
                    <c:forEach items="${hotBooks}" var="hotBook">
                        <div class="card col-lg-2"
                             style="height: 500px;width: 200px;padding: 10px;margin-right: 10px;border: #f8bf0f solid 3px;border-radius: 30px">
                            <input type="hidden" value="${hotBook.bookId}">
                            <img class="card-img-top" src="${pageContext.request.contextPath}/images/shop2.jpg"
                                 width="175px" height="300px">
                            <div class="card-body">
                                <h5 class="card-title">${hotBook.bookName}</h5>
                                <span class="user clearfix pull-right">
                                    ￥${hotBook.bookPrice}
                                </span>
                                <p class="card-text">${hotBook.bookDescription}</p>
                                <div class="attention pull-right">
                                    加入购物车 <i class="icon iconfont icon-gouwuche"></i>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div style="margin-left: 30px">
            <div class="row">
                <h1>新书上市</h1>
                <hr/>
            </div>

            <div class="row">
                <c:forEach items="${newBooks}" var="newBook">
                    <div class="card col-lg-2"
                         style="height: 500px;width: 200px;padding: 10px;margin-right: 10px;border: #f8bf0f solid 3px;border-radius: 30px">
                        <input type="hidden" value="${newBook.bookId}">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/images/shop2.jpg"
                             width="175px" height="300px">
                        <div class="card-body">
                            <h5 class="card-title">${newBook.bookName}</h5>
                            <span class="user clearfix pull-right">
                                    ￥${newBook.bookPrice}
                                </span>
                            <p class="card-text">${newBook.bookDescription}</p>
                            <div class="attention pull-right">
                                加入购物车 <i class="icon iconfont icon-gouwuche"></i>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">x</span></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-5">
                        <div class="modal-tab">
                            <div class="tab-content product-details-large">
                                <div class="tab-pane active " id="image-1">
                                    <img src="${pageContext.request.contextPath}/images/shop1.jpg" alt=""
                                         style="width: 200px;height: 300px"/>
                                </div>
                                <div class="tab-pane" id="image-2">
                                    <img src="${pageContext.request.contextPath}/images/shop2.jpg" alt=""/>
                                </div>
                                <div class="tab-pane" id="image-3">
                                    <img src="${pageContext.request.contextPath}/images/shop3.jpg" alt=""/>
                                </div>
                            </div>
                            <div class="row product-details-small quickview-active" style="margin:10px 10px 0 0">
                                <a class="active" href="#image-1"><img
                                        src="${pageContext.request.contextPath}/images/shop1.jpg"
                                        style="width: 65px;height: 100px" alt=""/></a>
                                <a href="#image-2"><img src="${pageContext.request.contextPath}/images/shop2.jpg"
                                                        style="width: 65px;height: 100px" alt=""/></a>
                                <a href="#image-3"><img src="${pageContext.request.contextPath}/images/shop3.jpg"
                                                        style="width: 65px;height: 100px" alt=""/></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-7 col-xs-12">
                        <div class="modal-pro-content">
                            <h3>Chaz Kangeroo Hoodie3</h3>
                            <div class="price">
                                <span>$70.00</span>
                            </div>
                            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis
                                egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet.</p>
                            <form action="#">
                                <input type="number" value="1"/>
                                <button>Add to cart</button>
                            </form>
                            <span><i class="fa fa-check"></i> In stock</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal end -->


</body>
</html>
