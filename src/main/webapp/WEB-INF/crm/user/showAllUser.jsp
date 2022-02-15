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
        <label for="user_name1">用户名</label>
        <input type="text" class="form-control" id="user_name1" name="user_name1" placeholder="请输入">
    </div>

    <button type="button" class="btn btn-default" onclick="dosearch()">搜索</button>
</form>
<shiro:hasPermission name="user:insert">
<table id="mytable" width="80%" border="3px solid orange">
    <a class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#myModal1" onclick="add()"></a>
</table>
</shiro:hasPermission>
<%--修改的modal--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="color: black">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">用户修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="uID" class="col-xs-2 control-label">用户id</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="uID" name="uID" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userName" class="col-xs-2 control-label">用户名称</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="userName" name="userName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userPassword" class="col-xs-2 control-label">用户密码</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="userPassword" name="userPassword">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rid1" class="col-xs-2 control-label">用户角色</label>
                        <div class="col-xs-10">
                            <select type="text" class="form-control" id="rid1" name="rid1"></select>
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
                <h4 class="modal-title" id="myModalLabel1">用户新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="user_name" class="col-xs-2 control-label">用户名称</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="user_name" name="user_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="user_password" class="col-xs-2 control-label">用户密码</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="user_password" name="user_password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="r_id" class="col-xs-2 control-label">用户角色</label>
                        <div class="col-xs-10">
                            <select type="text" class="form-control" id="r_id" name="r_id"></select>
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
        <shiro:hasPermission name="user:user/select">
        let t = new Mytable();
        t.init();
        </shiro:hasPermission>
        <shiro:hasPermission name="user:user/select3">
        let t2 = new Mytable();
        t2.init();
        </shiro:hasPermission>
    })
    <shiro:hasPermission name="user:user/select">
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
                    field: 'uid',
                    title: '用户id'
                }, {
                    field: 'userName',
                    title: '用户名称'
                }, {
                    field: 'userPassword',
                    title: '用户密码'
                }, {
                    field: 'r.roleDesc',
                    title: '用户角色'
                },{
                    field: 'uid',
                    title: '操作',
                    formatter: editAndDel
                }]
            })
        }
        //--------加载表格的参数
        mytable.queryParams = function (params) {
            var name = $("#user_name1").val();
            var temp = {
                limit: params.limit,
                offset: params.offset,
                "user_name1": name
            }
            return temp;
        }
        return mytable;
    }
    </shiro:hasPermission>
    <shiro:hasPermission name="user:user/select3">
    var Mytable = function () {
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
                    field: 'uid',
                    title: '用户id'
                }, {
                    field: 'userName',
                    title: '用户名称'
                }, {
                    field: 'userPassword',
                    title: '用户密码'
                }, {
                    field: 'r.roleDesc',
                    title: '用户角色'
                },{
                    field: 'uid',
                    title: '操作',
                    formatter: editAndDel
                }]
            })
        }
        //--------加载表格的参数
        mytable.queryParams = function (params) {
            var name = $("#user_name1").val();
            var temp = {
                limit: params.limit,
                offset: params.offset,
                "user_name1": name
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
                'user_name1':$("#user_name1").val()
            }
        })
    }
    function editAndDel(id, row, index) {
        return `
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="user:update">
            <a href="#" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#myModal" onclick="edit(` + id + `)">修改</a>
            </shiro:hasPermission>&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="user:delete">
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
                let u = jsonObj.user;
                let roleList = jsonObj.roleList;

                let item = '<option value=""></option>';
                for (let i = 0; i < roleList.length; i++) {
                    if (roleList[i].rid == u.rid) {
                        item += '<option value="' + roleList[i].rid + '" selected>' + roleList[i].roleDesc + '</option>';
                    } else {
                        item += '<option value="' + roleList[i].rid + '">' + roleList[i].roleDesc + '</option>';
                    }
                }

                $("#uID").val(u.uid);
                $("#userName").val(u.userName);
                $("#userPassword").val(u.userPassword);
                $("#rid1").empty();//append会一直插入，所以需要把前面的插入的清空
                $("#rid1").append($(item));
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

    function add(){
        $.ajax({
            url: "toAdd",
            type: "get",
            dataType: "json",
            success: function (jsonObj) {
                let roleList = jsonObj.roleList;

                let item = '<option value=""></option>';
                for (let i = 0; i < roleList.length; i++) {
                    item += '<option value="' + roleList[i].rid + '">' + roleList[i].roleDesc + '</option>';
                }
                $("#r_id").empty();//append会一直插入，所以需要把前面的插入的清空
                $("#r_id").append($(item));

            }
        })
    }

    function doadd(){
        var name = $("#user_name").val();
        var password = $("#user_password").val();
        var r_id = $("#r_id").val();
        $.ajax({
            url:"insert",
            data:{
                "user_name":name,
                "user_password":password,
                "r_id":r_id
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
