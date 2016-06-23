(function () {
    this.saveGroup = function () {
        let leaderId = $('#Leader').val();
        let groupNumber = $('#GroupNumber').val();
        let groupDescription = $('#GroupDescription').val();

        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PeriodGrade/SaveGroup',
            data: {
                periodGradeId: $('#hvPeriodGradeId').val(),
                leader: leaderId,
                group : groupNumber,
                description : groupDescription
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
}());