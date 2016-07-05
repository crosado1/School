
(function()
{
    /* Private methods */
    var init = function () {
    }

    var showTabContent = function (tab) {
        let url = tab.data('url');
        let content = $('#' + tab.data('content'));
        let studentId = $('#hvSelectedStudentId').val();

        let onload = tab.data('onload');
        

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


    //function pay_onload() {
    //    return 5 * 9;
    //}

    //this.sum = function (a, b) { return a + b; }

    var setTabContent = function (content, response, tab) {
        content.html(response.Html);
        console.log(onInitFunction);
        for (var i = 0; i < onInitFunction.length; i++) {            
            //console.log(onload);
            onInitFunction[i]();
        }
        onInitFunction = [];
        

        //let isHasLoadClass = $(tab).hasClass('loadServerSide');
        

        //if (isHasLoadClass && response.Status == 'OK')
        //    $(tab).removeClass('loadServerSide');
    }

    //this.onInitTab = function (param1, param2, callback) {
    //    alert('se inicializo');
    //}

    //function onInitTab(param1, param2, callback) {
    //    alert('se inicializo');
    //}


    /* Public methods*/
    this.loadProfile = function()
    {
        alert('Carlos loadProfile');
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

        $('#hvSelectedStudentId').val(studentId);
        $('#profile-student').modal('show');
    }

    init();

    $(document).on('click', '.loadServerSide', {}, function (e) {
        let isHasLoadClass = $(e.target).hasClass('loadServerSide');
        if (isHasLoadClass)
            showTabContent($(e.target));
    });

    $('#profile-student').on('show.bs.modal', loadProfile);

    $('#profile-student').on('shown.bs.modal', function () {
       
    });

    //$('#profile-student').on('shown', function () {
    //    alert('modal');
    //});
}())