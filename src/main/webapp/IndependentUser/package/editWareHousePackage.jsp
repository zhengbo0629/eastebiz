<%@ page import="com.eastebiz.entity.EbizUser" %>
<%@ page import="com.eastebiz.entity.EbizCompany" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../static/lib/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="../../static/lib/bootstrap-table/bootstrap-table.js"></script>


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
                            <a class="mobile-link" href="${pageContext.request.contextPath}/company/compayModify.jsp">账户设置</a> |
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
           <div class="col-md-9 ">
                   <div class="col-md-12 text-center">
                       <h3>首页面</h3>
                   </div>
               <div class="row">
                   <div class="container">
                       <div id="wrapper">
                           <div
                                   id="wrapperContent">
                               <div align="center" style="padding-bottom: 1px; padding-top: 10px;">
                                   <h3>更新包裹</h3>
                               </div>
                               <div class="form" style="width: 43%; margin-left: 1%;margin-right: 2%; float: left;">
                                   <form name="edit" id="edit" action="/package/editWareHousePackage"
                                         method="post">
                                       <br>
                                       <h4 style="padding-bottom: 0px">Package UID:<label id="id" ></label></h4>
                                       <br>
                                       <h4 style="padding-bottom: 0px">Product Name:</h4>
                                       <textarea id="productName" name="productName" style="border: none; background-color: transparent; resize: none;" rows="4" cols="58" readonly></textarea>
                                       <br> <br>
                                       <h4 style="padding-bottom: 0px">Shipping Address:</h4>
                                       <input style="width: 420px; border: none; background-color: transparent;" type="text" id="shippingAddress" name="shippingAddress" readonly="readonly" /> <br>
                                       <br>
                                       <h4 style="padding-bottom: 0px">Total Quantity:</h4>
                                       <input style="width: 420px;" type="number" id="quantity" name="quantity"  readonly="readonly" onchange="quantityChange()" /> <br> <br>
                                       <h4 style="padding-bottom: 0px">CreditCard Information:</h4>
                                       <textarea id="creditCardNumber" name="creditCardNumber" style="resize: none;" rows="8" cols="58"></textarea><br><br>
                                       <br>
                                       <input style="width: 200px" type="hidden" id="trackingNumber" name="trackingnumber" readonly="readonly" />
                                       <input style="width: 200px" type="hidden" id="packageId" name="packageId" readonly="readonly" />
                                       <input style="width: 200px" type="hidden" id="totalQuantity" name="totalQuantity" value="" readonly="readonly" />
                                       <input style="width: 200px" type="hidden" id="basePrice" name="basePrice" readonly="readonly" />
                                       <input style="width: 200px" type="hidden" id="promPrice" name="promPrice" readonly="readonly" />
                                       <input style="width: 200px" type="hidden" id="promQuantity" name="promQuantity" readonly="readonly" />
                                       <div style="text-align: center;">
                                           <input type="button" id="InStock" name="InStock" value="submit"
                                                  onClick="checkboxprocess()" />
                                       </div>
                                   </form>
                               </div>
                               <div id=trackingTableDiv style="width: 53%; font-size: 14px; float: left; line-height: 20px; margin-top: 40px;">
                                   <table id="trackingTable">
                                       <tr>
                                           <th><h4 style="padding-bottom: 0px">Row</h4></th>
                                           <th><h4 style="padding-bottom: 0px">Tracking Number</h4></th>
                                           <th><h4 style="padding-bottom: 0px">Quantity</h4></th>
                                       </tr>

                                       <tr>
                                           <TD>1</TD>
                                           <TD><INPUT
                                                   style="width: 97%; vertical-align: middle; height: 30px; margin-bottom: 0px; margin-top: 0px; font-size: 12px;"
                                                   type="text" name="Tracking1" id="Tracking1"
                                                   placeholder="Tracing Number 1" /></TD>
                                           <TD><INPUT
                                                   style="width: 97%; vertical-align: middle; height: 30px; margin-bottom: 0px; margin-top: 0px; font-size: 12px;"
                                                   type="number" name="Quantity1" id="Quantity1"
                                                   placeholder="Quantity 1" /></TD>
                                       </tr>

                                       <tr>
                                           <TD>2</TD>
                                           <TD><INPUT
                                                   style="width: 97%; vertical-align: middle; height: 30px; margin-bottom: 0px; margin-top: 0px; font-size: 12px;"
                                                   type="text" name="Tracking2" id="Tracking2"
                                                   placeholder="Tracing Number 2" /></TD>
                                           <TD><INPUT
                                                   style="width: 97%; vertical-align: middle; height: 30px; margin-bottom: 0px; margin-top: 0px; font-size: 12px;"
                                                   type="number" name="Quantity2" id="Quantity2"
                                                   placeholder="Quantity 2" /></TD>
                                       </tr>


                                       <tr>
                                           <TD>3</TD>
                                           <TD><INPUT
                                                   style="width: 97%; vertical-align: middle; height: 30px; margin-bottom: 0px; margin-top: 0px; font-size: 12px;"
                                                   type="text" name="Tracking3" id="Tracking3"
                                                   placeholder="Tracing Number 3" /></TD>
                                           <TD><INPUT
                                                   style="width: 97%; vertical-align: middle; height: 30px; margin-bottom: 0px; margin-top: 0px; font-size: 12px;"
                                                   type="number" name="Quantity3" id="Quantity3"
                                                   placeholder="Quantity 3" /></TD>
                                       </tr>


                                       <tr>
                                           <TD>4</TD>
                                           <TD><INPUT
                                                   style="width: 97%; vertical-align: middle; height: 30px; margin-bottom: 0px; margin-top: 0px; font-size: 12px;"
                                                   type="text" name="Tracking4" id="Tracking4"
                                                   placeholder="Tracing Number 4" /></TD>
                                           <TD><INPUT
                                                   style="width: 97%; vertical-align: middle; height: 30px; margin-bottom: 0px; margin-top: 0px; font-size: 12px;"
                                                   type="number" name="Quantity4" id="Quantity4"
                                                   placeholder="Quantity 4" /></TD>
                                       </tr>

                                       <tr>
                                           <TD>5</TD>
                                           <TD><INPUT
                                                   style="width: 97%; vertical-align: middle; height: 30px; margin-bottom: 0px; margin-top: 0px; font-size: 12px;"
                                                   type="text" name="Tracking5" id="Tracking5"
                                                   placeholder="Tracing Number 5" /></TD>
                                           <TD><INPUT
                                                   style="width: 97%; vertical-align: middle; height: 30px; margin-bottom: 0px; margin-top: 0px; font-size: 12px;"
                                                   type="number" name="Quantity5" id="Quantity5"
                                                   placeholder="Quantity 5" /></TD>
                                       </tr>

                                   </table>
                                   <div style="text-align: center;">
                                       <input style="width: 200px" type="button" id="addRows"
                                              name="moreRow" value="More Rows" onClick="addRow()" />
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>

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
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/allUnCheckedPackForCompany.jsp'>对单</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='allUnLabeledPackForCompany.jsp'>发送Lable</a></div>
                   <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/allUnPaidPackForCompany.jsp'>支付用户</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='sendEmail.jsp'>发邮件</a></div>

                   <div class="col-md-12">
                       任务操作
                    </div>

                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/queryReportPackage.jsp'>领票/预报</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/querySellorobo.jsp'>求收购/议价</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/unReceivedPacAndUnConfirmed.jsp'>更新包裹信息</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/shippedPackOrUnMatchedPack.jsp'>修改 Tracking Number</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/unPaidPac.jsp'>更新信用卡信息</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/packingPac.jsp'>打包包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/livingDeal.jsp'>正在收购</a></div>

                   <div class="col-md-12">
                        查看包裹
                   </div>

                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/allPack.jsp'>所有包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/unConfirmedSellOrOBOPack.jsp'>未确认包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/unReceivedPac.jsp'>未发货包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/shippedPack.jsp'>途中包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/instockPack.jsp'>在家包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/unPaidPac.jsp'>待结算包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/paidPac.jsp'>已结算包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/shipCompletePac.jsp'>邮寄完成包裹</a></div>
                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/IndependentUser/package/unMatchPac.jsp'>不匹配包裹</a></div>

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

    var params ;
    $(document).ready(function () {
        params = getParameters();
        //初始化页面数据
        initPage();
    });

    function initPage() {
        //后台获取数据
        var layerIndex = layer.load(1);
        $.ajax({
            type: 'GET',
            url: "/package/findPackageById",
            data: params,
            async: true,
            success: function (res) {
                console.log(res)
                layer.close(layerIndex);
                if (res.data.state === "000000") {
                    //console.log(res.data);
                    //解析数据
                    pushData(res);
                } else {
                    //业务错误提示
                    // TODO  根据不同错误不同处理
                    swalError(res.message);
                }
            }, error: function (res) {
                layer.close(layerIndex);
                swalSysError(res);
            }
        });
    }

    function pushData(res) {
        //清空表格
        $("#dataTable tr:not(:first)").empty();
        var data = res.data;
        data = data.data;
        console.log(data);
        $("#id").html(data.id);
        $("#modelNumber").val(data.modelNumber);
        $("#shippingAddress").val(data.shippingAddress);
        $("#productName").val(data.productName);
        $("#creditCardNumber").val(data.creditCardNumber);
        $("#basePrice").val(data.basePrice);
        $("#promPrice").val(data.promPrice);
        $("#promQuantity").val(data.promQuantity);
        $("#packageId").val(data.id);
        $("#quantity").val(data.quantity);
        $("#trackingNumber").val(data.trackingNumber);
    }

    //避免页面上出现 null
    function emptyFormatter(data) {
        if (!data) {
            return ""
        }
        return data;
    }

    //优化页面显示
    function statusFormatter(data) {
        if (!data) {
            return '';
        }
        if (data === 'Complete')
            return '<span class="badge badge-pill badge-success">' + data + '</span>';
        else if (data === 'Deleted')
            return '<span class="badge badge-pill  badge-danger">' + data + '</span>';
        else return '<span class="badge badge-pill  badge-default">' + data + '</span>';
    }

    //优化页面显示
    function moneyFormatter(data) {
        if (!data) {
            return '';
        }
        return data + " $";
    }

    //单个产品进行修改
    function Simple_Update_Product(obj){
        window.location.href="/view/EbizProduct/toEditProductPage?productId="+obj;
    }

    function addRow() {
        for (var i = 0; i < 5; i++) {
            var table = document.getElementById("trackingTable");
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            var cell1 = row.insertCell(0);
            cell1.innerHTML = rowCount;
            var cell2 = row.insertCell(1);
            var element1 = document.createElement("input");
            element1.type = "text";
            element1.name = "Tracking" + rowCount;
            element1.id = "Tracking" + rowCount;
            element1.placeholder = "Tracing Number " + rowCount;
            element1.style = "width: 97%; vertical-align:middle; height:30px; margin-bottom: 0px; margin-top: 0px;font-size: 12px;";
            cell2.appendChild(element1);
            var cell3 = row.insertCell(2);
            var element2 = document.createElement("input");
            element2.type = "number";
            element2.name = "Quantity" + rowCount;
            element2.id = "Quantity" + rowCount;
            element2.placeholder = "Quantity " + rowCount;
            element2.style = "width: 95%; vertical-align:middle; height:30px; margin-bottom: 0px; margin-top: 0px;font-size: 12px;";
            cell3.appendChild(element2);
        }
    }

    function checkboxprocess() {
        var totalQuantity = parseInt("0");
        var table = document.getElementById("trackingTable");
        var rowCount = table.rows.length;
        var trackingString = "";
        for (i = 1; i < rowCount; i++) {
            var tracking = document.getElementById("Tracking" + i).value;
            var quantityString = document.getElementById("Quantity" + i).value;

            if (tracking.length <= 5 && quantityString.length != 0) {
                alert("tracking " + i + " is not good, Please check");
                return;
            }
            if (tracking.length != 0 && quantityString.length == 0) {
                alert("Quantity " + i + " is not good, Please check");
                return;
            }
            if (quantityString.length != 0 && parseInt(quantityString) == 0) {
                alert("Quantity " + i + " is not good, Please check");
                return;
            }
            if (tracking.length == 0 && quantityString.length == 0) {
                continue;
            }
            var quantity = parseInt(quantityString);
            trackingString = trackingString
                + tracking.replace(/[^A-Za-z0-9]/g, '') + "_"
                + quantityString + "?";
            totalQuantity = totalQuantity + quantity;
        }
        //document.write(totalQuantity);
        var inputQuantity = parseInt(document.getElementById("quantity").value);
        alert(inputQuantity);
        alert(totalQuantity);
        if (totalQuantity != inputQuantity && totalQuantity != 0) {
            alert("Quantity in all packages does not match the Total Quantity, Please check");
            return;
        }
        trackingString = trackingString.substring(0,
            trackingString.length - 1);
        $("#trackingnumber").val(trackingString);
        $("#totalQuantity").val(totalQuantity);
        alert(123);
        $("#edit").ajaxSubmit({
            beforeSubmit : function() {
                // alert("我在提交表单之前被调用！");
            },
            success : function(data) {
                if (data.length > 0) {
                    alert(data);
                } else {
                    alert("Tracking Update Sucessfully");
                    //location.href = "shippedPack.jsp";
                    history.back(-1);
                    //document.getElementById("edit").submit();
                }
            }
        });
    }



</script>

</body>
</html>
