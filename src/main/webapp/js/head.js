/**
 * Created by easykooc on 14-3-2.
 */

var feedbacks = null;

var getTop5Feedback = function () {
    $.ajax({
        dataType: "json",
        type: "POST",
        url: 'ajax/getTop5Feedback.do',
        data: null,
        success: function (data) {
            $('#feedback_notification').empty();
            var html = '';
            if (data != null) {
                feedbacks = data;
                $.each(data, function (index, feedback) {
                    html += '<li>'
                        + '<a href="javascript:readFeedbackWithCallback(' + feedback.feedbackId + ',getTop5Feedback, getFeedbackCount)">'
                        + '<div>'
                        + '<strong>' + (feedback.name.length <= 5 ? feedback.name : (feedback.name.substr(0, 5) + '... ')) + '</strong>'
                        + '<span class="pull-right text-muted">'
                        + '<em>' + timeStamp2String(feedback.createDate) + '</em>'
                        + '</span>'
                        + '</div>'
                        + '<div>' + (feedback.content.length <= 30 ? feedback.content : (feedback.content.substr(0, 30) + '... ')) + '</div>'
                        + '</a>'
                        + '</li>'
                        + '<li class="divider"></li>'
                });

                html += '<li>'
                    + '<a class="text-center" href="javascript:viewAllFeedback()">'
                    + '<strong>Read All Messages<spring:message code="label.read.all.message"/></strong>'
                    + '<i class="fa fa-angle-right"></i>'
                    + '</a>'
                    + '</li>'
                $('#feedback_notification').html(html);
            }
        }
    });
};


var getFeedbackCount = function () {
    $.ajax({
        dataType: "json",
        type: "POST",
        url: 'ajax/getFeedbackCount.do',
        data: null,
        success: function (data) {
            if (data == 0) {
                $('#feedbackCount').empty();
            } else {
                $('#feedbackCount').text(data);
            }
        }
    });
};

var timeStamp2String = function (time) {
    var datetime = new Date();
    datetime.setTime(time);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
    var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
    return hour + ":" + minute + ":" + second + " " + month + "/" + date + "/" + year;
};

var readFeedbackWithCallback = function (id, fnCallback1, fnCallback2) {
    $.each(feedbacks, function (index, feedback) {
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
                                type: "POST",
                                url: 'ajax/readFeedback.do',
                                data: {id: id},
                                success: function (data) {
                                    if (data == 'true') {
                                        if (fnCallback1 != null)fnCallback1();
                                        if (fnCallback2 != null)fnCallback2();
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

var viewAllFeedback = function () {
    location.href = "admin/allFeedback.do";
}
