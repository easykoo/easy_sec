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

    <title><spring:message code="label.all.feedback"/></title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <%--<link href="font-awesome/css/font-awesome.css" rel="stylesheet">--%>

    <!-- Page-Level Plugin CSS - Tables -->
    <link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="css/admin.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.js"></script>
    <script src="js/PIE.js"></script>
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
                    DataTables Advanced Tables
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th><spring:message code="label.id"/></th>
                                <th><spring:message code="label.name"/></th>
                                <th><spring:message code="label.email"/></th>
                                <th><spring:message code="label.content"/></th>
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
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>

<!-- Page-Level Plugin Scripts - Tables -->
<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- SB Admin Scripts - Include with every page -->
<script src="js/admin.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script type="text/javascript" charset="utf-8">
    var feedbackTable;

    var deleteFeedback = function (id) {
        bootbox.dialog({
            message: "Are you sure to delete this feedback?",
            title: "Delete Feedback",
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
                            $.ajax('ajax/deleteFeedback.do', {
                                dataType: 'json',
                                data: {
                                    id: id
                                },
                                success: function (data) {
                                    if (data == 'true') {
                                        feedbackTable.fnClearTable(0);
                                        feedbackTable.fnDraw();
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


    var readFeedback = function (id) {
        var feedbackList = feedbackTable.fnGetData();
        $.each(feedbackList, function (index, feedback) {
            if (feedback.feedbackId == id) {
                bootbox.dialog({
                    message: feedback.content,
                    title: feedback.name,
                    buttons: {
                        success: {
                            label: "OK",
                            className: "btn-success",
                            callback: function () {
                                $.ajax({
                                    dataType: "json",
                                    type: "GET",
                                    url: 'ajax/readFeedback.do',
                                    data: {id: id},
                                    success: function (data) {
                                        if (data == 'true') {
                                            feedbackTable.fnClearTable(0);
                                            feedbackTable.fnDraw();
                                        }
                                    }
                                });
                            }
                        }
                    }
                });
            }
        });
    };

    var getAllFeedback = function () {
        feedbackTable = $('#dataTables-example').dataTable({
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
            sAjaxSource: 'ajax/allFeedback.do',
            aaSorting: [[0,'desc'],[5,'asc']],
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
                    "mData": "feedback_id",
                    "mDataProp": "feedback_id"},
                { "sTitle": "<spring:message code="label.name"/>",
                    "mData": "name"},
                { "sTitle": "<spring:message code="label.email"/>",
                    "mData": "email"},
                { "sTitle": "<spring:message code="label.content"/>",
                    "mData": "content"},
                { "sTitle": "<spring:message code="label.create.date"/>",
                    "mData": "create_date"},
                { "sTitle": "<spring:message code="label.actions"/>",
                    "mData": "viewed"}
            ],
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                var createDate = timeStamp2String(aData.create_date);
                $('td:eq(4)', nRow).text(createDate);
                var html = '<div class="btn-group "><a class="btn btn-primary" href="javascript:"><i class="fa fa-user fa-fw"></i></a>' +
                        '<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="javascript:"><span class="fa fa-caret-down"></span></a>' +
                        '<ul class="dropdown-menu">' +
                        '<li><a href="javascript:deleteFeedback(' + aData.feedback_id + ')"><i class="fa fa-trash-o fa-fw"></i>'
                        + '<strong> <spring:message code="label.delete"/></strong>'
                        + '</a></li>';
                if (!aData.viewed) {
                    html += '<li><a href="javascript:readFeedback(' + aData.feedback_id + ')"><i class="fa fa-eye fa-fw"></i>'
                            + '<strong> <spring:message code="label.view"/></strong>'
                            + '</a></li>';
                }
                html += '</ul></div>';
                $('td:eq(5)', nRow).html(html);
                if (aData.viewed) {
                    $(nRow).css({"color": "#BBBBBB"})

                }
                return nRow;
            },
            "oLanguage": {
                sUrl: [ "css/plugins/dataTables/<spring:message code="language"/>.txt"]
            },
            "aoColumnDefs": [
                { "bSortable": false, "aTargets": [ 5 ] }
            ]
        });
    }
    $(document).ready(function () {
        $('#feedback').css({"background":"#DDDDDD"});
        getAllFeedback();
        setCheckSession();
    });

</script>

</body>
</html>
