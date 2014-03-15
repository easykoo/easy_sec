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

    <title><spring:message code="label.product"/></title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="css/lightbox.css" media="screen"/>

    <!-- Page-Level Plugin CSS - Tables -->
    <link href="css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="css/admin.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <style>
        .row_selected {
            background-color: red
        }
    </style>
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
                                <th><spring:message code="label.image"/></th>
                                <th><spring:message code="label.name"/></th>
                                <th><spring:message code="label.category"/></th>
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

<!-- SB Admin Scripts - Include with every page -->
<script src="js/admin.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script type="text/javascript" charset="utf-8">
var productTable;

var deleteProduct = function (id) {
    bootbox.dialog({
        message: "Are you sure to delete this product?",
        title: "Delete Product",
        buttons: {
            main: {
                label: "Cancel",
                className: "btn-default",
                callback: null
            },
            danger: {
                label: "Yes",
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
            bootbox.dialog({
                message: product.content,
                title: product.name,
                buttons: {
                    success: {
                        label: "OK",
                        className: "btn-success",
                        callback: function () {
                            $.ajax({
                                dataType: "json",
                                type: "POST",
                                url: 'product/ajax/editProduct.do',
                                data: {id: id},
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
            });
        }
    });
};

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
//        $('input[type=checkbox]').prop('checked', $(obj).prop('checked'));
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
            { "sTitle": "<spring:message code="label.image"/>",
                "mData": "img"},
            { "sTitle": "<spring:message code="label.name"/>",
                "mData": "name"},
            { "sTitle": "<spring:message code="label.category"/>",
                "mData": "category_id"},
            { "sTitle": "<spring:message code="label.description"/>",
                "mData": "description"},
            { "sTitle": "<spring:message code="label.create.date"/>",
                "mData": "create_date"},
            { "sTitle": "<spring:message code="label.actions"/>",
                "mData": "product_id"}
        ],
        "fnRowCallback": function (nRow, aData, iDisplayIndex) {
            $('td:eq(0)', nRow).html('<input type="checkbox" name="selectFlag" onchange="selectProduct(this,' + aData.productId + ')"/>');
            $('td:eq(2)', nRow).html('<a href="' + aData.img + '" data-lightbox="image-2" title="'+aData.name+'"><img src="' + aData.img + '" class="img-responsive" alt="Responsive image"/></a> ');
            $('td:eq(4)', nRow).text(aData.category.description);
            var createDate = timeStamp2String(aData.createDate);
            $('td:eq(6)', nRow).text(createDate);
            var html = '<div class="btn-group "><a class="btn btn-primary" href="javascript:"><i class="fa fa-gavel fa-fw"></i></a>' +
                    '<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="javascript:"><span class="fa fa-caret-down"></span></a>' +
                    '<ul class="dropdown-menu">' +
                    '<li><a href="javascript:deleteProduct(' + aData.productId + ')"><i class="fa fa-trash-o fa-fw"></i>'
                    + '<strong> <spring:message code="label.delete"/></strong>'
                    + '</a></li>'
                    + '</ul></div>';
            $('td:eq(7)', nRow).html(html);

            $('td:eq(0)', nRow).width(20);
            $('td:eq(1)', nRow).width(40);
            $('td:eq(2)', nRow).width(100);
            $('td:eq(3)', nRow).width(80);
            $('td:eq(4)', nRow).width(40);
            $('td:eq(6)', nRow).width(150);
            $('td:eq(7)', nRow).width(80);

            return nRow;
        },
        "oLanguage": {
            sUrl: [ "css/<spring:message code="language"/>.txt"]
        },
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 0 ] },
            { "bSortable": false, "aTargets": [ 1 ] },
            { "bSortable": false, "aTargets": [ 6 ] }
        ]
    });
}

$(document).ready(function () {
    $('#product').toggleClass('active').children('ul').collapse('toggle');
    $('#allProduct').css({"background": "#DDDDDD"});
    getAllProduct();
    setCheckSession();

    $('#delete').click(function () {
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
                productTable.fnClearTable(0);
                productTable.fnDraw();
            }
        });
    });
});

</script>

</body>
</html>
