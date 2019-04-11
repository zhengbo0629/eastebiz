
<%@ page import="com.eastebiz.entity.EbizUser" %>
<%@ page import="com.eastebiz.entity.EbizCompany" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../../static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../static/lib/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../../static/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="../../static/lib/bootstrap-table/bootstrap-table.js"></script>

    <script type="text/javascript">

        var ids= new Array();
        var status;

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


        $(function () {
            var tableColumns = [
                {field: 'fx',checkbox:true},
                {field: 'id', title: 'ID'},
                {field: 'userName', title: '用户名'},
                {field: 'model', title: 'Model'},
                {field: 'productName', title: 'productName'},
                {field: 'packageQuantity', title: '数量'},
                {field: 'submitPrice', title: '价格'},
                {field: 'shippingAddress', title: '地址'},
                {field: 'status  ', title: '邮寄状态'},
                {field: 'trackingNumber  ', title: '包裹单号'},
                {field: 'Button', title: '操作',
                    formatter: AddFunctionAlty,}
            ];




            $('#allCurrentCheckingTasksForUser-table').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格


            $('#allCurrentCheckingTasksForUser-table').bootstrapTable({//表格初始化
                columns: tableColumns,  //表头
                //data: //通过ajax返回的数据
                url:"${pageContext.request.contextPath}/packageList/queryCheckedStatusPackage",

                height:600,
                method: 'post',
                pageSize: 2,
                pageNumber: 1,
                pageList: [5,10,15],
                cache: false,
                uniqueId: "ID",
                striped: true,
                pagination: true,
                sidePagination: 'client',
                /*search: true,
                searchOnEnterKey:true,
                searchAlign:'left',
                showRefresh: true,
                showExport: true,
                showFooter: true,*/
                // exportTypes: ['csv', 'txt', 'xml'],
                clickToSelect: true,


            });

        });


        function AddFunctionAlty(value,row,index) {
            return['<button id="update-button" type="button"  onclick="update('+row.id+')" class="btn btn-default-update">更新状态</button>',
                '<button id="update-button" type="button"  onclick="batchCancel('+row.id+')" class="btn btn-default-update">取消</button>'].join("")
        }

        //单个修改

        function update(id) {
            $("#package-ids").val(id);
            $("#upload").modal('show');
        }


        //取消
        function batchCancel(id) {
            $.ajax({
                type:"post",
                async:false,
                url:"${pageContext.request.contextPath}/packageList/amendUnCheckedStatusPackage",
                data:"ids="+id,
                success:function () {
                    location.href="allCurrentCheckingTasksForUser.jsp";
                }
            })
        }

        //复选
        //批量取消
        function checkbox() {
            var newid = $("#allCurrentCheckingTasksForUser-table").bootstrapTable('getSelections');
            for (var i = 0; i < newid.length; i++) {
                //数组赋值
                ids[i] = newid[i].id;
            };
            $.ajax({
                type:"post",
                async:false,
                url:"${pageContext.request.contextPath}/packageList/amendUnCheckedStatusPackage",
                data:"ids="+ids,
                success:function () {
                    location.href="allCurrentCheckingTasksForUser.jsp";
                }
            })
        };


        //批量修改状态

        //获取下拉框的值
        function selChange() {
            var options=$("#EbizStatus-starLevel option:selected");
            status= options.val();

        }



        function PassValue() {
            var newid = $("#allCurrentCheckingTasksForUser-table").bootstrapTable('getSelections');
            for (var i = 0; i < newid.length; i++) {
                //数组赋值
                ids[i] = newid[i].id;

            };
            $.ajax({
                type:"post",
                async:false,
                url:"${pageContext.request.contextPath}/packageList/amendPackageStatus",
                data:"ids="+ids+"&status="+status,
                success:function () {

                }
            })
        };




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


<%-- 弹出框  修改 --%>
<div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <form action="${pageContext.request.contextPath}/packageList/amendPackageStatus" method="post" >
        <<div class="modal-dialog">
        <div class="modal-content ">
            <div class="modal-header ">
                更新状态
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <input type="text" class="form-control" name="ids" id="package-ids" hidden autofocus required>
                <div ><span>选择状态:</span></div>
                <div>
                    <select class="form-control" name="status">
                        <option selected="selected" value="0">Choose a status</option>
                        <option value="UnMatch Model">UnMatch Model</option>
                        <option value="UnMatch Number">UnMatch Number</option>
                        <option value="UnMatch Model Number">UnMatch Model Number</option>
                        <option value="ShippedComplete">ShippedComplete</option>

                    </select>
                </div>
            </div>

            <div class="modal-footer">
                <input type="submit" value="提交" id="shangchuan">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>--%>
        <!-- /.modal -->
    </form>
</div>


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
                    <h3>所有领取的对单任务(All Taken Checking Tasks)</h3>
                </div>
                <%-- 按钮  --%>
                <div class="row">
                    <div class="col-md-6"><a class="btn btn-default" style="background-color: #aeffc8" onclick="checkbox()" href="#" role="button">批量取消任务</a></div>
                    <div class="col-md-6 text-right">
                        <a class="btn btn-default" style="background-color: #aeffc8" href="${pageContext.request.contextPath}/IndependentUser/package/allUnCheckedPackForCompany.jsp" role="button">未领取任务</a>
                        <a class="btn btn-default" style="background-color: #aeffc8" href="#" role="button">已完成任务</a>
                    </div>
                </div>

                <form id="Form"  method="post" >

                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-1 "><span>状态:</span></div>
                            <div class="col-md-2 ">
                                <select class="form-control" onchange="selChange()" id="EbizStatus-starLevel">
                                    <option selected="selected" value="0">Choose a status</option>
                                    <option value="UnMatch Model">UnMatch Model</option>
                                    <option value="UnMatch Number">UnMatch Number</option>
                                    <option value="UnMatch Model Number">UnMatch Model Number</option>
                                    <option value="ShippedComplete">ShippedComplete</option>

                                </select>
                            </div>
                            <div class="col-md-2">
                                <button type="submit"  onclick="PassValue()"  class="btn btn-default"><h4>批量更新状态</h4></button>
                            </div>
                        </div>
                    </div>
                </form>



                <div class="row">
                    <div class="col-md-12 ">
                        <table class="table  table-bordered table-striped table-bordered table-hover" id="allCurrentCheckingTasksForUser-table">

                        </table>
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

</body>
</html>
