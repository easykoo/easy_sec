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

    <title><spring:message code="label.product"/></title>

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
            <h1 class="page-header"><spring:message code="label.all.product"/></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a class="btn btn-success" href="/product/publishProduct.do"><i
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
                                <th><spring:message code="label.preview"/></th>
                                <th><spring:message code="label.name"/></th>
                                <th><spring:message code="label.category"/></th>
                                <th><spring:message code="label.priority"/></th>
                                <th><spring:message code="label.description"/></th>
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
var productTable;

var deleteProduct = function (id) {
    bootbox.dialog({
        message: '<spring:message code="message.sure.delete.product" />',
        title: '<spring:message code="title.delete.product" />',
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
                        $.ajax('product/ajax/deleteProduct.do', {
                            dataType: 'json',
                            type: "POST",
                            data: {
                                productId: id
                            },
                            success: function (data) {
                                if (!data.success) {
                                    bootbox.alert(data.message, null);
                                }
                                productTable.fnClearTable(0);
                                productTable.fnDraw();
                            }
                        });
                    }
                }
            }
        }
    });
}

var editProduct = function (id) {
    var productList = productTable.fnGetData();
    $.each(productList, function (index, product) {
        if (product.productId == id) {
            var html = '<div class=\"row\"><div class=\"col-lg-15\"><form id=\"productForm\" role=\"form\" class=\"form-horizontal\" enctype=\"multipart/form-data\" method=\"post\" action=\"product/publishProduct.do\">'
                    + '<div class=\"form-group\">'
                    + '<label for=\"priority\" class=\"col-sm-4 control-label\"><span style=\"color: red\">*</span> <spring:message code="label.priority"/></label>'
                    + '<div class=\"col-sm-6\">'
                    + '<select id=\"priority\" class=\"form-control\" name=\"priority\">';
            for (i = 5; i > 0; i--) {
                html += '<option ';
                if (product.priority == i) {
                    html += 'selected';
                }
                html += ' value=\"' + i + '\">' + i + '</option>';
            }
            html += '</select>'
                    + '</div>'
                    + '<div class=\"col-sm-4 control-label\"></div>'
                    + '</div>'
                    + '<div class=\"form-group\">'
                    + '<label for=\"name\" class=\"col-sm-4 control-label\"><span style=\"color: red\">*</span> <spring:message code="label.en.name"/></label>'
                    + '<div class=\"col-sm-6\">'
                    + '<input type=\"text\" id=\"name\" class=\"form-control\" name=\"name\" value=\"' + product.name + '\">'
                    + '</div>'
                    + '<div class=\"col-sm-4 control-label\"></div>'
                    + '</div>'
                    + '<div class=\"form-group\">'
                    + '<label for=\"cnName\" class=\"col-sm-4 control-label\"><span style=\"color: red\">*</span> <spring:message code="label.cn.name"/></label>'
                    + '<div class=\"col-sm-6\">'
                    + '<input type=\"text\" id=\"cnName\" class=\"form-control\" name=\"cnName\" value=\"' + product.cnName + '\">'
                    + '</div>'
                    + '<div class=\"col-sm-4 control-label\"></div>'
                    + '</div>'
                    + '<div class=\"form-group\">'
                    + '<label for=\"description\" class=\"col-sm-4 control-label\"><span style=\"color: red\">*</span>'
                    + '<spring:message code="label.en.description"/></label>'
                    + '<div class=\"col-sm-6\">'
                    + '<textarea id=\"description\" name=\"description\" rows=\"6\" class=\"form-control\"/></textarea>'
                    + '</div>'
                    + '<div class=\"col-sm-4 control-label\"></div>'
                    + '</div>'
                    + '<div class=\"form-group\">'
                    + '<label for=\"cnDescription\" class=\"col-sm-4 control-label\"><span style=\"color: red\">*</span>'
                    + '<spring:message code="label.cn.description"/></label>'
                    + '<div class=\"col-sm-6\">'
                    + '<textarea id=\"cnDescription\" name=\"cnDescription\" rows=\"6\" class=\"form-control\"/></textarea>'
                    + '</div>'
                    + '<div class=\"col-sm-4 control-label\"></div>'
                    + '</div>'
                    + '<div class=\"form-group\">'
                    + '<div class=\"col-sm-offset-4 col-sm-6\">'
                    + '<div class=\"btn-group\">'
                    + '<button id=\"change\" onclick=\"checkCommit(' + product.productId + ')\" type=\"button\" class=\"btn btn-danger\"><spring:message code="label.change"/></button>'
                    + '<button id=\"cancel\" onclick=\"$(\'.bootbox-close-button\').click()\" type=\"button\" class=\"btn btn-default\"><spring:message code="label.cancel"/></button>'
                    + '</div>'
                    + '</div></div>'
                    + '</form></div></div>';

            box = bootbox.dialog({
                title: '<spring:message code="label.change.product" />',
                message: html,
                buttons: null
            });
            $('#description').val(product.description);
            $('#cnDescription').val(product.cnDescription);
        }
    });
};

var box = null;

