(function () {
    this.saveGroup = function () {
        let leaderId = $('#Leader').val();
        let groupNumber = $('#GroupNumber').val();
        let groupDescription = $('#GroupDescription').val();
        let periodGradeId =  $('#hvPeriodGradeId').val()

        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PeriodGrade/SaveGroup',
            data: {
                periodGradeId: periodGradeId,
                leader: leaderId,
                group : groupNumber,
                description : groupDescription
            },
            success: function (response) {
                loadGroupGrades(periodGradeId);
            }
        });
    }

    this.showAddGrade = function () {
        
        let periodId = $('#hvPeriodId').val ();
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PeriodGrade/ShowGradeAvailables',
            data: {
                periodId: periodId
            },
            success: function (response) {
                onShowGrade(response);
            }
        });
    }

    this.saveGrade = function () {
        let periodId = $('#hvPeriodId').val();

        var chkselected = [];

        $('div#checkboxes input[type=checkbox]:checked').each(function () {
            chkselected.push($(this).attr('id'));
        });


        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PeriodGrade/Save',
            data: {
                periodId: periodId,
                gradesIds: chkselected
            },
            success: function (response) {
                onCompleted(response);
            }
        });
    }

    var onCompleted = function (response) {
        $('#add-grade').modal('hide');
        loadPeriodGrade();

        var result = $('#dvResult');
        if (response.Status == "OK") {
            result.addClass('alert alert-success');
            //$('#btnNewPeriod').attr('disabled', true);
        }
        else
            result.addClass('alert alert-danger');

        result.html(response.Message);
        result.show();
    }

    var onShowGrade = function (response) {
        let modalObj = $('#add-grade');
        let htmlBind = $('#addGradeHtml');
        if (response.Status == 'OK') {
            htmlBind.html(response.Html);
            modalObj.modal('show');
        }
    }
}());