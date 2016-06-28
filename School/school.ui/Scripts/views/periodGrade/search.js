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



            let panelInfo = '<div id=panelInfo_' + cell.PeriodGradeId + ' class="panel panel-default">';
            panelInfo += '<div class="panel-heading" role="tab" id="heading_' + cell.GradeModel.GradeDescription + '">';
            panelInfo += '<h4 class="panel-title pull-left">';
            panelInfo += '<a role="button" data-toggle="collapse" data-parent="#_periodGradeAccordion" href="#' + cell.PeriodGradeId + '" aria-expanded="true" aria-controls="' + cell.PeriodGradeId + '">' + cell.GradeModel.GradeDescription + '</a>';
            //panelInfo += '<a role="button" onclick="loadGroupGrades(' + cell.PeriodGradeId + ')" data-toggle="collapse" data-parent="#_periodGradeAccordion" href="#' + cell.PeriodGradeId + '" aria-expanded="true" aria-controls="' + cell.PeriodGradeId + '">' + cell.GradeModel.GradeDescription + '</a>';
            panelInfo += '</h4>';
            //panelInfo += '</div>';
            panelInfo += '<button onclick="showAddGradeGroups(this);" data-value="' + cell.PeriodGradeId + '" class="btn btn-primary btn-sm pull-right">Add Group</button><div class="clearfix"></div></div>'
            panelInfo += '<div id="' + cell.PeriodGradeId + '" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">';
            panelInfo += '<div class="panel-body">';
            //panelInfo += '<button onclick="showAddGradeGroups(this);" data-value="' + cell.PeriodGradeId + '" class="btn btn-primary btn-sm pull-right">Add Group</button><div class="clearfix"></div>'
            panelInfo += accordionTable;
            panelInfo += '</div></div>';
            panelInfo += '</div>';


            $('#_periodGradeAccordion').append(panelInfo);
        });

        let firtPeriodGradePanelId = $('#_periodGradeAccordion .panel .panel-collapse').first().attr('id');
        loadGroupGrades(firtPeriodGradePanelId);

        // after load the html control, bind on shown event to accordion items
        $('.panel').on('shown.bs.collapse', function (e) {
            let periodGradeId = e.currentTarget.id.replace('panelInfo_', '');
            //console.log(periodGradeId);
            loadGroupGrades(periodGradeId);
            //alert('Event fired on #' + e.currentTarget.id);
        })
    }

    var loadPeriodGrade = function () {
        let periodId = $('#hvPeriodId').val();

        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PeriodGrade/GetAllByPeriod',
            data: {
                periodId: periodId
            },
            success: function (response) {
                //console.log(response.Data);
                if (response.Data.length > 0) {
                    createAccordion(response);
                } else {
                    alert('data not found');  
                }
            }
        });
    }

    this.onShowAccordion = function (panel) {

    }

    this.loadGroupGrades = function (periodGradeId) {
        //alert('load');
        $('#_groupTable_' + periodGradeId +'> tbody').empty();
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Grade/GetGroups',
            data:
                {
                    periodGradeId: periodGradeId == '' ? 0 : periodGradeId
                },
            success: function (response) {
                //console.log(response.Data);
                $.each(response.Data, function (key, cell) {
                    $('#_groupTable_' +periodGradeId + '> tbody').append($('<tr></tr>')
                        .append($('<td></td>').text(cell.GroupNumber))
                        .append($('<td></td>').text(cell.GroupDescription))
                        .append($('<td></td>').text(cell.LeaderFullName))
                        .append($('<td></td>').text(cell.StudentCount)))                        
                });
            }
        });
    }

    this.showGradesByPeriod = function () {
        var barData = {
            labels: ['Italy', 'UK', 'USA', 'Germany', 'France', 'Japan'],
            datasets: [
                {
                    label: '2010 customers #',
                    fillColor: '#382765',
                    data: [2500, 1902, 1041, 610, 1245, 952]
                },
                {
                    label: '2014 customers #',
                    fillColor: '#7BC225',
                    data: [3104, 1689, 1318, 589, 1199, 1436]
                }
            ]
        };

        var ctx = document.getElementById("clients").getContext("2d");

        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: barData
        });

        //var context = document.getElementById('clients').getContext('2d');
        //var clientsChart = new Chart(context).Bar(barData);
    }

    init();

    
}())