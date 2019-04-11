<%@ page import="com.eastebiz.entity.EbizUser" %>
<%@ page import="com.eastebiz.entity.EbizCompany" %>
<%@ page import="com.eastebiz.entity.Admin" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../static/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../static/lib/bootstrap-table/bootstrap-table.css">
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


        $(function () {
            var tableColumns = [
                {field: 'id', title: 'ID'},
                {field: 'companyName', title: 'CompanyName'},
                {field: 'owerName', title: 'OwerName'},
                {field: 'email', title: 'Email'},
                {field: 'phoneNumber', title: 'PhoneNumber'},
                {field: 'address', title: 'Address'},
                {field: 'status', title: 'Status'},
                {field: 'balance', title: 'Balance'},
                {field: 'mote', title: 'Mote'},
                {field: 'createTime', title: 'CreateTime'},
                {field: 'updateTime', title: 'UpdateTime'},
                {field: 'Button', title: '操作',
                    /* events: operateEvents,*/
                    formatter: AddFunctionAlty,}
            ];




            $('#queryAllCompany-Table').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格


            $('#queryAllCompany-Table').bootstrapTable({//表格初始化
                columns: tableColumns,  //表头
                //data: //通过ajax返回的数据
                url:"${pageContext.request.contextPath}/EbizCompany/selectAllCompany",
                /* width:1000,*/
                height:600,
                method: 'get',
                pageSize: 2,
                pageNumber: 1,
                pageList: [5,10,15],
                cache: false,
                striped: true,
                pagination: true,
                sidePagination: 'client',
                /*search: true,
               searchOnEnterKey:true,
               searchAlign:'left',
               showRefresh: true,
               showExport: true,
               showFooter: true,*/
                exportTypes: ['csv', 'txt', 'xml'],
                clickToSelect: true,


            });

        });

        function AddFunctionAlty(value,row,index) {
            return['<button id="update-button" type="button"  onclick="update('+row.id+')" class="btn btn-default-update">修改</button>'].join("")
        }

        function update(id) {
            $.ajax({
                type:"post",
                async:false,
                url:"${pageContext.request.contextPath}/EbizCompany/queryOneCompany",
                data:"id="+id,
                success:function () {
                    location.href="${pageContext.request.contextPath}/admin/updateDoctorUserInfor.jsp";
                }
            })
        }




    </script>

</head>
<body>

<%

    Admin admin = (Admin) session.getAttribute("Admin");
    if (admin != null) {
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
                                ${sessionScope.Admin.adminName},${sessionScope.EbizCompany.companyName}
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
                    <h3>公司管理</h3>
                </div>
                <div class="row">

                    <%--  <div class="col-md-1"></div>--%>
                    <div class="col-md-12 ">
                        <table class="table  table-bordered table-striped table-bordered table-hover" id="queryAllCompany-Table">
                        </table>
                    </div>

                </div>

            </div>


            <%-- 菜单栏 --%>
            <div class="col-md-2 text-left"  style="background-color: #aeffc8">
                <!--右侧栏-->
                <div id="wrapperSideBar">

                    <div class="col-md-12">
                        网站业务管理
                    </div>

                    <div class="col-md-12"><a class="mobile-link" href='${pageContext.request.contextPath}/admin/queryAllCompany.jsp'>主账号管理</a></div>
                    <div class="col-md-12"><a class="mobile-link" href=''>收费管理</a></div>



        </div>
    </div>
</section>

</body>
</html>
