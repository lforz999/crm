<%--
  Created by IntelliJ IDEA.
  User: 20944
  Date: 2021/10/18
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" href="../../../javascript/bootstrap/css/bootstrap.css">
    <script src="../../../javascript/bootstrap/js/bootstrap.js"></script>
    <link href="../../../javascript/bootstrap-table/bootstrap-table.css" rel="stylesheet"/>
    <script src="../../../javascript/bootstrap-table/bootstrap-table.js"></script>
    <script src="../../../javascript/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<form class="form-inline">
    <div class="form-group">
        <label for="customer_name1">客户名</label>
        <input type="text" class="form-control" id="customer_name1" name="customer_name1" placeholder="请输入">
    </div>

    <button type="button" class="btn btn-default" onclick="dosearch()">搜索</button>
</form>

<table id="mytable" width="80%" border="3px solid orange">
    <shiro:hasPermission name="c:insert">
    <a class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#myModal1" ></a>
    </shiro:hasPermission>
</table>

<%--修改的modal--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="color: black">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">客户修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="cID" class="col-xs-2 control-label">客户id</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="cID" name="cID" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cName" class="col-xs-2 control-label">客户名称</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="cName" name="cName">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="doEdit()">Save changes</button>
            </div>
        </div>
    </div>
</div>
<%--新增的modal--%>
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="color: black">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">客户新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="c_name" class="col-xs-2 control-label">客户名称</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="c_name" name="c_name">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="doadd()">Save changes</button>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    $(function(){
        <shiro:hasPermission name="c:customer/select">
        let t = new Mytable();
        t.init();
        </shiro:hasPermission>
        <shiro:hasPermission name="c:customer/select3">
        let t2 = new Mytable2();
        t2.init();
        </shiro:hasPermission>
    })
    <shiro:hasPermission name="c:customer/select">
    var Mytable = function () {
        let mytable = new Object();
        mytable.init = function () {
            $("#mytable").bootstrapTable({
                // url: 'showAllProducts.action',         //请求后台的URL（*）
                url: 'select2',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                pagination: true,                   //是否显示分页（*）
                queryParams: mytable.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 5,                       //每页的记录行数（*）
                pageList: [5, 10, 25, 50, 100],        //可供选择的每页的行数（*）
                showColumns: true,                  //是否显示所有的列
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                columns: [{
                    checkbox: true
                }, {
                    field: 'cid',
                    title: '客户id'
                }, {
                    field: 'cusname',
                    title: '客户名称'
                }
                    <shiro:hasPermission name="c:update">
                    ,{
                    field: 'cid',
                    title: '操作',
                    formatter: editAndDel
                }
                    </shiro:hasPermission>
                ]
            })
        }
        //--------加载表格的参数
        mytable.queryParams = function (params) {
            var name = $("#customer_name1").val();
            var temp = {
                limit: params.limit,
                offset: params.offset,
                "c_name1": name
            }
            return temp;
        }
        return mytable;
    }
    </shiro:hasPermission>

    <shiro:hasPermission name="c:customer/select3">
    var Mytable2 = function () {
        let mytable = new Object();
        mytable.init = function () {
            $("#mytable").bootstrapTable({
                // url: 'showAllProducts.action',         //请求后台的URL（*）
                url: 'select4',         //请求后台的URL（*）
                method: 'get',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                pagination: true,                   //是否显示分页（*）
                queryParams: mytable.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 5,                       //每页的记录行数（*）
                pageList: [5, 10, 25, 50, 100],        //可供选择的每页的行数（*）
                showColumns: true,                  //是否显示所有的列
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                columns: [{
                    checkbox: true
                }, {
                    field: 'cid',
                    title: '客户id'
                }, {
                    field: 'cusname',
                    title: '客户名称'
                }
                    ,
                    {
                    field: 'cid',
                    title: '操作',
                    formatter: editAndDel
                }
                ]
            })
        }
        //--------加载表格的参数
        mytable.queryParams = function (params) {
            var name = $("#customer_name1").val();
            var temp = {
                limit: params.limit,
                offset: params.offset,
                "c_name1": name
            }
            return temp;
        }
        return mytable;
    }
    </shiro:hasPermission>

    function dosearch(){
        $("#mytable").bootstrapTable('refresh',{
            query: {
                offset: '0',
                limit: '5',
                'c_name1':$("#customer_name1").val()
            }
        })
    }
    function editAndDel(id, row, index) {
        return `
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="c:update">
            <a href="#" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#myModal" onclick="edit(` + id + `)">修改</a>
            </shiro:hasPermission>&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="c:delete">
            <a href="#" class="btn btn-sm btn-danger" onclick="del(` + id + `)">删除</a>
            </shiro:hasPermission>
        `;
    }

    function edit(id) {

        $.ajax({
            url: "toEdit",
            data: {
                "id": id
            },
            type: "get",
            dataType: "json",
            success: function (jsonObj) {
                let u = jsonObj.customer;

                $("#cID").val(u.cid);
                $("#cName").val(u.cusname);
            }
        })
    }

    function doEdit() {
        $.ajax({
            url: "update",
            data: $("form").serialize(),
            type: "get",
            success: function (msg) {
                if (msg == "ok") {
                    //成功之后，关闭模态框
                    $("#myModal").modal('hide');
                    alert("修改成功");
                    //刷新表格
                    $("#mytable").bootstrapTable("refresh");
                } else {
                    alert("修改失败");
                }
            }
        })
    }

    function del(id) {
        $.ajax({
            url: "delete",
            data: {
                "id": id
            },
            type: "get",
            success: function (msg) {
                if (msg == "ok") {
                    alert("删除成功");
                    //刷新表格
                    $("#mytable").bootstrapTable("refresh");
                } else {
                    alert("删除失败，已在产品中存在");
                }
            }
        })
    }

    function doadd(){
        var name = $("#c_name").val();
        $.ajax({
            url:"insert",
            data:{
                "c_name":name
            },
            type:"get",
            success: function (msg){
                if (msg == "ok"){
                    // 成功之后，关闭模态框
                    $("#myModal1").modal('hide');
                    alert("新增成功");
                    // 刷新表格
                    $("#mytable").bootstrapTable("refresh");
                    // window.location.href="showAllProducts.jsp";
                }else {
                    alert("新增失败");
                }
            }
        })
    }
</script>
</html>
