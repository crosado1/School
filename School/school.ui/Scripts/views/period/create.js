(function () {
    var init = function () {
    };

    var onShowModal = function (response) {
        $('#addPeriodHtml').html(response.Html);
        $('#add-period').modal('show');        
    }

    this.showCreatePeriod = function () {
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Period/ShowPeriodModal',
            success: function (response) {
                onShowModal(response);
            }
        });
    }

    this.savePeriod = function () {
        alert('savePeriod');

        let from = $('#From').val();
        let to = $('#To').val();
        

        var chkselected = [];
        
        $('div#checkboxes input[type=checkbox]:checked').each(function () {            
            chkselected.push($(this).attr('id'));
        });
        

        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Period/Save',
            data: {
                from: from,
                to: to,
                gradesIds: chkselected
            },
            success: function (response) {
                alert('Save Ok');
                //if (response.Status == 'OK') {
                //    $('#addGroupHtml').html(response.Html);
                //    $('#add-group').modal('show');
                //}
            }
        });
        }

    init();
}())