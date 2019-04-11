<%@ page import="com.eastebiz.entity.EbizUser" %>
<%@ page import="com.eastebiz.entity.EbizCompany" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/lib/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../static/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="../static/lib/bootstrap-table/bootstrap-table.js"></script>

    <script type="text/javascript">
        window.onload=function(){
            setInterval(function(){
                var date=new Date();
                var year=date.getFullYear(); //获取当前年份
                var mon=date.getMonth()+1; //获取当前月份
                var da=date.getDate(); //获取当前日
                var day=date.getDay(); //获取当前星期几
                var h=date.getHours(); //获取小时
                var m=date.getMinutes(); //获取分钟
                var s=date.getSeconds(); //获取秒
                var d=document.getElementById('datetime');
                d.innerHTML='当前时间:'+year+'年'+mon+'月'+da+'日'+'星期'+day+' '+h+':'+m+':'+s;  },1000)
        }



    </script>

</head>
<body>

<%
    EbizUser ebizUserbizUser = (EbizUser) session.getAttribute("EbizUser");
    EbizCompany ebizCompany = (EbizCompany) session.getAttribute("EbizCompany");
    if (ebizUserbizUser != null || ebizCompany!= null) {
    }else{
        response.sendRedirect(request.getContextPath()+"/homepage/homepage.jsp");
        return;
    }

%>


<!-- 顶部 -->
<header id="header-main">
    <div class="main-topbar">
        <div class="container">
            <div class="row">
                <div class="col-md-2 "><a class="mobile-link" href="${pageContext.request.contextPath}/DropOut/dropOut"><h1 class="eastebiz">EastEbiz</h1></a></div>
                <div class="col-md-4"></div>
                <div class="col-md-6 text-right">
                    <span>
                        <div style="float: right; padding-top: 10px;">
                        <div style="font-size: 12px;">
                             <a class="mobile-link" href="userAccountSetting.jsp" style=""> 欢迎您！
                                ${sessionScope.EbizCompany.owerName},${sessionScope.EbizCompany.companyName}
                             </a>,
                            <a class="mobile-link" href="${pageContext.request.contextPath}/DropOut/dropOut" style="">退出</a> |
                            <a class="mobile-link" href="userAccountSetting.jsp">账户设置</a> |
                            <a class="mobile-link" href="dnusermanual.jsp">用户手册</a>
            </div>

            <div id="datetime" style="font-size: 12px; color: black; padding-top: 3px;">
                <!-- 方式一<script>
                     setInterval("document.getElementById('datetime').innerHTML=new Date().toLocaleString();", 1000);
                 </script>-->
            </div>
                            <!-- 原始<div style="font-size: 14px; color: #666666; padding-top: 3px;">
                                        Pay Every Two Weeks: Next Payment Date: (M-D-Y) 03-15-2019

                            </div>-->
        </div>

                    </span>
                </div>
            </div>
        </div>
    </div>
</header>

<%--  --%>
<section id="section-space2">
</section>





