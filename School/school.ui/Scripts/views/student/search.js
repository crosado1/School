(function () {

    this.loadStudent = function () {
        $('#studentList').dataTable().fnDestroy();

        $('#studentList').DataTable({
            'bProcessing': true,
            'bServerSide': true,
            'pageLength': 10,
            'bFilter': false,
            'bSortable': false,
            'scrollX': false,
            'sPaginationType': 'full_numbers',
            'fnServerData': function (sSource, aoData, fnCallback) {

                var pageInfo = $(this).DataTable().page.info();

                $.ajax({
                    'dataType': 'json',
                    'type': 'POST',
                    'url': rootDir + 'Student/GetAll',
                    'data': {
                        //'PeriodId': $('#search_periodId').val(),
                        //'GradeId': $('#search_gradeId').val(),
                        'StudentCode': $('#search_studentCode').val(),
                        'FirstName': $('#search_firstName').val(),
                        'LastName': $('#search_lastName').val(),
                        'GenderId': $('#search_genderId').val(),
                        'CityId': $('#search_cityId').val(),
                        'PageSize': pageInfo.end,
                        'SortColumn': 'FirstName',
                        'PageIndex': (pageInfo.start) + 1
                    },
                    'success': function (json) {
                        if (json.status = 'OK')
                        {
                            $('#search-student').modal('hide');
                            $('.modal-backdrop').hide();
                            fnCallback(json);
                        }
                            
                        else
                            alert(json.message);
                    }
                });
            },
            'drawCallback': function( settings ) {
                $("#usersTable").wrap( "<div class='table-responsive'></div>" );
            },
            'columns': [
                //{ 'data': 'PeriodGradeGroupModel.PeriodGradeModel.PeriodModel.YearDescription', 'bSortable': false },
                {
                    'data': 'StudentFullName',
                    'bSortable': false,
                    'mRender': function (data, type, row) {                       
                        return row.FirstName + ' ' + row.MiddleName + ' ' + row.LastName;
                    }
                },
                { 'data': 'StudentCode', 'bSortable': false },
                { 'data': 'CityModel.CityDescription', 'bSortable': false },
                //{ 'data': 'PeriodGradeGroupModel.PeriodGradeModel.GradeModel.GradeDescription', 'bSortable': false },
                //{ 'data': 'PeriodGradeGroupModel.GroupDescription', 'bSortable': false },
                { 'data': 'GenderModel.GenderDescription', 'bSortable': false },                
                {
                    'data': '',
                    'bSortable': false,
                    'mRender': function (data, type, row) {
                        return getActions(row);
                    }
                }
            ]
        });
    };

    this.setStudent = function (studentId) {
        $('#search_studentCode').val(studentId);
        loadStudent();
    }

    var init = function()
    {
        loadStudent();       
    }

    this.getActions = function (row) {
        //let activePeriod = row.PeriodGradeGroupModel.PeriodGradeModel.PeriodModel.Active;
        //let isReadyToNextYear = row.StudentModel.IsReadyToNextYear;

        //console.log(isReadyToNextYear);
        
        //let payButton = '';
        
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

        let profileButton = $('<button>', {
            text: 'Profile',
            onclick: 'showStudentProfileModal(this)',
            //href: '#',
            //'data-toggle': 'modal',
            'class': 'btn btn-primary btn-sm btn-custom-grid',
            //'data-target': '#profile-student',
            'data-id': row.StudentId
        }).prop('outerHTML');

        
        let readyToNextYearButton = '';

        //if (isTrue(isReadyToNextYear)) {
            readyToNextYearButton = $('<button>', {
                text: 'Enroll',
                onclick: 'showStudentCreateModal(this)',
                //href: '#',
                //'data-toggle': 'modal',
                'class': 'btn btn-default btn-sm btn-custom-grid',
                //'data-target': '#profile-student',
                'data-id': 1
            }).prop('outerHTML');
        //}
       


        
            return profileButton + ' ' + readyToNextYearButton;

        //return '';
    }

    function isTrue(value) {
        if (typeof (value) == 'string') {
            value = value.toLowerCase();
        }
        switch (value) {
            case true:
            case "true":
            case 1:
            case "1":
            case "on":
            case "yes":
                return true;
            default:
                return false;
        }
    }

    this.showSearch = function () {
        $('#search-student').modal('show');
    }
    var loadSearchStudentModal = function () {
        $.ajax({
            'dataType': 'json',
            'type': 'POST',
            'url': rootDir + 'Student/ShowSearch',
            'success': function (json) {
                $("#searchHtml").html(json.Html);
                initSearchModalAfterLoad();
            }
        });
    }

    $('#search-student').on('shown.bs.modal', function () {
        loadSearchStudentModal();       
    });

    var initSearchModalAfterLoad = function () {
        $('#btnSearch').on('click', setSearchParameters);
    }

    var setSearchParameters = function () {
        //$('#search_periodId').val($('#Period').val());
        //$('#search_gradeId').val($('#Grade').val());
        $('#search_studentCode').val($('#txtStudentCode').val());
        $('#search_firstName').val($('#txtFirstName').val());
        $('#search_lastName').val($('#txtLastName').val());
        $('#search_genderId').val($('#Gender').val());
        $('#search_cityId').val($('#City').val());
        $('#dvResult').hide();
        loadStudent();
    }

    this.getStudentById = function (studentId) {
         $.ajax({
                dataType: 'json',
                type: 'POST',
                url: rootDir + 'Student/GetStudentById',
                data: {
                    studentId: studentId
                },
                success: function (response) {
                    
                }
            });
        }
       

    init();
    
}());