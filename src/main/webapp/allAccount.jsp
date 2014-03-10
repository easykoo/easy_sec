<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
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

    <title><spring:message code="label.all.account"/></title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <%--<link href="font-awesome/css/font-awesome.css" rel="stylesheet">--%>

    <!-- Page-Level Plugin CSS - Tables -->
    <link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="css/admin.css" rel="stylesheet">
</head>

<body>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><spring:message code="label.all.account"/></h1>
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
                                <th><spring:message code="label.id"/></th>
                                <th><spring:message code="label.username"/></th>
                                <th><spring:message code="label.qq"/></th>
                                <th><spring:message code="label.telephone"/></th>
                                <th><spring:message code="label.email"/></th>
                                <th><spring:message code="label.address"/></th>
                                <th><spring:message code="label.actions"/></th>
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
<script src="js/bootbox.min.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>

<!-- Page-Level Plugin Scripts - Tables -->
<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- SB Admin Scripts - Include with every page -->
<script src="js/admin.js"></script>


<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script type="text/javascript" charset="utf-8">

var accountTable;

function deleteAccount(accountID) {
    bootbox.dialog({
        message: "Are you sure to delete this account?",
        title: "Delete Account",
        buttons: {
            main: {
                label: "Cancel",
                className: "btn-default",
                callback: function () {
                }
            },
            danger: {
                label: "Yes",
                className: "btn-danger",
                callback: function (result) {
                    if (result) {
                        $.ajax('ajax/deleteAccount.do', {
                            dataType: 'json',
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (data == 'true') {
                                    accountTable.fnClearTable(0);
                                    accountTable.fnDraw();
                                }
                                else {
                                    var obj = $.parseJSON(data);
                                    bootbox.alert(obj.error, function () {
                                    });
                                }
                            }
                        });
                    }
                }
            }
        }
    });
}

function banAccount(accountID) {
    bootbox.dialog({
        message: "Are you sure to ban this account?",
        title: "Ban Account",
        buttons: {
            main: {
                label: "Cancel",
                className: "btn-default",
                callback: function () {
                }
            },
            danger: {
                label: "Yes",
                className: "btn-danger",
                callback: function (result) {
                    if (result) {
                        $.ajax('ajax/banAccount.do', {
                            dataType: 'json',
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (data == 'true') {
                                    accountTable.fnClearTable(0);
                                    accountTable.fnDraw();
                                }
                                else {
                                    var obj = $.parseJSON(data);
                                    bootbox.alert(obj.error, function () {
                                    });
                                }
                            }
                        });
                    }
                }
            }
        }
    });
}

function unbanAccount(accountID) {
    bootbox.dialog({
        message: "Are you sure to unban this account?",
        title: "Unban Account",
        buttons: {
            main: {
                label: "Cancel",
                className: "btn-default",
                callback: function () {
                }
            },
            danger: {
                label: "Yes",
                className: "btn-success",
                callback: function (result) {
                    if (result) {
                        $.ajax('ajax/unbanAccount.do', {
                            dataType: 'json',
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (data == 'true') {
                                    accountTable.fnClearTable(0);
                                    accountTable.fnDraw();
                                }
                                else {
                                    var obj = $.parseJSON(data);
                                    bootbox.alert(obj.error, function () {
                                    });
                                }
                            }
                        });
                    }
                }
            }
        }
    });
}

function makeAdmin(accountID) {
    bootbox.dialog({
        message: "Are you sure to make this account administrator?",
        title: "Make Admin",
        buttons: {
            main: {
                label: "Cancel",
                className: "btn-default",
                callback: function () {
                }
            },
            danger: {
                label: "Yes",
                className: "btn-danger",
                callback: function (result) {
                    if (result) {
                        $.ajax('ajax/makeAdmin.do', {
                            dataType: 'json',
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (data == 'true') {
                                    accountTable.fnClearTable(0);
                                    accountTable.fnDraw();
                                }
                                else {
                                    var obj = $.parseJSON(data);
                                    bootbox.alert(obj.error, function () {
                                    });
                                }
                            }
                        });
                    }
                }
            }
        }
    });
}

