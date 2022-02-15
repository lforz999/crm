<%@ page import="java.util.List" %>
<%@ page import="com.bus.entity.Permission" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: 20944
  Date: 2021/10/18
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <%-- <div class="form-group">
         <label for="rp_name1">角色</label>
         <select type="text" class="form-control" id="rp_name1" name="rp_name1" placeholder="请输入"></select>
         <label for="rp_name2">权限</label>
         <select type="text" class="form-control" id="rp_name2" name="rp_name2" placeholder="请输入"></select>
     </div>

     <button type="button" class="btn btn-default" onclick="dosearch()">搜索</button>--%>
</form>

<table id="mytable" width="80%" border="3px solid orange">
    <shiro:hasPermission name="rolepermission:insert">
        <a class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#myModal1" onclick="add()"></a>
    </shiro:hasPermission>
</table>

<%--查看的modal--%>
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="color: black">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div id="myrow"></div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

            <%--<c:forEach items="${clist}" var="c">
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            ${c.pinfo} <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <c:forEach items="${c.list}" var="p">
                            <li><a href="#">${p.pinfo}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </c:forEach>--%>


        </div>
    </div>
</div>
<%--修改的modal--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="color: black">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="form-group">
                    <label for="rpID" class="col-xs-2 control-label">id</label>
                    <div class="col-xs-10">
                        <input type="text" class="form-control" id="rpID" name="rpID" readonly>
                    </div>
                </div>
                <div id="myedit"></div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
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
                <h4 class="modal-title" id="myModalLabel1">角色权限新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="rpname3" class="col-xs-2 control-label">角色名称</label>
                        <div class="col-xs-10">
                            <select type="text" class="form-control" id="rpname3" name="rpname3"></select>
                        </div>
                    </div>
                    <div id="insertrp">

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
    $(function () {
        let t = new Mytable();
        t.init();
        /* $.ajax({
             url: "getBroth",
             type: "get",
             dataType: "json",
             success: function (jsonArray) {
                 let roleList = jsonArray[0];
                 let permissionList = jsonArray[1];
                 for (let i = 0; i < roleList.length; i++) {
                     $("#rp_name1").append(`
                     <option value="` + roleList[i].rid + `">` + roleList[i].roleDesc + `</option>
                         `)

                 }
                 for (let i = 0; i < permissionList.length; i++) {
                     $("#rp_name2").append(`
                     <option value="` + permissionList[i].permissionid + `">` + permissionList[i].pinfo + `</option>
                         `)
                 }
             }
         })*/
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
                    field: 'rid',
                    title: '角色权限id'
                }, {
                    field: 'roleDesc',
                    title: '角色名称'
                }, {
                    field: 'rid',
                    title: '操作',
                    formatter: editAndDel
                }]
            })
        }
        /* //--------加载表格的参数
         mytable.queryParams = function (params) {
             var name1 = $("#rp_name1").val();
             var name2 = $("#rp_name2").val();
             var temp = {
                 limit: params.limit,
                 offset: params.offset,
                 "rp_name1": name1,
                 "rp_name2": name2
             }
             return temp;
         }*/
        return mytable;
    }

    /*function dosearch(){
        $("#mytable").bootstrapTable('refresh',{
            query: {
                offset: '0',
                limit: '5',
                'rp_name1':$("#rp_name1").val(),
                'rp_name2':$("#rp_name2").val()
            }
        })
    }*/

    function editAndDel(id, row, index) {
        return `
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="rolepermission:update">
            <a href="#" class="btn btn-sm btn-success" data-toggle="modal" data-target="#myModal" onclick="edit(` + id + `)">权限管理</a>
            </shiro:hasPermission>&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            <shiro:hasPermission name="rolepermission:delete">
            <a href="#" class="btn btn-sm btn-danger" onclick="del(` + id + `)">删除</a>
            </shiro:hasPermission>&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;

        `;
        // <a href="#" class="btn btn-sm btn-success" data-toggle="modal" data-target="#myModal3" onclick="selectone(` + id + `)">查看</a>
    }

    function selectone(id) {
        $.ajax({
            url: "selectone",
            data: {
                "id": id
            },
            type: "get",
            dataType: "json",
            success: function (jsonObject) {
                console.log("得到的信息是" + jsonObject.clist)
                let clist = jsonObject.clist;
                let item = '';
                for (let i = 0; i < clist.length; i++) {
                    /* item += '<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id ="dropdownMenu' + clist[i].permissionid + '" aria-haspopup="true" aria-expanded="false">' + clist[i].pinfo + ' <span class="caret"></span> </button> ' ;
                     item3+= '<ul id="two'+i+'" aria-labelledby="dropdownMenu' + clist[i].permissionid + '" class="dropdown-menu"></ul>';
                     $("#one").empty();
                     $("#one").append($(item));
                     $("#one").append($(item3));*/
                    item += ' <div class="btn-group"> <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false" id="dropdownMenu' + clist[i].permissionid + '">' + clist[i].pinfo + '  <span class="caret"></span> </button> <ul id="two' + i + '" class="dropdown-menu"> </ul> </div>';
                }
                $("#myrow").empty();
                $("#myrow").append($(item))
                console.log(clist.length + "---");
                for (let i = 0; i < clist.length; i++) {
                    for (let j = 0; j < clist[i].list.length; j++) {
                        let id = "#two" + i;
                        $(id).append('<li><a href="#">' + clist[i].list[j].pinfo + '</a></li>');
                    }
                }
                console.log(item)

            }
        })
    }

    function edit(id) {

        $.ajax({
            url: "toEdit",
            data: {
                "id": id
            },
            type: "get",
            dataType: "json",
            success: function (jsonObject) {
                let list = jsonObject.list;
                let cList = jsonObject.cList;
                let rpID = jsonObject.id;
                let item3 = '';
                for (let i = 0; i < list.length; i++) {
                    item3 += ' <button ><input id="type'+i+'" type="checkbox" name="test" value="' + list[i].permissionid + '"/></button><div class="btn-group"> <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false" id="dropdownMenu' + list[i].permissionid + '">' + list[i].pinfo + '  <span class="caret"></span> </button> <ul id="two' + i + '" class="dropdown-menu"> </ul> </div>';
                }
                $("#myedit").empty();
                $("#myedit").append($(item3))
                for (let i = 0; i < list.length; i++) {
                    for (let j = 0; j < list[i].list.length; j++) {
                        let id = "#two" + i;
                        $(id).append('<li><input id="Type' + j + '" type="checkbox" name="test" value="'+list[i].list[j].permissionid+'"/>' + list[i].list[j].pinfo + '</a></li>');
                    }
                }
                for (let i = 0; i < list.length; i++) {
                    for (let j = 0; j < cList.length; j++) {
                        if (list[i].pinfo == cList[j].pinfo) {
                            let id = "#type"+i;
                            console.log(id+"---")
                            $(id).prop("checked", "checked");
                        }
                    }
                }
                for (let i = 0; i < list.length; i++) {
                        for (let h = 0; h < cList.length; h++) {
                            for (let j = 0; j < list[i].list.length; j++) {
                                for (let g = 0; g < cList[h].list.length; g++) {
                                if (list[i].list[j].pinfo == cList[h].list[g].pinfo) {
                                    let id1 = "#two" + i;
                                    let id2 =  "#Type"+j;


                                    console.log(id1+"===")
                                    console.log(id2+"===")

                                    $(id1+" "+id2).prop("checked", "checked");
                                    // $(id1).prop("checked", "checked");
                                    // $(id2).prop("checked", "checked");
                                }
                            }
                        }
                    }
                }
                $("#rpID").val(rpID)
            }
        })
    }

    function doEdit() {
        var rpID = $("#rpID").val();
        let obj = document.getElementsByName("test");
        let check_val = [];
        for ( let k =0;k<obj.length ;k++) {
            if (obj[k].checked)
                check_val.push(obj[k].value);
        }
        console.log(check_val);
        $.ajax({
            url: "update",
            data: {
                "check_val":check_val.toString(),
                "rpID":rpID
            },
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
                    alert("删除失败");
                }
            }
        })
    }

    function add() {
        $.ajax({
            url: "toAdd",
            type: "get",
            dataType: "json",
            success: function (jsonObj) {
                let roleList = jsonObj.roleList;
                let permissionList = jsonObj.permissionList;

                let item = '<option value=""></option>';
                for (let i = 0; i < roleList.length; i++) {
                    item += '<option value="' + roleList[i].rid + '">' + roleList[i].roleDesc + '</option>';
                }
                $("#rpname3").empty();//append会一直插入，所以需要把前面的插入的清空
                $("#rpname3").append($(item));

                let item2 = '';
                for (let i = 0; i < permissionList.length; i++) {
                    item2 += ' <button ><input id="type'+i+'" type="checkbox" name="test1" value="' + permissionList[i].permissionid + '"/></button><div class="btn-group"> <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false" id="dropdownMenu' + permissionList[i].permissionid + '">' + permissionList[i].pinfo + '  <span class="caret"></span> </button> <ul id="o' + i + '" class="dropdown-menu"> </ul> </div>';
                }
                $("#insertrp").empty();
                $("#insertrp").append($(item2))
                for (let i = 0; i < permissionList.length; i++) {
                    for (let j = 0; j < permissionList[i].list.length; j++) {
                        let id1 = "#o" + i;
                        $(id1).append('<li><input id="Type' + j + '" type="checkbox" name="test1" value="'+permissionList[i].list[j].permissionid+'"/>' + permissionList[i].list[j].pinfo + '</a></li>');
                    }
                }
            }
        })
    }

    function doadd() {
        var rpname3 = $("#rpname3").val();
        let obj = document.getElementsByName("test1");
        let check_val1 = [];
        for ( let k =0;k<obj.length ;k++) {
            if (obj[k].checked)
                check_val1.push(obj[k].value);
        }
        $.ajax({
            url: "insert",
            data: {
                "rpname3": rpname3,
                "check_val1": check_val1.toString()
            },
            type: "get",
            success: function (msg) {
                if (msg == "ok") {
                    // 成功之后，关闭模态框
                    $("#myModal1").modal('hide');
                    alert("新增成功");
                    // 刷新表格
                    $("#mytable").bootstrapTable("refresh");
                    // window.location.href="showAllProducts.jsp";
                } else {
                    alert("新增失败");
                }
            }
        })
    }
</script>
</html>
