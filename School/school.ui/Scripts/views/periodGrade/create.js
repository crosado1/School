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
        showAddGrade();
        loadPeriodGrade();

        //var result = $('#dvResult');
        //if (response.Status == "OK") {
        //    result.addClass('alert alert-success');
        //    //$('#btnNewPeriod').attr('disabled', true);
        //}
        //else
        //    result.addClass('alert alert-danger');

        //result.html(response.Message);
        //result.show();
    }

  
}());