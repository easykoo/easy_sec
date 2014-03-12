$(function () {

    $('#side-menu').metisMenu();

});

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
$(function () {
    $(window).bind("load resize", function () {
        console.log($(this).width())
        if ($(this).width() < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    })
})

var setCheckSession = function () {
    setInterval(checkSession, 60000);
}

var checkSession = function () {
    $.ajax('ajax/checkSession.do', {
        dataType: 'json',
        type: "POST",
        success: function (data) {
            if (!data.success) {
                window.location.href = "index.jsp";
            }
        }
    });
}
