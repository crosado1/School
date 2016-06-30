(function () {
    var init = function () {
        showCreatePeriod();
    };

    var onShowModal = function (response) {
        $('#addPeriodHtml').html(response.Html);
        setControls();
        //$('#add-period').modal('show');
    }

    var setControls = function () {
        $('.datepicker').datepicker({
            format: 'M-yyyy',
            viewMode: "months",
            minViewMode: "months"
        }).on('changeDate', function (e) {
            $(this).datepicker('hide');
        });
    }

    //$('#add-period').on('shown.bs.modal', function () {
    //    $('.datepicker').datepicker({
    //        format: 'M-yyyy',
    //        viewMode: "months",
    //        minViewMode: "months"
    //    }).on('changeDate', function (e) {
    //        $(this).datepicker('hide');
    //    });
    //});

    var onCompleted = function (response) {
        //$('#add-period').modal('hide');
        loadTable();

        var result = $('#dvResult');
        if (response.Status == "OK")
        {
            result.addClass('alert alert-success');
            $('#btnNewPeriod').attr('disabled', true);
        }            
        else
            result.addClass('alert alert-danger');

        result.html(response.Message);
        result.show();
    }

    this.showCreatePeriod = function () {
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Period/ShowPeriodModal',
            data:
            {
                periodId: 0
            },
            success: function (response) {
                onShowModal(response);
            }
        });
    }

    this.savePeriod = function () {
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
                onCompleted(response);
            }
        });
        }

    init();
}())