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
        $(function () {
            $('.card').click(function () {
                var bookId = $(this).children().val();
                alert(bookId);
                $.post(
                    '${pageContext.request.contextPath}/front/bookstore/queryByBookId',
                    {"bookId": bookId},
                    function (responseResult) {
                        $('#bookId_qid').val(responseResult.obj.bookId)
                        $('#bookImage_qid').attr('src', '${pageContext.request.contextPath}/front/bookstore/showPic?image=' + responseResult.obj.bookImage);
                        $('#bookName_qid').text(responseResult.obj.bookName);
                        $('#bookPrice_qid').text(responseResult.obj.bookPrice);
                        $('#bookDescription_qid').text(responseResult.obj.bookDescription)
                    });
                $('#bookDetail').modal('show');
            });
        });


        function queryByBookTypeId(bookTypeId) {
            $.post(
                '${pageContext.request.contextPath}/front/bookstore/queryByBookTypeId'
            )
        }

        function addToCart(bookId) {
            $.post(
                '${pageContext.request.contextPath}/front/cart/addToCart',
                {
                    "bookId": bookId,
                    "num":$('#num').val()
                },
                function (responseResult) {
                    alert(1);
                }
            )
        }

        $(document).ready(function () {
            //var temp = "none";

            $("#${bookType.bookTypeName}类型的书").click(function () {
                document.getElementById('booksByBookType').style.display = "block";
            });

            /* function openMatter(obj) {
                 for (var i = 1; i < 12; i++) {
                     if (i == obj) {
                         temp = "block";
                     } else {
                         temp = "none";
                     }
                     document.getElementById("matter" + i).style.display = temp;

                 }
             }*/
        })
    </script>
</head>
<body>
<jsp:include page="top.jsp"/>

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
                <div>
                    <h1>全场免运费</h1>
                </div>
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
                                id="${bookType.bookTypeName}类型的书"
                                onclick="queryByBookTypeId(${bookType.bookTypeId})">
                                <a>${bookType.bookTypeName}</a></li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>

        <div class="col-lg-9">

            <div style="margin-left: 30px" id="default">
                <!--引入外部文件，即需要在右侧加载的内容-->
                <jsp:include page="default.jsp"/>
            </div>

            <div id="booksByBookType" style="display: none">
                <jsp:include page="booksByBookType.jsp"/>
            </div>

            <%-- <div style="margin-left: 30px">


                 <div class="row">
                     <h1>热销书籍</h1>
                     <hr/>
                 </div>

                 <div class="row">
                     <c:forEach items="${hotBooks}" var="hotBook">
                         <div class="card col-lg-2">
                             <input type="hidden" class="hbi" value="${hotBook.bookId}">
                             <img class="card-img-top"
                                  src="${pageContext.request.contextPath}/front/bookstore/showPic?image=${hotBook.bookImage}"
                                  alt="${hotBook.bookImage}"
                                  width="175px" height="200px">
                             <div class="card-body">
                                 <h4 class="card-title">《${hotBook.bookName}》</h4>
                                 <label>作者 ：${hotBook.bookAuthor}</label>
                                 <span class="user clearfix pull-right"
                                       style="margin-top: 20px;font-size: large;color: #f8bf0f">
                                     ￥${hotBook.bookPrice}
                                 </span>
                                     &lt;%&ndash;  <p class="card-text">${hotBook.bookDescription}</p>&ndash;%&gt;
                                     &lt;%&ndash;  <div class="attention pull-right">
                                           加入购物车 <i class="icon iconfont icon-gouwuche"></i>
                                       </div>&ndash;%&gt;
                             </div>
                         </div>
                     </c:forEach>
                 </div>

             </div>

             <div style="margin-left: 30px">
                 <div class="row">
                     <h1>新书上市</h1>
                     <hr/>
                 </div>

                 <div class="row">
                     <c:forEach items="${newBooks}" var="newBook">
                         <div class="card col-lg-2">
                             <input type="hidden" value="${newBook.bookId}">
                             <img class="card-img-top"
                                  src="${pageContext.request.contextPath}/front/bookstore/showPic?image=${newBook.bookImage}"
                                  width="175px" height="200px">
                             <div class="card-body">

                                 <h4 class="card-title">《${newBook.bookName}》</h4>
                                 <label>作者 ：${newBook.bookAuthor}</label>
                                 <span class="user clearfix pull-right"
                                       style="margin-top: 20px;font-size: large;color: #f8bf0f">
                                     ￥${newBook.bookPrice}
                                 </span>

                                     &lt;%&ndash;<p class="card-text">${newBook.bookDescription}</p>&ndash;%&gt;
                                     &lt;%&ndash; <div class="attention pull-right">
                                          加入购物车 <i class="icon iconfont icon-gouwuche"></i>
                                      </div>&ndash;%&gt;
                             </div>
                         </div>
                     </c:forEach>
                 </div>
             </div>
 --%>
        </div>

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
                                <p class="col-lg-12" id="bookDescription_qid"></p>
                                <div class="row">
                                    <span class="col-lg-6" style="float: left">
                                         <input type="number" value="1" name="num" id="num" style="width: 50px"/>
                                    </span>
                                    <span class="col-lg-6">
                                          <button onclick="addToCart($('bookId_qid').val())">加入购物车</button>
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
