(function()
{
    /* Private methods */
    var init = function () {
    }

    var showTabContent = function (tab) {
        let url = tab.data('url');
        let content = $('#' + tab.data('content'));
        let studentId = 7;
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: url,
            data: {
                studentId: studentId
            },
            success: function (response) {
                setTabContent(content, response, tab);
            }
        });
    }

    var setTabContent = function (content, response, tab) {
        content.html(response.Html);

        let isHasLoadClass = $(tab).hasClass('loadServerSide');
        

        if (isHasLoadClass && response.Status == 'OK')
            $(tab).removeClass('loadServerSide');
    }

    /* Public methods*/
    this.loadProfile = function()
    {
        $.ajax({
            'dataType': 'json',
            'type': 'POST',
            'url': '/Student/ShowStudentProfile',
            'success': function (json) {
                $("#loadProfile").html(json.Html);
                showTabContent($('#maincontent li > a').first());
            }
        });
    }

    this.showStudentProfileModal = function (button) {
        let actionButton = $(button);
        let studentId = actionButton.data('id');
        $('#profile-student').modal('show');
    }

    init();

    $(document).on('click', '.loadServerSide', {}, function (e) {
        let isHasLoadClass = $(e.target).hasClass('loadServerSide');
        if (isHasLoadClass)
            showTabContent($(e.target));
    });

    $('#profile-student').on('show.bs.modal', loadProfile);
}())