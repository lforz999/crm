<%--
  Created by IntelliJ IDEA.
  User: 20944
  Date: 2021/11/16
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="${pageContext.request.contextPath}/css/main.css" ></c:url>" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
    <link rel="stylesheet" href="../javascript/bootstrap/css/bootstrap.css">
    <script src="../javascript/bootstrap/js/bootstrap.js"></script>
    <link href="../javascript/bootstrap-table/bootstrap-table.css" rel="stylesheet"/>
    <script src="../javascript/bootstrap-table/bootstrap-table.js"></script>
    <script src="../javascript/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
</head>
<%
    String loginName = (String)request.getSession().getAttribute("loginName");
%>
<body>
<div class="top">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            <%--<p style="margin-left: 90%">欢迎<%=loginName%>登录</p>--%>
            <p style="margin-left: 90%">欢迎<shiro:principal/>登录</p>
            <span class="caret"></span></a>
        <ul class="dropdown-menu" style="margin-left: 86%">
            <li><a data-toggle="modal" data-target="#myModal" class="btn btn-block ">修改密码</a></li>
            <li><a href="/shiro/loginOut"  class="btn btn-block ">退出登录</a></li>
        </ul>
</div>
<div class=" down">
    <div class="left fl col-xs-2" >
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

            <c:forEach items="${list}" var="p" varStatus="v">
                <shiro:hasPermission name="${p.pname}">
                    <div style="margin: 10px 5px 5px 20px" class="panel panel-default">
                        <div class="panel-heading" role="tab" id="heading_01">
                            <h4 class="panel-title" style="text-align: center">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                   href="#collapse_${v.index}" aria-expanded="false"
                                   aria-controls="collapse_${v.index}">
                                        ${p.pinfo}
                                </a>
                            </h4>
                        </div>
                        <div id="collapse_${v.index}" class="panel-collapse collapse" role="tabpanel"
                             aria-labelledby="heading_${v.index}">
                            <div class="panel-body">
                                <c:forEach items="${p.list}" var="p2">
                                    <!-- 这里是子菜单，可能有多个，是按钮，有链接的 -->
                                    <shiro:hasPermission name="${p2.pname}">
                                        <c:if test="${fn:contains(p2.pname,p2.purl)}">
                                        <a class="btn btn-block btn-primary" href="${p2.purl}"
                                           target="show">${p2.pinfo}</a>
                                        </c:if>
                                    </shiro:hasPermission>

                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </shiro:hasPermission>
            </c:forEach>

        </div>

    </div>
    <div class="right fl col-xs-10" >
        <iframe name="show" width="100%" height="100%" frameborder="0"></iframe>
    </div>
</div>
</body>
<script>
    function doUpdate(){
        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        $.ajax({
            url:"updatePassword",
            data:{
                "oldPassword":oldPassword,
                "newPassword":newPassword
            },
            type:"get",
            success: function (msg){
                if (msg == "ok"){
                    // 成功之后，关闭模态框
                    $("#myModal").modal('hide');
                    alert("修改成功");
                    // 刷新表格
                    $("#mytable").bootstrapTable("refresh");
                    // window.location.href="showAllProducts.jsp";
                }else if (msg == 'no'){
                    alert("修改失败，和之前的密码一样");
                    $("#myModal").modal('hide');
                }else if(msg == 'none'){
                    alert("密码不匹配");
                    $("#myModal").modal('hide');
                }
            }
        })
    }
</script>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="color: black">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">用户密码修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="oldPassword" class="col-xs-2 control-label">旧密码</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="oldPassword" name="oldPassword" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newPassword" class="col-xs-2 control-label">新密码</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="newPassword" name="newPassword">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="doUpdate()">Save changes</button>
            </div>
        </div>
    </div>
</div>
</html>
