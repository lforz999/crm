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
        <label for="role_name1">角色名</label>
        <input type="text" class="form-control" id="role_name1" name="role_name1" placeholder="请输入">
    </div>

    <button type="button" class="btn btn-default" onclick="dosearch()">搜索</button>
</form>

<table id="mytable" width="80%" border="3px solid orange">
    <shiro:hasPermission name="role:insert">
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
                <h4 class="modal-title" id="myModalLabel">角色修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="rID" class="col-xs-2 control-label">角色id</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="rID" name="rID" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roleName" class="col-xs-2 control-label">角色名称</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="roleName" name="roleName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roleDesc" class="col-xs-2 control-label">角色介绍</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="roleDesc" name="roleDesc">
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
                <h4 class="modal-title" id="myModalLabel1">角色新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="role_name" class="col-xs-2 control-label">角色名称</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="role_name" name="role_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="role_desc" class="col-xs-2 control-label">角色介绍</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="role_desc" name="role_desc">
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
                    field: 'rid',
                    title: '角色id'
                }, {
                    field: 'roleName',
                    title: '角色名称'
                }, {
                    field: 'roleDesc',
                    title: '角色介绍'
                },{
                    field: 'rid',
                    title: '操作',
                    formatter: editAndDel
                }]
            })
        }
        //--------加载表格的参数
        mytable.queryParams = function (params) {
            var name = $("#role_name1").val();
            var temp = {
                limit: params.limit,
                offset: params.offset,
                "role_name1": name
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
                'role_name1':$("#role_name1").val()
            }
        })
    }
    function editAndDel(id, row, index) {
        return `
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="role:update">
            <a href="#" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#myModal" onclick="edit(` + id + `)">修改</a>
            </shiro:hasPermission>&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="role:delete">
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
                let r = jsonObj.role;

                $("#rID").val(r.rid);
                $("#roleName").val(r.roleName);
                $("#roleDesc").val(r.roleDesc);
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
        var name = $("#role_name").val();
        var desc = $("#role_desc").val();
        $.ajax({
            url:"insert",
            data:{
                "role_name":name,
                "role_desc":desc
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