var checkCommit = function (productId) {
    var productList = productTable.fnGetData();
    $.each(productList, function (index, product) {
        if (product.productId == productId) {
            var check1 = checkFiled($('#name'))
            var check2 = checkFiled($('#cnName'))
            var check3 = checkFiled($('#description'))
            var check4 = checkFiled($('#cnDescription'))
            if (check1 && check2 && check3 && check4) {
                $.ajax({
                    dataType: "json",
                    type: "POST",
                    url: 'product/ajax/changeProduct.do',
                    data: {
                        productId: product.productId,
                        priority: $('#priority').val(),
                        name: $('#name').val(),
                        cnName: $('#cnName').val(),
                        description: $('#description').val(),
                        cnDescription: $('#cnDescription').val()
                    },
                    success: function (data) {
                        if (!data.success) {
                            bootbox.alert(data.message, null);
                        } else {
                            $(".bootbox-close-button").click();
                        }
                        productTable.fnClearTable(0);
                        productTable.fnDraw();
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

var productArray = [0];

var selectProduct = function (obj, productId) {
    if ($(obj).prop("checked")) {
        if ($.inArray(productId, productArray) < 0) {
            productArray.push(productId);
        }
    } else {
        if ($.inArray(productId, productArray) >= 0) {
            $.each(productArray, function (key, value) {
                productArray.splice(key, key)
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

var getAllProduct = function () {
    productTable = $('#dataTable').dataTable({
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
        sAjaxSource: 'product/ajax/allProduct.do',
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
                "mData": "product_id"},
            { "sTitle": "<spring:message code="label.id"/>",
                "mData": "product_id"},
            { "sTitle": "<spring:message code="label.preview"/>",
                "mData": "imgPath"},
            { "sTitle": "<spring:message code="label.category"/>",
                "mData": "category_id"},
            { "sTitle": "<spring:message code="label.priority"/>",
                "mData": "priority"},
            { "sTitle": "<spring:message code="label.name"/>",
                "mData": "name"},
            { "sTitle": "<spring:message code="label.description"/>",
                "mData": "description"},
            { "sTitle": "<spring:message code="label.create.date"/>",
                "mData": "create_date"},
            { "sTitle": "<spring:message code="label.actions"/>",
                "mData": "product_id"}
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex) {
            $('td:eq(0)', nRow).html('<input type="checkbox" name="selectFlag" onchange="selectProduct(this,' + aData.productId + ')"/>');
            var createDate = timeStamp2String(aData.createDate);
            $('td:eq(7)', nRow).text(createDate);
            $('td:eq(2)', nRow).html('<a href="' + aData.imgPath + '" data-lightbox="image-1" title="' + aData.name
                    + '"><img src="' + aData.preImgPath + '" class="img-responsive" alt="Responsive image"/></a> ');
            var html = '<div class="btn-group "><a class="btn btn-primary" href="javascript:"><i class="fa fa-gavel fa-fw"></i></a>' +
                    '<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="javascript:"><span class="fa fa-caret-down"></span></a>' +
                    '<ul class="dropdown-menu">'
                    + '<li><a href="javascript:editProduct(' + aData.productId + ')"><i class="fa fa-edit fa-fw"></i>'
                    + '<strong> <spring:message code="label.edit"/></strong>'
                    + '</a></li>'
                    + '<li><a href="javascript:deleteProduct(' + aData.productId + ')"><i class="fa fa-trash-o fa-fw"></i>'
                    + '<strong> <spring:message code="label.delete"/></strong>'
                    + '</a></li>'
                    + '</ul></div>';
            $('td:eq(8)', nRow).html(html);
            if ('zh_CN' == '<spring:message code="language"/>') {
                $('td:eq(3)', nRow).text(aData.category.cnDescription);
                $('td:eq(5)', nRow).text(aData.cnName);
            } else {
                $('td:eq(3)', nRow).text(aData.category.description);
                $('td:eq(5)', nRow).text(aData.name);
            }

            $('td:eq(0)', nRow).width(20);
            $('td:eq(1)', nRow).width(30);
            $('td:eq(2)', nRow).width(100);
            $('td:eq(3)', nRow).width(100);
            $('td:eq(4)', nRow).width(60);
            $('td:eq(5)', nRow).width(120);
            $('td:eq(7)', nRow).width(150);
            $('td:eq(8)', nRow).width(80);

            return nRow;
        },
        "oLanguage": {
            sUrl: [ "css/<spring:message code="language"/>.txt"]
        },
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 0 ] },
            { "bSortable": false, "aTargets": [ 1 ] },
            { "bSortable": false, "aTargets": [ 6 ] },
            { "bSortable": false, "aTargets": [ 7 ] }
        ]
    });
}

$(document).ready(function () {
    $('#product').toggleClass('active').children('ul').collapse('toggle');
    $('#allProduct').css({"background": "#DDDDDD"});
    getAllProduct();
    setCheckSession();

    $('#delete').click(function () {
        if (productArray.length <= 1) {
            bootbox.alert('<spring:message code="message.error.please.select" />', null);
            return;
        }
        bootbox.dialog({
            message: '<spring:message code="message.sure.delete.products" />',
            title: '<spring:message code="title.batch.delete.products" />',
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
                                url: 'product/ajax/deleteProducts.do',
                                data: {products: productArray},
                                traditional: true,
                                success: function (data) {
                                    if (!data.success) {
                                        bootbox.alert(data.message, null);
                                    }
                                    unSelectAll();
                                    productArray = [0];
                                    productTable.fnClearTable(0);
                                    productTable.fnDraw();
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
