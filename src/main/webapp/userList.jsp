<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href=" <%=basePath%>">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title><spring:message code="label.dashboard"/></title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Tables -->
    <link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <![endif]-->
</head>

<body>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Tables</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    DataTables Advanced Tables
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>Account Id</th>
                                <th><spring:message code="label.username"/></th>
                                <th>QQ</th>
                                <th>Telephone</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- Core Scripts - Include with every page -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>

<!-- Page-Level Plugin Scripts - Tables -->
<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- SB Admin Scripts - Include with every page -->
<script src="js/sb-admin.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#dataTables-example').dataTable({
            bPaginate: true,
            bProcessing: true,
            bServerSide: true,
            bSort: true,
            bFilter: false,
            bAutoWidth: true,
            iDisplayStart: 0,
            iDisplayLength: 10,
            bLengthChange: true,
            sPaginationType: 'full_numbers',
            sAjaxSource: 'ajax/users.do',
            fnServerData: function (sSource, aoData, fnCallback) {
                $.ajax({
                    dataType: "json",
                    type: "POST",
                    "url": sSource,
                    "data": aoData,
                    "success": fnCallback
                });
            },
            "aoColumns": [
                { "sTitle": "AccountId",
                    "mData": "accountId",
                    "mDataProp": "account_id"},
                { "sTitle": "username",
                    "mData": "username"},
                { "sTitle": "QQ",
                    "mData": "qq"},
                { "sTitle": "Telephone",
                    "mData": "telephone"},
                { "sTitle": "email",
                    "mData": "email"},
                { "sTitle": "Address",
                    "mData": "address"},
                {
                    "fnRender": function (obj) {
                        sReturn = "<b>A</b>";
                        return sReturn;
                    }
                }
            ],
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据",
                "sProcessing": "<img src='./loading.gif' />"
            }
        });

        function deleteConfirm(deleteID) {
            $.modal.confirm('确实要删除此用户吗?', function () {
                $.ajax('servlet/DeleteUser', {
                    dataType: 'json',
                    data: {
                        userID: deleteID
                    },
                    success: function (data) {
                        if (data.success == 'true') {
                            $.modal.alert('删除成功!');
                            start = $("#sorting-advanced").dataTable().fnSettings()._iDisplayStart;
                            total = $("#sorting-advanced").dataTable().fnSettings().fnRecordsDisplay();
                            window.location.reload();
                            if ((total - start) == 1) {
                                if (start > 0) {
                                    $("#sorting-advanced").dataTable().fnPageChange('previous', true);
                                }
                            }
                        }
                        else {
                            $.modal.alert('删除发生错误，请联系管理员!');
                        }
                    },
                    error: function () {
                        $.modal.alert('服务器无响应，请联系管理员!');
                    }
                });


            }, function () {
                //$.modal.alert('Meh.');
            });
        };

    });

</script>

</body>
</html>
