<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<%@ page import="com.easykoo.util.ConfigUtils" %>
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

    <title><spring:message code="label.news"/></title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet"/>

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
            <h1 class="page-header"><spring:message code="label.all.news"/></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a class="btn btn-success" href="/news/publishNews.do"><i
                            class="fa fa-edit fa-fw"></i><spring:message code="label.publish"/></a>
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
                                <th><spring:message code="label.language"/></th>
                                <th><spring:message code="label.priority"/></th>
                                <th><spring:message code="label.title"/></th>
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
<script src="js/jquery.metisMenu.js"></script>
<script src="js/lightbox-2.6.min.js"></script>

<!-- Page-Level Plugin Scripts - Tables -->
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap.js"></script>

<!-- Custom Scripts - Include with every page -->
<script src="js/admin.js"></script>
<script src="js/easykoo.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script type="text/javascript" charset="utf-8">
var newsTable;

var deleteNews = function (id) {
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
                        $.ajax('news/ajax/deleteNews.do', {
                            dataType: 'json',
                            type: "POST",
                            data: {
                                newsId: id
                            },
                            success: function (data) {
                                if (!data.success) {
                                    bootbox.alert(data.message, null);
                                }
                                newsTable.fnClearTable(0);
                                newsTable.fnDraw();
                            }
                        });
                    }
                }
            }
        }
    });
}

var editNews = function (id) {
    var newsList = newsTable.fnGetData();
    $.each(newsList, function (index, news) {
        if (news.newsId == id) {
            var html = '<div class=\"row\"><div class=\"col-lg-15\"><form id=\"newsForm\" role=\"form\" class=\"form-horizontal\" enctype=\"multipart/form-data\" method=\"post\" action=\"news/publishNews.do\">'
                    + '<div class=\"form-group\">'
                    + '<label for=\"lang\" class=\"col-sm-3 control-label\"><span style=\"color: red\">*</span> <spring:message code="label.language"/></label>'
                    + '<div class=\"col-sm-6\">'
                    + '<select id=\"lang\" class=\"form-control\" name=\"lang\">'
                    + '<option ';
            if (news.lang == 'en') {
                html += 'selected';
            }
            html += ' value=\"en\">English</option>';
            html += '<option ';
            if (news.lang == 'zh_CN') {
                html += 'selected';
            }
            html += ' value=\"zh_CN\">中文</option>'
                    + '</select>'
                    + '</div>'
                    + '<div class=\"col-sm-4 control-label\"></div>'
                    + '</div>'
                    + '<div class=\"form-group\">'
                    + '<label for=\"priority\" class=\"col-sm-3 control-label\"><span style=\"color: red\">*</span> <spring:message code="label.priority"/></label>'
                    + '<div class=\"col-sm-6\">'
                    + '<select id=\"priority\" class=\"form-control\" name=\"priority\">';


            for (i = 5; i > 0; i--) {
                html += '<option ';
                if (news.priority == i) {
                    html += 'selected';
                }
                html += ' value=\"' + i + '\">' + i + '</option>';
            }
            html += '</select>'
                    + '</div>'
                    + '<div class=\"col-sm-4 control-label\"></div>'
                    + '</div>'
                    + '<div class=\"form-group\">'
                    + '<label for=\"title\" class=\"col-sm-3 control-label\"><span style=\"color: red\">*</span> <spring:message code="label.title"/></label>'
                    + '<div class=\"col-sm-6\">'
                    + '<input type=\"text\" id=\"title\" class=\"form-control\" name=\"title\" value=\"' + news.title + '\">'
                    + '</div>'
                    + '<div class=\"col-sm-4 control-label\"></div>'
                    + '</div>'
                    + '<div class=\"form-group\">'
                    + '<label for=\"content\" class=\"col-sm-3 control-label\"><span style=\"color: red\">*</span>'
                    + '<spring:message code="label.content"/></label>'
                    + '<div class=\"col-sm-6\">'
                    + '<textarea id=\"content\" name=\"content\" rows=\"10\" class=\"form-control\"/></textarea>'
                    + '</div>'
                    + '<div class=\"col-sm-4 control-label\"></div>'
                    + '</div>'
                    + '<div class=\"form-group\">'
                    + '<div class=\"col-sm-offset-2 col-sm-6\">'
                    + '<div class=\"btn-group\">'
                    + '<button id=\"change\" onclick=\"checkCommit(' + news.newsId + ')\" type=\"button\" class=\"btn btn-danger\"><spring:message code="label.change"/></button>'
                    + '<button id=\"cancel\" onclick=\"$(\'.bootbox-close-button\').click()\" type=\"button\" class=\"btn btn-default\"><spring:message code="label.cancel"/></button>'
                    + '</div>'
                    + '</div></div>'
                    + '</form></div></div>';

            box = bootbox.dialog({
                title: '<spring:message code="label.change.news" />',
                message: html,
                buttons: null
            });
            $('#content').val(news.content);
        }
    });
};

var box = null;

