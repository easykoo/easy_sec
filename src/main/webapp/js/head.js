/**
 * Created by easykooc on 14-3-2.
 */

var feedbacks = null;

var getTop5Feedback = function () {
    $.ajax({
        dataType: "json",
        type: "POST",
        url: 'feedback/ajax/getTop5Feedback.do',
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
        url: 'feedback/ajax/getFeedbackCount.do',
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
                                url: 'feedback/ajax/readFeedback.do',
                                data: {id: id},
                                success: function (data) {
                                    if (data.success()) {
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
    location.href = "feedback/allFeedback.do";
}