function hire(accountID) {
    bootbox.dialog({
        message: "Are you sure to hire this user?",
        title: "Hire",
        buttons: {
            main: {
                label: "Cancel",
                className: "btn-default",
                callback: function () {
                }
            },
            danger: {
                label: "Yes",
                className: "btn-danger",
                callback: function (result) {
                    if (result) {
                        $.ajax('ajax/hire.do', {
                            dataType: 'json',
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (data == 'true') {
                                    accountTable.fnClearTable(0);
                                    accountTable.fnDraw();
                                }
                                else {
                                    var obj = $.parseJSON(data);
                                    bootbox.alert(obj.error, function () {
                                    });
                                }
                            }
                        });
                    }
                }
            }
        }
    });
}

function fire(accountID) {
    bootbox.dialog({
        message: "Are you sure to fire this employee?",
        title: "Fire Employee",
        buttons: {
            main: {
                label: "Cancel",
                className: "btn-default",
                callback: function () {
                }
            },
            danger: {
                label: "Yes",
                className: "btn-danger",
                callback: function (result) {
                    if (result) {
                        $.ajax('ajax/fire.do', {
                            dataType: 'json',
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (data == 'true') {
                                    accountTable.fnClearTable(0);
                                    accountTable.fnDraw();
                                }
                                else {
                                    var obj = $.parseJSON(data);
                                    bootbox.alert(obj.error, function () {
                                    });
                                }
                            }
                        });
                    }
                }
            }
        }
    });
}

$(document).ready(function () {
    accountTable = $('#dataTables-example').dataTable({
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
        sAjaxSource: 'ajax/allAccount.do',
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
            { "sTitle": "<spring:message code="label.id"/>",
                "mData": "account_id",
                "mDataProp": "account_id"},
            { "sTitle": "<spring:message code="label.username"/>",
                "mData": "username"},
            { "sTitle": "<spring:message code="label.qq"/>",
                "mData": "qq"},
            { "sTitle": "<spring:message code="label.telephone"/>",
                "mData": "telephone"},
            { "sTitle": "<spring:message code="label.email"/>",
                "mData": "email"},
            { "sTitle": "<spring:message code="label.address"/>",
                "mData": "address"},
            { "sTitle": "<spring:message code="label.actions"/>",
                "mData": "locked"}
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex) {
            /* Append the grade to the default row class name */
            var html = '<div class="btn-group "><a class="btn btn-primary" href="javascript:"><i class="fa fa-user fa-fw"></i></a>' +
                    '<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="javascript:"><span class="fa fa-caret-down"></span></a>' +
                    '<ul class="dropdown-menu">' +
                    '<li><a href="javascript:deleteAccount(' + aData.account_id + ')"><i class="fa fa-trash-o fa-fw"></i>'
                    + '<strong> <spring:message code="label.delete"/></strong>'
                    + '</a></li>';
            if (!aData.locked) {
                html += '<li><a href="javascript:banAccount(' + aData.account_id + ')"><i class="fa fa-ban fa-fw"></i>'
                        + '<strong> <spring:message code="label.ban"/></strong>'
                        + '</a></li>';
            } else {
                html += '<li><a href="javascript:unbanAccount(' + aData.account_id + ')"><i class="fa fa-ban fa-fw"></i>'
                        + '<strong> <spring:message code="label.unban"/></strong>'
                        + '</a></li>';
            }
            if (aData.roleId != 1) {
                html += '<li class="divider"></li><li><a href="javascript:makeAdmin(' + aData.account_id + ')"><i class="i"></i>'
                        + '<strong> <spring:message code="label.make.admin"/></strong>'
                        + '</a></li>';
            }
            if (aData.roleId == 3) {
                html += '<li class="divider"></li><li><a href="javascript:hire(' + aData.account_id + ')"><i class="i"></i>'
                        + '<strong> <spring:message code="label.hire"/></strong>'
                        + '</a></li>';
            } else {
                html += '<li class="divider"></li><li><a href="javascript:fire(' + aData.account_id + ')"><i class="i"></i>'
                        + '<strong> <spring:message code="label.fire"/></strong>'
                        + '</a></li>';
            }
            html += '</ul></div>';
            $('td:eq(6)', nRow).html(html);
            if (aData.locked) {
                $(nRow).css({"color": "#BBBBBB"})

            }
            return nRow;
        },
        "oLanguage": {
            sUrl: [ "css/plugins/dataTables/<spring:message code="language"/>.txt"]
        },
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 6 ] }
        ]
    });
});

</script>

</body>
</html>
