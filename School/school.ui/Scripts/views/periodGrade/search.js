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
        let accordionTable = '<div class="row">';
        accordionTable += '<div class="col-md-12">';
        accordionTable += '<div id="history-scroll">';
        accordionTable +=  '<table id="_historyTransaction" class="table table-striped table-fixed-header" style="margin-bottom: 0;">'
        accordionTable +=  '<thead><tr>';
        accordionTable +=  '<th>Group Number</th>';
        accordionTable +=  '<th>Group Description</th>';
        accordionTable +=  '<th>Leader</th>';
        accordionTable +=  '<th>Student Count</th></tr></thead>';
        accordionTable +=  '<tbody></tbody></table></div></div></div>'

        //<div class="row">
        //        <div class="col-md-12">                   
        //            <div id="history-scroll">
        //                <table id="_historyTransaction" class="table table-striped table-fixed-header" style="margin-bottom: 0;">
        //                    <thead>
        //                        <tr>
        //                            <th>Transaction Detail</th>                                    
        //                            <th>Total Pay</th>
        //                            <th>Pay Date</th>                                    
        //                        </tr>
        //                    </thead>
        //                    <tbody></tbody>
        //                </table>
        //            </div>
        //        </div>
        //    </div>

        $.each(response.Data, function (key, cell) {
            let accordionTable = '<div class="row">';
            accordionTable += '<div class="col-md-12">';
            accordionTable += '<div id="_groupScroll_' + cell.PeriodGradeId + '" class="groupScroll">';
            accordionTable += '<table id="_groupTable_'+ cell.PeriodGradeId +'" class="table table-striped table-fixed-header" style="margin-bottom: 0;">'
            accordionTable += '<thead><tr>';
            accordionTable += '<th>Group Number</th>';
            accordionTable += '<th>Group Description</th>';
            accordionTable += '<th>Leader</th>';
            accordionTable += '<th>Student Count</th></tr></thead>';
            accordionTable += '<tbody></tbody></table></div></div></div>'



            let panelInfo = '<div class="panel panel-default">';
            panelInfo += '<div class="panel-heading" role="tab" id="heading_' + cell.GradeModel.GradeDescription + '">';
            panelInfo += '<h4 class="panel-title pull-left">';
            panelInfo += '<a role="button" data-toggle="collapse" data-parent="#_periodGradeAccordion" href="#' + cell.PeriodGradeId + '" aria-expanded="true" aria-controls="' + cell.PeriodGradeId + '">' + cell.GradeModel.GradeDescription + '</a>';
            panelInfo += '</h4>';
            panelInfo += '<button onclick="showAddGradeGroups(this);" data-value="' + cell.PeriodGradeId + '" class="btn btn-primary btn-sm pull-right">Add Group</button><div class="clearfix"></div></div>'
            panelInfo += '<div id="' + cell.PeriodGradeId + '" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">';
            panelInfo += '<div class="panel-body">';
            panelInfo += accordionTable;
            panelInfo += '</div></div>';
            panelInfo += '</div>';


            $('#_periodGradeAccordion').append(panelInfo);

            
        });

        let firtPeriodGradePanelId = $('#_periodGradeAccordion .panel .panel-collapse').first().attr('id');
        loadGroupGrades(firtPeriodGradePanelId);
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

    var loadGroupGrades = function (periodGradeId) {       
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Grade/GetGroups',
            data:
                {
                    periodGradeId: periodGradeId == '' ? 0 : periodGradeId
                },
            success: function (response) {
                console.log(response.Data);
                $.each(response.Data, function (key, cell) {
                    $('#_groupTable_' +periodGradeId + '> tbody').append($('<tr></tr>')
                        .append($('<td></td>').text(cell.GroupNumber))
                        .append($('<td></td>').text(cell.GroupDescription))
                        .append($('<td></td>').text('testing Lead'))
                        .append($('<td></td>').text('5')))                        
                });
            }
        });
    }

    init();
}())