<section id="menu-section">
    <div class="menu-div">
        <div class="row">
            <div class="col-md-10 ">
                <div class="col-md-12 text-center">
                    <h3>修改产品</h3>
                </div>

                <%-- 按钮  --%>
                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-6 text-right">
                        <a class="btn btn-default" style="background-color: #aeffc8" href="${pageContext.request.contextPath}/product/activeAllProduct.jsp" role="button">Active Product</a>
                        <a class="btn btn-default" style="background-color: #aeffc8" href="${pageContext.request.contextPath}/product/queryAllProduct.jsp" role="button">All Product</a>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-1 "></div>
                    <div class="col-md-10 ">


                        <form id="userloginForm"   action="${pageContext.request.contextPath}/Product/registerProductAndAmendbProduct" method="post" >

                            <div class="row">
                                <div class="form-group">
                                    <input input type="text" class="form-control" id="Product-id" name="id" value="${sessionScope.product.id}" hidden>
                                    <div class="row">
                                        <div class="col-md-1"><span>Model:</span></div>
                                        <div class="col-md-3">
                                            <input type="text" class="form-control" id="Product-model" name="model" placeholder="Model" value="${sessionScope.product.model}" autofocus required>
                                        </div>

                                        <div class="col-md-1"><span>Status:</span></div>
                                        <div class="col-md-4">
                                            <select class="form-control" name="status" id="Product-status">
                                                <option selected="selected" value="0">Please Chose</option>
                                                <option value="Active">Active</option>
                                                <option value="UnActive">UnActive</option>
                                                <option value="LiveDeal">LiveDeal</option>
                                                <option value="Deleted">Deleted</option>
                                            </select>
                                        </div>
                                        <div CLASS="col-md-3"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    Product Name: length less than 250
                                    <div class="col-md-12">
                                        <input type="text" id="Product-productName" class="form-control" name="productName" placeholder="ProductName" value="${sessionScope.product.productName}" autofocus required>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1"><span>Brand:</span></div>
                                    <div class="col-md-2">
                                        <input type="text" id="Product-brand" class="form-control" name="brand" placeholder="Brand"  value="${sessionScope.product.brand}">
                                    </div>

                                    <div class="col-md-1"><span>SKU:</span></div>
                                    <div class="col-md-2">
                                        <input type="text" id="Product-sku" class="form-control" name="sku" placeholder="SKU" value="${sessionScope.product.sku}">
                                    </div>

                                    <div class="col-md-1"><span>UPC:</span></div>
                                    <div class="col-md-2">
                                        <input type="text" id="Product-upc" class="form-control" name="upc" placeholder="UPC" value="${sessionScope.product.upc}">
                                    </div>

                                    <div class="col-md-1"><span>ASIN:</span></div>
                                    <div class="col-md-2">
                                        <input type="text" id="Product-ASIN" class="form-control" name="asin" placeholder="ASIN" value="${sessionScope.product.asin}">
                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1"><span>Web Address:</span></div>
                                    <div class="col-md-11">
                                        <input type="text" id="Product-URI" class="form-control" name="URI" placeholder="URI" value="${sessionScope.product.URI}">
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1"><span>Tickets:</span></div>
                                    <div class="col-md-1">
                                        <input type="text" id="Product-tickets" class="form-control" name="tickets" placeholder="0" value="${sessionScope.product.tickets}">
                                    </div>

                                    <div class="col-md-1"><span>Personal Limit: </span></div>
                                    <div class="col-md-1">
                                        <input type="text" id="Product-limitPerPerson" class="form-control" name="limitPerPerson" placeholder="0" value="${sessionScope.product.limitPerPerson}">
                                    </div>

                                    <div class="col-md-1"><span>W(LB):</span></div>
                                    <div class="col-md-1">
                                        <input type="text" id="Product-weight" class="form-control" name="weight" placeholder="0.0" value="${sessionScope.product.weight}">
                                    </div>

                                    <div class="col-md-1"><span>L(inch):</span></div>
                                    <div class="col-md-1">
                                        <input type="text" id="Product-length" class="form-control" name="length" placeholder="0.0" value="${sessionScope.product.length}">
                                    </div>

                                    <div class="col-md-1"><span>W(inch):</span></div>
                                    <div class="col-md-1">
                                        <input type="text" id="Product-width" class="form-control" name="width" placeholder="0.0" value="${sessionScope.product.width}">
                                    </div>

                                    <div class="col-md-1"><span>H(inch):</span></div>
                                    <div class="col-md-1">
                                        <input type="text" id="Product-height" class="form-control" name="height" placeholder="0.0" value="${sessionScope.product.height}">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">

                                    <div class="col-md-6">
                                        下单到家里的收货价格：
                                        <div class="row">
                                            <div class="col-md-3">
                                                价格:
                                                <input type="text" id="Product-homeBasePrice" class="form-control" name="homeBasePrice" placeholder="0.0" value="${sessionScope.product.homeBasePrice}">
                                            </div>

                                            <div class="col-md-3">
                                                加价收购数量:
                                                <input type="text" id="Product-homePromotQuantity" class="form-control" name="homePromotQuantity" placeholder="0" value="${sessionScope.product.homePromotQuantity}">
                                            </div>

                                            <div class="col-md-3">

                                                加价收购价格:
                                                <input type="text" id="Product-homePromotPrice" class="form-control" name="homePromotPrice" placeholder="0.0" value="${sessionScope.product.homePromotPrice}">
                                            </div>

                                            <div class="col-md-3"></div>
                                        </div>
                                    </div>





                                    <div class="col-md-6">
                                        下单到仓库的收货价格：
                                        <div class="row">
                                            <div class="col-md-3">
                                                价格:
                                                <input type="text" id="Product-wareHouseBasePrice" class="form-control" name="wareHouseBasePrice" placeholder="0.0" value="${sessionScope.product.wareHouseBasePrice}">
                                            </div>

                                            <div class="col-md-3">
                                                加价收购数量:
                                                <input type="text" id="Product-wareHousePromotQuantity" class="form-control" name="wareHousePromotQuantity" placeholder="0" value="${sessionScope.product.wareHousePromotQuantity}">
                                            </div>

                                            <div class="col-md-3">

                                                加价收购价格:
                                                <input type="text" id="Product-wareHousePromotPrice" class="form-control" name="wareHousePromotPrice" placeholder="0.0" value="${sessionScope.product.wareHousePromotPrice}">
                                            </div>

                                            <div class="col-md-3"></div>
                                        </div>
                                    </div>


                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    Note:
                                    <div class="col-md-12">
                                        <input type="text" id="Product-mnote" class="form-control" name="mnote"  placeholder="mnote" value="${sessionScope.product.mnote}">
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-5"></div>
                                    <div class="col-md-2 text-center">
                                        <button type="submit" class="btn btn-default"><h4>submit</h4></button>
                                    </div>
                                    <div class="col-md-5"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-1 "></div>
                </div>

            </div>


            <%-- 菜单栏 --%>
            <div class="col-md-2 text-left"  style="background-color: #aeffc8">
                <!--右侧栏-->
                <div id="wrapperSideBar">

                    <div class="col-md-12">
                        系统Deal订阅管理
                    </div>

                    <div class="col-md-12"><a class="mobile-link" href='livingDeal.jsp'>热门产品</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='livingDeal.jsp'>系统推荐产品</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='livingDeal.jsp'>所有产品</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='livingDeal.jsp'>我的订阅产品</a></div>

                    <div class="col-md-12">
                        公司信息管理
                    </div>

                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/company/companyAccountSetting.jsp'>公司账户管理</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='/Member/FinanceList.aspx'>公司财务</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='/Member/FinanceList.aspx'>公司账户充值</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='nurseUserManage.jsp'>用户管理</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='deleteUser.jsp'>删除用户</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='/Member/FinanceList.aspx'>用户分析</a></div>


                    <div class="col-md-12">
                        添加用户操作
                    </div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/company/queryAllUser.jsp'>查看所有用户</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/company/addUser.jsp'>添加新用户</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/company/companyAdding.jsp'>收到新请求</a></div>


                    <div class="col-md-12">
                        公司产品管理
                    </div>

                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/product/queryAllProduct.jsp'>产品管理</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='allDealSendToNurseManage.jsp'>Deal管理</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/product/queryAllPackForCompany.jsp'>包裹管理</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/product/inventory.jsp'>库存管理</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/allUnCheckedPackForCompany.jsp'>对单</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='allUnLabeledPackForCompany.jsp'>发送Lable</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/allUnPaidPackForCompany.jsp'>支付用户</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='sendEmail.jsp'>发邮件</a></div>

                    <div class="col-md-12">
                        任务操作
                    </div>

                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/queryReportPackage.jsp'>领票/预报</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/querySellorobo.jsp'>求收购/议价</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/unReceivedPacAndUnConfirmed.jsp'>更新包裹信息</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/shippedPackOrUnMatchedPack.jsp'>修改 Tracking Number</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/unPaidPac.jsp'>更新信用卡信息</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/packingPac.jsp'>打包包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/livingDeal.jsp'>正在收购</a></div>

                    <div class="col-md-12">
                        查看包裹
                    </div>

                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/allPack.jsp'>所有包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/unConfirmedSellOrOBOPack.jsp'>未确认包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/unReceivedPac.jsp'>未发货包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/shippedPack.jsp'>途中包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/instockPack.jsp'>在家包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/unPaidPac.jsp'>待结算包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/paidPac.jsp'>已结算包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/shipCompletePac.jsp'>邮寄完成包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/package/unMatchPac.jsp'>不匹配包裹</a></div>

                    <div class="col-md-12">
                        仓库管理
                    </div>

                    <div class="col-md-12"><a class="mobile-link" href='receivePackageWeb.jsp'>接受包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='livingDeal.jsp'>打包</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='livingDeal.jsp'>库存管理</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='livingDeal.jsp'>仓库订单管理</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='livingDeal.jsp'>仓库包裹管理</a></div>

                </div>

            </div>
            <%--<div class="col-md-1 "></div>--%>
        </div>
    </div>
</section>

</body>
</html>
