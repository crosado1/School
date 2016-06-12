(function()
{

    var init = function () {
        alert('init');
        //$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        //    var target = $(e.target).attr("href") // activated tab
        //    alert(target);
        //});
    }

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

    var showTabContent = function(tab)
    {
        
        let url = tab.data('url');
        let content = $('#' + tab.data('content'));
        console.log(content);
        let studentId = 7;
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: url,
            data: {
                studentId: studentId
            },
            success: function (response) {
                setTabContent(content, response,tab);
            }
        });
    }

    var setTabContent = function (content, response, tab) {        
        content.html(response.Html);
        
        let isHasLoadClass = $(tab).hasClass('loadServerSide');
        
        if (isHasLoadClass)
            $(tab).removeClass('loadServerSide');
    }

    init();

    $(document).on('shown.bs.tab', 'a[data-toggle="tab"]', function (e) {
        let isHasLoadClass = $(e.target).hasClass('loadServerSide');

        if (isHasLoadClass)
            showTabContent($(e.target));
        
        //var activatedTab = e.target; // activated tab
        //console.log(e.target);
    });

   
    
}())