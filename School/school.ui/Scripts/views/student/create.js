(function () {

    // Global Variables
    var transactionTypeArray = {};

    /* Private methods */
    var init = function () {
    }

    var setStudentMode = function (studentId) {
        if (studentId > 0) {
            $('#form-demographic .form-control').attr('disabled', true);           
        }

        $('#hvStudentId').val(studentId);
           
    }

    var initGradeOptions = function () {
        $('#GradeGroups').prop('disabled', 'disabled');
        $('#Grade').prop('disabled', 'disabled');
    }

    var onShowModal = function(response)
    {
        $('#newStudentHtml').html(response.Html);
        $('#new-student').modal('show');
        initDemographicValidation();
        initGradeValidation();
        initGradeOptions();
    }

    var onSuccess = function (response) {
        let classToApply = 'alert-success';
        if (response.Status == 'OK')
            classToApply = 'alert-success';
        else
            classToApply = 'alert-danger';

        $('#dvResult').addClass(classToApply);

        $('#new-student').modal('hide');
        $('#dvResult').html(response.Message);
        $('#dvResult').show();

        // load Student List
        if (response.StudentId != 0)
            setStudent(response.StudentId);
       // loadStudent();
    }

    /************************************************/

    /* Global methods */
    this.showStudentCreateModal = function (button) {
        let buttonObj = $(button);
        let id = buttonObj.data('id'); 

        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Student/ShowStudentCreate',
            data:
            {
               studentId:id
            },
            success: function (response) {               
                onShowModal(response);
                setStudentMode(id);
            }
        });
    }
    
    this.loadGroup = function (periodGradeId) {
        
       

        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Grade/GetGroups',
            data:
                {
                    periodGradeId: periodGradeId == '' ? 0 : periodGradeId
                },
            success: function (response) {
                $('#GradeGroups').empty();
                $('#GradeGroups').append($("<option></option>")
                                .attr("value", 0)
                                .text('Please select the Group'));
                
                if (!$.isEmptyObject(response.Data))
                    $('#GradeGroups').prop('disabled', false);

                $.each(response.Data, function (key, row) {                    
                    let groupDesc = row.GroupNumber;
                        let periodGradeGroupId = row.PeriodGradeGroupId;

                        $('#GradeGroups')
                         .append($("<option></option>")
                                    .attr("value", periodGradeGroupId)
                                    .text(groupDesc));
                    });
            }
        });
    }

    this.loadGrade = function (periodId) {      

        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PeriodGrade/GetAllByPeriod',
            data:
                {
                    periodId: periodId == '' ? 0 : periodId
                },
            success: function (response) {
                $('#Grade').empty();
                $('#Grade').append($("<option></option>")
                                .attr("value", 0)
                                .text('Please select the Group'));

                if (!$.isEmptyObject(response.Data))
                    $('#Grade').prop('disabled', false);

                $.each(response.Data, function (key, row) {
                    console.log(row);
                    let gradeDesc = row.GradeModel.GradeDescription;
                    let periodGradeId = row.PeriodGradeId;

                    $('#Grade')
                     .append($("<option></option>")
                                .attr("value", periodGradeId)
                                .text(gradeDesc));
                });
            }
        });
    }

    this.saveStudent = function () {
        // Demographic
        let firstName = $("#FirstName").val();
        let middleName = $("#MiddleName").val();
        let lastName = $("#LastName").val();
        let gender = $("#Gender").val();
        let address1 = $("#Address1").val();
        let address2 = $("#Address2").val();
        let cityId = 1;
        let state = $("#StateCode").val();
        let zipCode = $("#ZipCode").val();

        let studentId = $('#hvStudentId').val();
        

        //Group Info
        let periodGroupId = $("#GradeGroups").val();

                      
        if (validateForms()) {
            $.ajax({
                dataType: 'json',
                type: 'POST',
                url: '/Student/Save',
                data: {
                    transactions: transactionTypeArray,
                    firstName: firstName,
                    middleName: middleName,
                    lastName: lastName,
                    GenderModel: {
                        GenderId: gender
                    },
                    Address1: address1,
                    Address2: address2,
                    CityModel: {
                        CityId:cityId
                    },
                    StateCode: state,
                    ZipCode: zipCode,
                    PeriodGroupId: periodGroupId,
                    StudentId:studentId
                },
                success: function (response) {
                    onSuccess(response);
                }
            });
        }
    }
    /************************************************/

    /* Validations */
    var validateForms = function () {
        let isValidDemographic = true;
        let isValidGrade = true;
        var isValidTransaction = true;
        let formDemographic = $('#form-demographic');
        let formGrade = $('#form-grade');

        isValidDemographic = formDemographic.valid();
        isValidGrade = formGrade.valid();
        isValidTransaction = validateTransactionType();

        if (isValidDemographic == false || isValidGrade == false || isValidTransaction == false)
            return false;
        else
            return true;
    }
    
    var initDemographicValidation = function () {        
        let form = $('#form-demographic');

        form.validate({
            rules: {
                FirstName: {                    
                    required: true
                },
                LastName: {
                    required: true
                },
                Gender: {                   
                    required: true
                },
                Address1: {
                    required: true
                },
                StateCode: {
                    required: true
                },
                ZipCode: {
                    required: true
                },
                City: {required:true}
            },
            messages: {
                FirstName: {
                    required: "Enter the First Name"
                },
                LastName: {
                    required: "Enter the Last Name"
                },
                Gender: {
                    required: "Select the Gender"
                },
                Address1: {
                    required: "Enter the Address 1"
                },
                StateCode: {
                    required: "Enter the State"
                },
                ZipCode: {
                    required: "Enter the Zip Code"
                },
                City:{required:"Select the City"}
            },
            highlight: function (element) {
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error');
            },
            errorElement: 'span',
            errorClass: 'help-block',
            errorPlacement: function (error, element) {
                if (element.parent('.input-group').length) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });
    }

    var initGradeValidation = function () {
        let form = $('#form-grade');

        form.validate({
            rules: {                
                GradeGroups: {
                    required: true
                }
            },
            messages: {
                GradeGroups: {
                    required: "Select the Group"
                }
            },
            highlight: function (element) {
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error');
            },
            errorElement: 'span',
            errorClass: 'help-block',
            errorPlacement: function (error, element) {
                if (element.parent('.input-group').length) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });
    }

    var validateTransactionType = function () {
        var isValid = true;
        //let table = $('#_transactionType');
        $('#_transactionType').find('input[type="checkbox"]:checked').each(function () {
            let searchValue = $(this).data('search');
            let txtEvaluate = $('#txt_' + searchValue);

            transactionTypeArray[searchValue] = txtEvaluate.val();

            if (txtEvaluate.val() == '') {
                txtEvaluate.addClass('error');
                isValid = false;
            }
            else {
                txtEvaluate.removeClass('error');
            }
        });
        return isValid;
    }
    /************************************************/

    init();   
}())