(function () {
    var init = function () {       
        loadTable();
    }

    this.loadTable = function () {

        // Clean Table
        $('#tblPeriod > tbody').empty();
        
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: rootDir + 'Period/GetAll',
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
                            .append($('<td></td>').html(cell.PeriodStatusTypeModel.PeriodStatusTypeDesc))
                            .append($('<td></td>').html(setPeriodActions(cell))));
                            //.append($('<td></td>').append($('<button>', {
                            //    text: 'Details',
                            //    onclick: 'viewDetail(this)',
                            //    'class': 'btn btn-sm btn-success'
                            //}).prop('outerHTML'))));
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

    this.setPeriodActions = function (row) {        
        let periodStatusTypeId = row.PeriodStatusTypeModel.PeriodStatusTypeId;
        let gradeButton = '';

        switch (periodStatusTypeId) {
            case 1:
            case 2:
            case 3:
                gradeButton = $('<a>', {
                    text: 'Grades',
                    onclick: 'goToGradePage(this)',
                    href: '#',
                    'class': 'btn btn-success btn-sm',
                    'data-id': row.PeriodId
                }).prop('outerHTML');
                break;

        }

        //if (activePeriod) {
        //    payButton = $('<a>', {
        //        text: 'Pay',
        //        onclick: 'showPaymentModal(this)',
        //        href: '#',
        //        'class': 'btn btn-success btn-sm',
        //        'data-id': row.PeriodGradeStudentId
        //    }).prop('outerHTML');
        //}
        //else {
        //    payButton = $('<a>', {
        //        text: 'Pay',
        //        href: '#',
        //        disabled: true,
        //        'class': 'btn btn-success btn-sm',
        //        'data-id': row.PeriodGradeStudentId
        //    }).prop('outerHTML');
        //}

        //let profileButton = $('<button>', {
        //    text: 'Profile',
        //    onclick: 'showStudentProfileModal(this)',            
        //    'class': 'btn btn-info btn-sm',            
        //    'data-id': row.StudentModel.StudentId
        //}).prop('outerHTML');

        return gradeButton;
    }

    this.goToGradePage = function (button) {        
        let periodId = $(button).data('id');
        window.location.href = rootDir + 'PeriodGrade/?periodId=' + periodId
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