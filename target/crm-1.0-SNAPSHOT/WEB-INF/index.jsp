<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Universe Signin Form Flat Responsive Widget Template :: W3layouts</title>

    <!-- Meta-Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all">
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
    <link rel="stylesheet" href="../javascript/bootstrap/css/bootstrap.css">
    <script src="../javascript/bootstrap/js/bootstrap.js"></script>
    <link href="../javascript/bootstrap-table/bootstrap-table.css" rel="stylesheet"/>
    <script src="../javascript/bootstrap-table/bootstrap-table.js"></script>
    <script src="../javascript/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<br/>
<p><a href="/shiro/changeLanguage.action?locale=zh_CN">中文</a></p>
<p><a href="/shiro/changeLanguage.action?locale=en_US">English</a></p>
<h3>国际化测试：<fmt:message key="pleaseLoginSystem"/> </h3>
<form action="./shiro/login" METHOD="post">
    <fmt:message key="loginName"/> :<input type="text" name="userName" />
    <br>
    <fmt:message key="password"/> :<input type="password" name="userPassword" />
    <input type="submit" value="<fmt:message key="login"/> "/>
    <input data-toggle="modal" data-target="#myModal1"  type="button" value="<fmt:message key="add"/> "/>
</form>

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

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="doadd()">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script>


    function doadd(){
        var name = $("#user_name").val();
        var password = $("#user_password").val();
        $.ajax({
            url:"shiro/insert",
            data:{
                "user_name":name,
                "user_password":password
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
</body>
</html>