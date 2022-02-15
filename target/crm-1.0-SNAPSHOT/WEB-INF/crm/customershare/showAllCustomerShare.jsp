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
    <shiro:hasPermission name="cs:insert">
    <a class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#myModal1" onclick="add()"></a>
    </shiro:hasPermission>
</table>

<%--共享的modal--%>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="color: black">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">客户共享修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="cv_ID" class="col-xs-2 control-label">客户共享id</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="cv_ID" name="cv_ID" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cscName" class="col-xs-2 control-label">客户名称</label>
                        <div class="col-xs-10">
                            <select type="text" class="form-control" id="cscName" name="cscName"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="csuName" class="col-xs-2 control-label">客户所属名称</label>
                        <div class="col-xs-10">
                            <select type="text" class="form-control" id="csuName" name="csuName"></select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="doShare()">Save changes</button>
            </div>
        </div>
    </div>
</div>
<%--修改的modal--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="color: black">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">客户共享修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="cvID" class="col-xs-2 control-label">客户共享id</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="cvID" name="cvID" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cName" class="col-xs-2 control-label">客户名称</label>
                        <div class="col-xs-10">
                            <select type="text" class="form-control" id="cName" name="cName"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="uName" class="col-xs-2 control-label">客户所属名称</label>
                        <div class="col-xs-10">
                            <select type="text" class="form-control" id="uName" name="uName"></select>
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
                <h4 class="modal-title" id="myModalLabel1">客户共享新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="c_name" class="col-xs-2 control-label">客户名称</label>
                        <div class="col-xs-10">
                            <select type="text" class="form-control" id="c_name" name="c_name"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="u_name" class="col-xs-2 control-label">客户所属名称</label>
                        <div class="col-xs-10">
                            <select type="text" class="form-control" id="u_name" name="u_name"></select>
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
        <shiro:hasPermission name="cs:customershare/select">
        let t = new Mytable();
        t.init();
        </shiro:hasPermission>
        <shiro:hasPermission name="cs:customershare/select3">
        let t2 = new Mytable2();
        t2.init();
        </shiro:hasPermission>
    })
    <shiro:hasPermission name="cs:customershare/select">
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
                    field: 'id',
                    title: '客户拜访id'
                }, {
                    field: 'c.cusname',
                    title: '客户名称'
                },{
                    field: 'u.userName',
                    title: '客户所属名称'
                },{
                    field: 'id',
                    title: '操作',
                    formatter: editAndDel
                }]
            })
        }

        return mytable;
    }
    </shiro:hasPermission>
    <shiro:hasPermission name="cs:customershare/select3">
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
                    field: 'id',
                    title: '客户拜访id'
                }, {
                    field: 'c.cusname',
                    title: '客户名称'
                },{
                    field: 'u.userName',
                    title: '客户所属名称'
                },
                    {
                    field: 'id',
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
            <shiro:hasPermission name="cs:update">
            <a href="#" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#myModal" onclick="edit(` + id + `)">修改</a>
            </shiro:hasPermission>&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="cs:share">
            <a href="#" class="btn btn-sm btn-info" data-toggle="modal" data-target="#myModal2" onclick="share(` + id + `)">共享</a>
            </shiro:hasPermission>&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="cs:share">
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
                let cv = jsonObj.customerShare;
                let customerList = jsonObj.customerList;
                let userList = jsonObj.userList;

                let item = '<option value=""></option>';
                for (let i = 0; i < customerList.length; i++) {
                    if (customerList[i].cid == cv.cid) {
                        item += '<option value="' + customerList[i].cid + '" selected>' + customerList[i].cusname + '</option>';
                    } else {
                        item += '<option value="' + customerList[i].cid + '">' + customerList[i].cusname + '</option>';
                    }
                }
                let item2 = '<option value=""></option>';
                for (let i = 0; i < userList.length; i++) {
                    if (userList[i].uid == cv.uid) {
                        item2 += '<option value="' + userList[i].uid + '" selected>' + userList[i].userName + '</option>';
                    } else {
                        item2 += '<option value="' + userList[i].uid + '">' + userList[i].userName + '</option>';
                    }
                }

                $("#cvID").val(cv.id);
                $("#cName").empty();//append会一直插入，所以需要把前面的插入的清空
                $("#cName").append($(item));
                $("#uName").empty();//append会一直插入，所以需要把前面的插入的清空
                $("#uName").append($(item2));
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

    function share(id) {
        $.ajax({
            url: "toShare",
            data: {
                "id": id
            },
            type: "get",
            dataType: "json",
            success: function (jsonObj) {
                let cv = jsonObj.customerShare;
                let customerList = jsonObj.customerList;
                let userList = jsonObj.userList;

                let item = '<option value=""></option>';
                for (let i = 0; i < customerList.length; i++) {
                    if (customerList[i].cid == cv.cid) {
                        item += '<option value="' + customerList[i].cid + '" selected>' + customerList[i].cusname + '</option>';
                    } else {
                        item += '<option value="' + customerList[i].cid + '">' + customerList[i].cusname + '</option>';
                    }
                }
                let item2 = '<option value=""></option>';
                for (let i = 0; i < userList.length; i++) {
                    if (userList[i].uid == cv.uid) {
                        item2 += '<option value="' + userList[i].uid + '" selected>' + userList[i].userName + '</option>';
                    } else {
                        item2 += '<option value="' + userList[i].uid + '">' + userList[i].userName + '</option>';
                    }
                }

                $("#cv_ID").val(cv.id);
                $("#cscName").empty();//append会一直插入，所以需要把前面的插入的清空
                $("#cscName").append($(item));
                $("#csuName").empty();//append会一直插入，所以需要把前面的插入的清空
                $("#csuName").append($(item2));
            }
        })
    }
    function doShare() {
        $.ajax({
            url: "share",
            data: $("form").serialize(),
            type: "get",
            success: function (msg) {
                if (msg == "ok") {
                    //成功之后，关闭模态框
                    alert("共享成功");
                    $("#myModal2").modal('hide');
                    //刷新表格
                    $("#mytable").bootstrapTable("refresh");
                } else {
                    alert("共享失败");
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
                    //成功之后，关闭模态框
                    $("#myModal").modal('hide');
                    alert("删除成功");
                    //刷新表格
                    $("#mytable").bootstrapTable("refresh");
                } else {
                    alert("删除失败");
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
                let customerList = jsonObj.customerList;
                let userList = jsonObj.userList;

                let item = '<option value=""></option>';
                for (let i = 0; i < customerList.length; i++) {
                    item += '<option value="' + customerList[i].cid + '">' + customerList[i].cusname + '</option>';
                }

                let item2 = '<option value=""></option>';
                for (let i = 0; i < userList.length; i++) {
                    item2 += '<option value="' + userList[i].uid + '">' + userList[i].userName + '</option>';
                }

                $("#c_name").empty();//append会一直插入，所以需要把前面的插入的清空
                $("#c_name").append($(item));
                $("#u_name").empty();//append会一直插入，所以需要把前面的插入的清空
                $("#u_name").append($(item2));

            }
        })
    }
    function doadd(){
        var c_name = $("#c_name").val();
        var u_name = $("#u_name").val();
        $.ajax({
            url:"insert",
            data:{
                "c_name":c_name,
                "u_name":u_name
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
