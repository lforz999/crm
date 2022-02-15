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
    <script src="${pageContext.request.contextPath}/javascript/md5.js"></script>
    <link rel="stylesheet" href="../../../javascript/bootstrap/css/bootstrap.css">
    <script src="../../../javascript/bootstrap/js/bootstrap.js"></script>
    <link href="../../../javascript/bootstrap-table/bootstrap-table.css" rel="stylesheet"/>
    <script src="../../../javascript/bootstrap-table/bootstrap-table.js"></script>
    <script src="../../../javascript/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<form class="form-inline">
    <div class="form-group">
        <label for="p_name1">角色名</label>
        <input type="text" class="form-control" id="p_name1" name="p_name1" placeholder="请输入">
    </div>

    <button type="button" class="btn btn-default" onclick="dosearch()">搜索</button>
</form>
<shiro:hasPermission name="permission:insert">
<table id="mytable" width="80%" border="3px solid orange">
    <a class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#myModal1" ></a>
</table>
</shiro:hasPermission>
<%--修改的modal--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="color: black">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">权限修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="permissionID" class="col-xs-2 control-label">权限id</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="permissionID" name="permissionID" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pName" class="col-xs-2 control-label">权限名称</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="pName" name="pName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pUrl" class="col-xs-2 control-label">权限路径</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="pUrl" name="pUrl">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="isMenu" class="col-xs-2 control-label">是否主菜单</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="isMenu" name="isMenu">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="parentId" class="col-xs-2 control-label">父id</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="parentId" name="parentId">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pInfo" class="col-xs-2 control-label">权限信息</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="pInfo" name="pInfo">
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
                <h4 class="modal-title" id="myModalLabel1">权限新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="p_name" class="col-xs-2 control-label">权限名称</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="p_name" name="p_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="p_url" class="col-xs-2 control-label">权限路径</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="p_url" name="p_url">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="is_menu" class="col-xs-2 control-label">是否主菜单</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="is_menu" name="is_menu">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="parent_id" class="col-xs-2 control-label">父id</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="parent_id" name="parent_id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="p_info" class="col-xs-2 control-label">权限信息</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="p_info" name="p_info">
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
        let t = new Mytable();
        t.init();
    })

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
                    field: 'permissionid',
                    title: '权限id'
                }, {
                    field: 'pname',
                    title: '权限名称'
                }, {
                    field: 'purl',
                    title: '权限路径'
                }, {
                    field: 'ismenu',
                    title: '是否主菜单'
                }, {
                    field: 'parentid',
                    title: '父id'
                }, {
                    field: 'pinfo',
                    title: '权限信息'
                },{
                    field: 'permissionid',
                    title: '操作',
                    formatter: editAndDel
                }]
            })
        }
        //--------加载表格的参数
        mytable.queryParams = function (params) {
            var name = $("#p_name1").val();
            var temp = {
                limit: params.limit,
                offset: params.offset,
                "p_name1": name
            }
            return temp;
        }
        return mytable;
    }
    function dosearch(){
        $("#mytable").bootstrapTable('refresh',{
            query: {
                offset: '0',
                limit: '5',
                'p_name1':$("#p_name1").val()
            }
        })
    }
    function editAndDel(id, row, index) {
        return `
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="permission:update">
            <a href="#" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#myModal" onclick="edit(` + id + `)">修改</a>
            </shiro:hasPermission>&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="permission:delete">
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
                let p = jsonObj.permission;

                $("#permissionID").val(p.permissionid);
                $("#pName").val(p.pname);
                $("#pUrl").val(p.purl);
                $("#isMenu").val(p.ismenu);
                $("#parentId").val(p.parentid);
                $("#pInfo").val(p.pinfo);
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
        var name = $("#p_name").val();
        var url = $("#p_url").val();
        var ismenu = $("#is_menu").val();
        var parentid = $("#parent_id").val();
        var info = $("#p_info").val();
        $.ajax({
            url:"insert",
            data:{
                "p_name":name,
                "p_url":url,
                "is_menu":ismenu,
                "parent_id":parentid,
                "p_info":info
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
