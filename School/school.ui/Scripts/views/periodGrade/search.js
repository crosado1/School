(function () {
    var init = function () {
        loadPeriodGrade();
    };

    this.showAddGradeGroups = function(button)
    {
        let buttonObj = $(button);
        let periodGroupId = buttonObj.data('value');

        // Set hidden value to Save a Group
        $('#hvPeriodGradeId').val(periodGroupId);

        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PeriodGrade/ShowStudentTransaction',           
            success: function (response) {
                if (response.Status == 'OK') {
                    $('#addGroupHtml').html(response.Html);
                    $('#add-group').modal('show');
                } 
            }
        });

       
    }

    var createAccordion = function (response) {
        $.each(response.Data, function (key, cell) {
            let panelInfo = '<div class="panel panel-default">';
            panelInfo += '<div class="panel-heading" role="tab" id="heading_' + cell.GradeModel.GradeDescription + '">';
            panelInfo += '<h4 class="panel-title pull-left">';
            panelInfo += '<a role="button" data-toggle="collapse" data-parent="#_periodGradeAccordion" href="#' + cell.PeriodGradeId + '" aria-expanded="true" aria-controls="' + cell.PeriodGradeId + '">' + cell.GradeModel.GradeDescription + '</a>';
            panelInfo += '</h4>';
            panelInfo += '<button onclick="showAddGradeGroups(this);" data-value="' + cell.PeriodGradeId + '" class="btn btn-primary btn-sm pull-right">Add Group</button><div class="clearfix"></div></div>'
            panelInfo += '<div id="' + cell.PeriodGradeId + '" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">';
            panelInfo += '<div class="panel-body">';
            panelInfo += 'Carlos';
            panelInfo += '</div></div>';
            panelInfo += '</div>';


            $('#_periodGradeAccordion').append(panelInfo);
        });
    }

    var loadPeriodGrade = function () {
        let periodId = 4;
        //createAccordion('tset');
        //createAccordion('tset');

        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PeriodGrade/GetAllByPeriod',
            data: {
                periodId: periodId
            },
            success: function (response) {
                console.log(response.Data);
                if (response.Data.length > 0) {
                    createAccordion(response);
                } else {
                    alert('data not found');
                    //$('#_availableTransaction > tbody').append($('<tr></tr>')
                    //    .append($('<td></td>')
                    //    .attr('colspan', '7')
                    //    .text('No available records.')));
                }
            }
        });
    }
    init();
}())