var checkCommit = function (newsId) {
    var newsList = newsTable.fnGetData();
    $.each(newsList, function (index, news) {
        if (news.newsId == newsId) {
            var check1 = checkFiled($('#title'))
            var check2 = checkFiled($('#content'))
            if (check1 && check2) {
                $.ajax({
                    dataType: "json",
                    type: "POST",
                    url: 'news/ajax/changeNews.do',
                    data: {
                        newsId: news.newsId,
                        lang: $('#lang').val(),
                        priority: $('#priority').val(),
                        title: $('#title').val(),
                        content: $('#content').val()
                    },
                    success: function (data) {
                        if (!data.success) {
                            bootbox.alert(data.message, null);
                        } else {
                            $(".bootbox-close-button").click();
                        }
                        newsTable.fnClearTable(0);
                        newsTable.fnDraw();
                    }
                });
            } else {
            }
        }
    });
}

var checkFiled = function (obj) {
    if (obj.val() == '') {
        if (obj.parent("div").next("div").children('span').length == 0) {
            $('<span><spring:message code="message.error.required"/></span>').appendTo(obj.parent("div").next("div"));
        }
        obj.parent("div").parent("div").addClass("has-error").removeClass("has-success");
        return false;
    } else {
        obj.parent("div").next("div").children('span').remove()
        obj.parent("div").parent("div").removeClass("has-error").addClass("has-success");
        return true;
    }
}

var newsArray = [0];

var selectNews = function (obj, newsId) {
    if ($(obj).prop("checked")) {
        if ($.inArray(newsId, newsArray) < 0) {
            newsArray.push(newsId);
        }
    } else {
        if ($.inArray(newsId, newsArray) >= 0) {
            $.each(newsArray, function (key, value) {
                newsArray.splice(key, key)
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

var getAllNews = function () {
    newsTable = $('#dataTable').dataTable({
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
        sAjaxSource: 'news/ajax/allNews.do',
        aaSorting: [
            [1, 'asc']
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
                "mData": "news_id"},
            { "sTitle": "<spring:message code="label.id"/>",
                "mData": "news_id"},
            { "sTitle": "<spring:message code="label.language"/>",
                "mData": "lang"},
            { "sTitle": "<spring:message code="label.priority"/>",
                "mData": "priority"},
            { "sTitle": "<spring:message code="label.title"/>",
                "mData": "title"},
            { "sTitle": "<spring:message code="label.content"/>",
                "mData": "content"},
            { "sTitle": "<spring:message code="label.create.date"/>",
                "mData": "create_date"},
            { "sTitle": "<spring:message code="label.actions"/>",
                "mData": "news_id"}
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex) {
            $('td:eq(0)', nRow).html('<input type="checkbox" name="selectFlag" onchange="selectNews(this,' + aData.newsId + ')"/>');
            var createDate = timeStamp2String(aData.createDate);
            $('td:eq(2)', nRow).text(aData.lang == 'en' ? 'English' : '中文');
            $('td:eq(6)', nRow).text(createDate);
            var html = '<div class="btn-group "><a class="btn btn-primary" href="javascript:"><i class="fa fa-gavel fa-fw"></i></a>' +
                    '<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="javascript:"><span class="fa fa-caret-down"></span></a>' +
                    '<ul class="dropdown-menu">'
                    + '<li><a href="javascript:editNews(' + aData.newsId + ')"><i class="fa fa-edit fa-fw"></i>'
                    + '<strong> <spring:message code="label.edit"/></strong>'
                    + '</a></li>'
                    + '<li><a href="javascript:deleteNews(' + aData.newsId + ')"><i class="fa fa-trash-o fa-fw"></i>'
                    + '<strong> <spring:message code="label.delete"/></strong>'
                    + '</a></li>'
                    + '</ul></div>';
            $('td:eq(7)', nRow).html(html);

            $('td:eq(0)', nRow).width(20);
            $('td:eq(1)', nRow).width(30);
            $('td:eq(2)', nRow).width(90);
            $('td:eq(3)', nRow).width(70);
            $('td:eq(6)', nRow).width(150);
            $('td:eq(7)', nRow).width(80);

            return nRow;
        },
        "oLanguage": {
            sUrl: [ "css/<spring:message code="language"/>.txt"]
        },
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 0 ] },
            { "bSortable": false, "aTargets": [ 4 ] },
            { "bSortable": false, "aTargets": [ 5 ] },
            { "bSortable": false, "aTargets": [ 7 ] }
        ]
    });
}

$(document).ready(function () {
    $('#news').toggleClass('active').children('ul').collapse('toggle');
    $('#allNews').css({"background": "#DDDDDD"});
    getAllNews();
    setCheckSession();

    $('#delete').click(function () {
        if (newsArray.length <= 1) {
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
                                url: 'news/ajax/deleteNewsArray.do',
                                data: {newsArray: newsArray},
                                traditional: true,
                                success: function (data) {
                                    if (!data.success) {
                                        bootbox.alert(data.message, null);
                                    }
                                    unSelectAll();
                                    newsArray = [0];
                                    newsTable.fnClearTable(0);
                                    newsTable.fnDraw();
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
