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

    <title><spring:message code="label.all.feedback"/></title>

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
            <h1 class="page-header"><spring:message code="label.all.feedback"/></h1>
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
                                <th><spring:message code="label.name"/></th>
                                <th><spring:message code="label.email"/></th>
                                <th><spring:message code="label.content"/></th>
                                <th><spring:message code="label.status"/></th>
                                <th><spring:message code="label.create.date"/></th>
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
var feedbackTable;

var deleteFeedback = function (id) {
    bootbox.dialog({
        message: '<spring:message code="message.sure.delete.record" />',
        title: '<spring:message code="title.delete.record" />',
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
                        $.ajax('feedback/ajax/deleteFeedback.do', {
                            dataType: 'json',
                            type: "POST",
                            data: {
                                id: id
                            },
                            success: function (data) {
                                if (!data.success) {
                                    bootbox.alert(data.message, null);
                                }
                                feedbackTable.fnClearTable(0);
                                feedbackTable.fnDraw();
                            }
                        });
                    }
                }
            }
        }
    });
}


var readFeedback = function (id) {
    var feedbackList = feedbackTable.fnGetData();
    $.each(feedbackList, function (index, feedback) {
        if (feedback.feedbackId == id) {
            bootbox.dialog({
                message: feedback.content,
                title: feedback.name,
                buttons: {
                    success: {
                        label: '<spring:message code="label.ok" />',
                        className: "btn-success",
                        callback: function () {
                            $.ajax({
                                dataType: "json",
                                type: "POST",
                                url: 'feedback/ajax/readFeedback.do',
                                data: {id: id},
                                success: function (data) {
                                    if (!data.success) {
                                        bootbox.alert(data.message, null);
                                    }
                                    feedbackTable.fnClearTable(0);
                                    feedbackTable.fnDraw();
                                }
                            });
                        }
                    }
                }
            });
        }
    });
};

var feedbackArray = [0];

var selectFeedback = function (obj, feedbackId) {
    if ($(obj).prop("checked")) {
        if ($.inArray(feedbackId, feedbackArray) < 0) {
            feedbackArray.push(feedbackId);
        }
    } else {
        if ($.inArray(feedbackId, feedbackArray) >= 0) {
            $.each(feedbackArray, function (key, value) {
                feedbackArray.splice(key, key)
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

var getAllFeedback = function () {
    feedbackTable = $('#dataTable').dataTable({
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
        sAjaxSource: 'feedback/ajax/allFeedback.do',
        aaSorting: [
            [1, 'desc'],
            [5, 'asc']
        ],
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
                "mData": "name"},
            { "sTitle": "<spring:message code="label.name"/>",
                "mData": "name"},
            { "sTitle": "<spring:message code="label.email"/>",
                "mData": "email"},
            { "sTitle": "<spring:message code="label.content"/>",
                "mData": "content"},
            { "sTitle": "<spring:message code="label.status"/>",
                "mData": "viewed"},
            { "sTitle": "<spring:message code="label.create.date"/>",
                "mData": "create_date"},
            { "sTitle": "<spring:message code="label.actions"/>",
                "mData": "feedbackId"}
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex) {
            $('td:eq(0)', nRow).html('<input type="checkbox" name="selectFlag" onchange="selectFeedback(this,' + aData.feedbackId + ')"/>');
            if (aData.viewed) {
                $('td:eq(4)', nRow).text('<spring:message code="label.read" />');
                $(nRow).css({"color": "#BBBBBB"})
            } else {
                $('td:eq(4)', nRow).text('<spring:message code="label.unread" />');
            }

            var createDate = timeStamp2String(aData.createDate);
            $('td:eq(5)', nRow).text(createDate);

            var html = '<div class="btn-group "><a class="btn btn-primary" href="javascript:"><i class="fa fa-gavel fa-fw"></i></a>' +
                    '<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="javascript:"><span class="fa fa-caret-down"></span></a>' +
                    '<ul class="dropdown-menu">' +
                    '<li><a href="javascript:deleteFeedback(' + aData.feedbackId + ')"><i class="fa fa-trash-o fa-fw"></i>'
                    + '<strong> <spring:message code="label.delete"/></strong>'
                    + '</a></li>';
            if (!aData.viewed) {
                html += '<li><a href="javascript:readFeedback(' + aData.feedbackId + ')"><i class="fa fa-eye fa-fw"></i>'
                        + '<strong> <spring:message code="label.view"/></strong>'
                        + '</a></li>';
            }
            html += '</ul></div>';
            $('td:eq(6)', nRow).html(html);

            $('td:eq(0)', nRow).width(20);
            $('td:eq(1)', nRow).width(100);
            $('td:eq(2)', nRow).width(200);
            $('td:eq(4)', nRow).width(60);
            $('td:eq(5)', nRow).width(150);
            $('td:eq(6)', nRow).width(80);
            return nRow;
        },
        "oLanguage": {
            sUrl: [ "css/<spring:message code="language"/>.txt"]
        },
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 0 ] },
            { "bSortable": false, "aTargets": [ 6 ] }
        ]
    });
}
$(document).ready(function () {
    $('#feedback').css({"background": "#DDDDDD"});
    getAllFeedback();
    setCheckSession();

    $('#delete').click(function () {
        if (feedbackArray.length <= 1) {
            bootbox.alert('<spring:message code="message.error.please.select" />', null);
            return;
        }
        bootbox.dialog({
            message: '<spring:message code="message.sure.batch.delete.feedback" />',
            title: '<spring:message code="title.batch.delete.feedback" />',
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
                                url: 'feedback/ajax/deleteFeedbackArray.do',
                                data: {feedbackArray: feedbackArray},
                                traditional: true,
                                success: function (data) {
                                    if (!data.success) {
                                        bootbox.alert(data.message, null);
                                    }
                                    unSelectAll();
                                    feedbackArray = [0];
                                    feedbackTable.fnClearTable(0);
                                    feedbackTable.fnDraw();
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
