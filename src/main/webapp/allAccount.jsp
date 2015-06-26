<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
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
    <link href="css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="css/admin.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
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
                    <a class="btn btn-danger" id="delete"><i class="fa fa-trash-o fa-fw"></i><spring:message
                            code="label.delete"/></a>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTable">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="selectAll"/></th>
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
<script src="js/jquery.metisMenu.js"></script>

<!-- Page-Level Plugin Scripts - Tables -->
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap.js"></script>

<!-- Custom Scripts - Include with every page -->
<script src="js/admin.js"></script>
<script src="js/easykoo.js"></script>


<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script type="text/javascript" charset="utf-8">

var accountTable;

function deleteAccount(accountID) {
    bootbox.dialog({
        message: "Are you sure to delete this account?",
        title: "Delete Account",
        buttons: {
            main: {
                label: '<spring:message code="label.cancel" />',
                className: "btn-default",
                callback: null
            },
            danger: {
                label: '<spring:message code="label.yes" />',
                className: "btn-danger",
                callback: function (result) {
                    if (result) {
                        $.ajax('account/ajax/deleteAccount.do', {
                            dataType: 'json',
                            type: "POST",
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (!data.success) {
                                    bootbox.alert(data.message, null);
                                }
                                accountTable.fnClearTable(0);
                                accountTable.fnDraw();
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
                label: '<spring:message code="label.cancel" />',
                className: "btn-default",
                callback: null
            },
            danger: {
                label: '<spring:message code="label.yes" />',
                className: "btn-danger",
                callback: function (result) {
                    if (result) {
                        $.ajax('account/ajax/banAccount.do', {
                            dataType: 'json',
                            type: "POST",
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (!data.success) {
                                    bootbox.alert(data.message, null);
                                }
                                accountTable.fnClearTable(0);
                                accountTable.fnDraw();
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
                label: '<spring:message code="label.cancel" />',
                className: "btn-default",
                callback: null
            },
            danger: {
                label: '<spring:message code="label.yes" />',
                className: "btn-success",
                callback: function (result) {
                    if (result) {
                        $.ajax('account/ajax/unbanAccount.do', {
                            dataType: 'json',
                            type: "POST",
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (!data.success) {
                                    bootbox.alert(data.message, null);
                                }
                                accountTable.fnClearTable(0);
                                accountTable.fnDraw();
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
                label: '<spring:message code="label.cancel" />',
                className: "btn-default",
                callback: null
            },
            danger: {
                label: '<spring:message code="label.yes" />',
                className: "btn-danger",
                callback: function (result) {
                    if (result) {
                        $.ajax('account/ajax/makeAdmin.do', {
                            dataType: 'json',
                            type: "POST",
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (!data.success) {
                                    bootbox.alert(data.message, null);
                                }
                                accountTable.fnClearTable(0);
                                accountTable.fnDraw();
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
                label: '<spring:message code="label.cancel" />',
                className: "btn-default",
                callback: null
            },
            danger: {
                label: '<spring:message code="label.yes" />',
                className: "btn-danger",
                callback: function (result) {
                    if (result) {
                        $.ajax('account/ajax/hire.do', {
                            dataType: 'json',
                            type: "POST",
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (!data.success) {
                                    bootbox.alert(data.message, null);
                                }
                                accountTable.fnClearTable(0);
                                accountTable.fnDraw();
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
                label: '<spring:message code="label.cancel" />',
                className: "btn-default",
                callback: null
            },
            danger: {
                label: '<spring:message code="label.yes" />',
                className: "btn-danger",
                callback: function (result) {
                    if (result) {
                        $.ajax('account/ajax/fire.do', {
                            dataType: 'json',
                            type: "POST",
                            data: {
                                accountId: accountID
                            },
                            success: function (data) {
                                if (!data.success) {
                                    bootbox.alert(data.message, null);
                                }
                                accountTable.fnClearTable(0);
                                accountTable.fnDraw();
                            }
                        });
                    }
                }
            }
        }
    });
}

var accountArray = [0];

var selectAccount = function (obj, accountId) {
    if ($(obj).prop("checked")) {
        if ($.inArray(accountId, accountArray) < 0) {
            accountArray.push(accountId);
        }
    } else {
        if ($.inArray(accountId, accountArray) >= 0) {
            $.each(accountArray, function (key, value) {
                accountArray.splice(key, key)
            });
        }
    }
}

var selectAll = function (obj) {
    if (obj.checked) {
        $("input[name='selectFlag']:checkbox").each(function () {
            $(this).click();
            $(this).attr("checked", true);
        })
    } else {
        $("input[name='selectFlag']:checkbox").each(function () {
            $(this).click();
            $(this).attr("checked", false);
        })
    }
}

var unSelectAll = function () {
    $("input:checkbox").each(function () {
        $(this).attr("checked", false);
    })
}

var getAllAccounts = function () {
    accountTable = $('#dataTable').dataTable({
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
        sAjaxSource: 'account/ajax/allAccount.do',
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
            { "sTitle": "<input id='selectAll' onchange='selectAll(this)' type='checkbox'/>",
                "mData": "username"},
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
            { "sTitle": "<spring:message code="label.create.date"/>",
                "mData": "create_date"},
            { "sTitle": "<spring:message code="label.actions"/>",
                "mData": "locked"}
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex) {
            $('td:eq(0)', nRow).html('<input type="checkbox" name="selectFlag" onchange="selectAccount(this,' + aData.accountId + ')"/>');
            var createDate = timeStamp2String(aData.createDate);
            $('td:eq(6)', nRow).text(createDate);

            var html = '<div class="btn-group "><a class="btn btn-primary" href="javascript:"><i class="fa fa-gavel fa-fw"></i></a>' +
                    '<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="javascript:"><span class="fa fa-caret-down"></span></a>' +
                    '<ul class="dropdown-menu">' +
                    '<li><a href="javascript:deleteAccount(' + aData.accountId + ')"><i class="fa fa-trash-o fa-fw"></i>'
                    + '<strong> <spring:message code="label.delete"/></strong>'
                    + '</a></li>';
            if (!aData.locked) {
                html += '<li><a href="javascript:banAccount(' + aData.accountId + ')"><i class="fa fa-ban fa-fw"></i>'
                        + '<strong> <spring:message code="label.ban"/></strong>'
                        + '</a></li>';
            } else {
                html += '<li><a href="javascript:unbanAccount(' + aData.accountId + ')"><i class="fa fa-ban fa-fw"></i>'
                        + '<strong> <spring:message code="label.unban"/></strong>'
                        + '</a></li>';
            }
            if (aData.roleId != 1) {
                html += '<li class="divider"></li><li><a href="javascript:makeAdmin(' + aData.accountId + ')"><i class="i"></i>'
                        + '<strong> <spring:message code="label.make.admin"/></strong>'
                        + '</a></li>';
            }
            if (aData.roleId == 3) {
                html += '<li class="divider"></li><li><a href="javascript:hire(' + aData.accountId + ')"><i class="i"></i>'
                        + '<strong> <spring:message code="label.hire"/></strong>'
                        + '</a></li>';
            } else {
                html += '<li class="divider"></li><li><a href="javascript:fire(' + aData.accountId + ')"><i class="i"></i>'
                        + '<strong> <spring:message code="label.fire"/></strong>'
                        + '</a></li>';
            }
            html += '</ul></div>';
            $('td:eq(7)', nRow).html(html);

            if (aData.locked) {
                $(nRow).css({"color": "#BBBBBB"})
            }
            return nRow;
        },
        "oLanguage": {
            sUrl: [ "css/<spring:message code="language"/>.txt"]
        },
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 0 ] },
            { "bSortable": false, "aTargets": [ 7 ] }
        ]
    });
}

$(document).ready(function () {
    $('#account').css({"background": "#DDDDDD"});
    getAllAccounts();
    setCheckSession();

    $('#delete').click(function () {
        if (accountArray.length <= 1) {
            bootbox.alert('<spring:message code="message.error.please.select" />', null);
            return;
        }
        bootbox.dialog({
            message: '<spring:message code="message.sure.batch.delete.records" />',
            title: '<spring:message code="title.batch.delete.records" />',
            buttons: {
                main: {
                    label: '<spring:message code="label.cancel" />',
                    className: "btn-default",
                    callback: null
                },
                danger: {
                    label: '<spring:message code="label.yes" />',
                    className: "btn-danger",
                    callback: function (result) {
                        if (result) {
                            $.ajax({
                                dataType: "json",
                                type: "POST",
                                url: 'account/ajax/deleteAccounts.do',
                                data: {accounts: accountArray},
                                traditional: true,
                                success: function (data) {
                                    if (!data.success) {
                                        bootbox.alert(data.message, null);
                                    }
                                    unSelectAll();
                                    accountArray = [0];
                                    accountTable.fnClearTable(0);
                                    accountTable.fnDraw();
                                }
                            });
                        }
                    }
                }
            }
        });
    });
});

</script>

</body>
</html>
