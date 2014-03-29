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
    <link rel="shortcut icon" href="img/favicon.ico">

    <title><spring:message code="label.dashboard"/></title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <!-- Page-Level Plugin CSS - Tables -->
    <link href="css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="css/admin.css" rel="stylesheet">
    <script src="js/jquery-1.10.2.js"></script>

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><spring:message code="label.dashboard" /></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <spring:message code="label.recent.visit"/>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <div id="go"></div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>IP</th>
                                <th><spring:message code="label.visit.time"/></th>
                                <th><spring:message code="label.address"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.results}" var="sessionLog" varStatus="status">
                                <tr>
                                    <td>${status.index+1}</td>
                                    <td>${sessionLog.ip}</td>
                                    <td>${sessionLog.createDateStr}</td>
                                    <td id="${status.index+1}">
                                        <script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=${sessionLog.ip}"></script><script type="text/javascript">
                                        $('#${status.index+1}').text(remote_ip_info.country + remote_ip_info.province + remote_ip_info.city + remote_ip_info.district)</script>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
                <div class="panel-heading">

                    <c:if test="${page.totalPage > 1}">
                        <div align="center" class="clearpagination">
                                <a class="page_prev" href="javascript:previousPage()"><i class="fa fa-angle-left"></i></a>
                                <c:forEach begin="1" step="1" end="${page.totalPage}" var="pageNo">
                                    <c:if test="${pageNo == page.pageNo}">${pageNo}</c:if>
                                    <c:if test="${pageNo != page.pageNo}">
                                        <c:choose>
                                            <c:when test="${pageNo < page.pageNo - 5}">
                                                <c:choose>
                                                    <c:when test="${pageNo == 1}"><a
                                                            href="javascript:goPage(${pageNo})">${pageNo}</a></c:when>
                                                    <c:when test="${pageNo == page.pageNo - 6}">...</c:when>
                                                </c:choose>
                                            </c:when>
                                            <c:when test="${pageNo > page.pageNo + 5}">
                                                <c:choose>
                                                    <c:when test="${pageNo == page.totalPage}"><a
                                                            href="javascript:goPage(${pageNo})">${pageNo}</a></c:when>
                                                    <c:when test="${pageNo == page.pageNo + 6}">...</c:when>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:goPage(${pageNo})">${pageNo}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </c:forEach>
                                <a class="page_next" href="javascript:nextPage()"><i class="fa fa-angle-right"></i></a>
                        </div>
                    </c:if>
                </div>
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-6 -->
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <spring:message code="label.statistics"/>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th><spring:message code="label.total.count"/></th>
                                <th><spring:message code="label.month.count"/></th>
                                <th><spring:message code="label.day.count"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>#</td>
                                <td>${statistics.totalCount}</td>
                                <td>${statistics.monthCount}</td>
                                <td>${statistics.dayCount}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-6 -->
    </div>
    <!-- /.row -->
</div>

<!-- Core Scripts - Include with every page -->
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
<script>
    $(document).ready(function () {
        $('#dashboard').css({"background": "#DDDDDD"});
        $('#dataTable').dataTable();
        setCheckSession();
    });

    var pageNo = '${page.pageNo}';
    var pageSize = '${page.pageSize}';

    var previousPage = function () {
        var url = 'admin/dashboard.do?pageNo=' + (parseInt(pageNo) - 1) + '&pageSize=' + pageSize;
        window.location.href = url;
    }

    var refresh = function () {
        var url = 'admin/dashboard.do?pageNo=' + parseInt(pageNo) + '&pageSize=' + pageSize;
        window.location.href = url;
    }

    var nextPage = function () {
        var url = 'admin/dashboard.do?pageNo=' + (parseInt(pageNo) + 1) + '&pageSize=' + pageSize;
        window.location.href = url;
    }

    var goPage = function (pageNo) {
        var url = 'admin/dashboard.do?pageNo=' + pageNo + '&pageSize=' + pageSize;
        window.location.href = url;
    }
</script>
</body>
</html>
