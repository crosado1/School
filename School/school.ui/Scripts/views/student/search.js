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
                    'url': 'Student/GetAll',
                    'data': {
                        'PeriodId': $('#search_periodId').val(),
                        'GradeId': $('#search_gradeId').val(),
                        'StudentCode': $('#search_studentCode').val(),
                        'FirstName': $('#search_firstName').val(),
                        'LastName': $('#search_lastName').val(),
                        'GenderId': $('#search_genderId').val(),
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
                { 'data': 'PeriodGradeGroupModel.PeriodGradeModel.PeriodModel.YearDescription', 'bSortable': false },
                {
                    'data': 'StudentFullName',
                    'bSortable': false,
                    'mRender': function (data, type, row) {                       
                        return row.StudentModel.FirstName + ' ' + row.StudentModel.MiddleName + ' ' + row.StudentModel.LastName;
                    }
                },
                { 'data': 'StudentModel.StudentCode', 'bSortable': false },
                { 'data': 'PeriodGradeGroupModel.PeriodGradeModel.GradeModel.GradeDescription', 'bSortable': false },
                { 'data': 'PeriodGradeGroupModel.GroupDescription', 'bSortable': false },
                { 'data': 'StudentModel.GenderModel.GenderDescription', 'bSortable': false },                
                {
                    'data': '',
                    'bSortable': false,
                    'mRender': function (data, type, row) {
                        return getActions(row);
                        //return $('<a>', {
                        //    text: 'Pay',
                        //    onclick: 'viewPaymentInfo(this)',
                        //    href: '#',
                        //    'data-toggle': 'modal',
                        //    'class': 'btn btn-success btn-sm',
                        //    'data-target': '#pay-student',
                        //    'data-id': row.PeriodGradeStudentId
                        //}).prop('outerHTML');
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
        let activePeriod = row.PeriodGradeGroupModel.PeriodGradeModel.PeriodModel.Active;
        let isReadyToNextYear = row.StudentModel.IsReadyToNextYear;

        console.log(isReadyToNextYear);
        
        let payButton = '';
        
        if (activePeriod) {
            payButton = $('<a>', {
                text: 'Pay',
                onclick: 'showPaymentModal(this)',
                href: '#',
                'class': 'btn btn-success btn-sm',
                'data-id': row.PeriodGradeStudentId
            }).prop('outerHTML');
        }
        else {
            payButton = $('<a>', {
                text: 'Pay',                
                href: '#',
                disabled: true,                
                'class': 'btn btn-success btn-sm',                
                'data-id': row.PeriodGradeStudentId
            }).prop('outerHTML');
        }

        let profileButton = $('<button>', {
            text: 'Profile',
            onclick: 'showStudentProfileModal(this)',
            //href: '#',
            //'data-toggle': 'modal',
            'class': 'btn btn-info btn-sm',
            //'data-target': '#profile-student',
            'data-id': row.StudentModel.StudentId
        }).prop('outerHTML');

        let readyToNextYearButton = '';

        readyToNextYearButton = $('<button>', {
            text: 'Enrollment',
            //onclick: 'showStudentProfileModal(this)',
            //href: '#',
            //'data-toggle': 'modal',
            'class': 'btn btn-warning btn-sm',
            //'data-target': '#profile-student',
            'data-id': row.StudentModel.StudentId
        }).prop('outerHTML');


        
        return payButton + ' ' + profileButton + ' ' + readyToNextYearButton;
    }

    var loadSearchStudentModal = function () {
        $.ajax({
            'dataType': 'json',
            'type': 'POST',
            'url': 'Student/ShowSearch',
            'success': function (json) {
                $("#searchHtml").html(json.Html);
                initSearchModalAfterLoad();
            }
        });
    }

    $('#search-student').on('show.bs.modal', function () {
        loadSearchStudentModal();       
    });

    var initSearchModalAfterLoad = function () {
        $('#btnSearch').on('click', setSearchParameters);
    }

    var setSearchParameters = function () {
        $('#search_periodId').val($('#Period').val());
        $('#search_gradeId').val($('#Grade').val());
        $('#search_studentCode').val($('#txtStudentCode').val());
        $('#search_firstName').val($('#txtFirstName').val());
        $('#search_lastName').val($('#txtLastName').val());
        $('#search_genderId').val($('#Gender').val());

        $('#dvResult').hide();
        loadStudent();
    }

    this.getStudentById = function (studentId) {
         $.ajax({
                dataType: 'json',
                type: 'POST',
                url: '/Student/GetStudentById',
                data: {
                    studentId: studentId
                },
                success: function (response) {
                    
                }
            });
        }
       

    init();
    
}());