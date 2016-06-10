(function () {
    var init = function () {       
        loadTable();
    }

    var loadTable = function () {

        // Clean Table
        $('#tblPeriod > tbody').empty();
        
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: 'Period/GetAll',
            //data: {
            //    MemberNumber: $('#member-number').val(),
            //    Period: $('#Period').val(),
            //    PatientInfoId: 0,
            //    ChraType: 'PCP'
            //},
            success: function (response) {               
                if (response.Data.length > 0) {
                    
                    $.each(response.Data, function (key, cell) {
                        $('#tblPeriod > tbody').append($('<tr></tr>')
                            .append($('<td></td>').text(cell.YearDescription))
                            .append($('<td></td>').html(getActivePeriod(cell.Active)))
                            .append($('<td></td>').append($('<button>', {
                                text: 'Details',
                                onclick: 'viewDetail(this)',
                                'class': 'btn btn-sm btn-success'//,
                                //'data-date': appointmentDate,
                                //'data-comment': cell.Comment,
                                //'data-answered': cell.WhoAnswer,
                                //'data-action': cell.CallActionTypeResponseModel.CallActionTypeModel.CallActionTypeDesc,
                                //'data-response': cell.CallActionTypeResponseModel.ResponseTypeModel.ResponseTypeDesc
                            }).prop('outerHTML'))));
                    });

                } else {
                    $('#tblPeriod > tbody').append($('<tr></tr>')
                        .append($('<td></td>')
                        .attr('colspan', '7')
                        .text('No available records.')));
                }
            }
        });
    }

    this.viewDetail = function (button) {
        alert('viewDetail');
    }

    var getActivePeriod = function (activeValue) {
        if (activeValue) {
            return '<div class="checkbox checkbox-info checkbox-circle"><input class="styled" id="checkbox11" type="checkbox" disabled="" checked=""><label for="checkbox11">Active</label></div>';
        }
        else {
            return '';
        }

    };

    init();
}());