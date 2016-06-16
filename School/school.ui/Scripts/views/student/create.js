(function () {

    // Global Variables
    var transactionTypeArray = {};

    /* Private methods */
    var init = function () {
    }

    var onShowModal = function(response)
    {
        $('#newStudentHtml').html(response.Html);
        $('#new-student').modal('show');
        initDemographicValidation();
        initGradeValidation();
    }

    /************************************************/

    /* Global methods */
    this.showStudentCreateModal = function () {
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Student/ShowStudentCreate',
            success: function (response) {               
                onShowModal(response);
            }
        });
    }
    
    this.loadGroup = function (periodGradeId) {
        
        $('#GradeGroups').prop('disabled', 'disabled');

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
                        let groupDesc = row.GroupDescription;
                        let periodGradeGroupId = row.PeriodGradeGroupId;

                        $('#GradeGroups')
                         .append($("<option></option>")
                                    .attr("value", periodGradeGroupId)
                                    .text(groupDesc));
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
                    PeriodGroupId: periodGroupId
                },
                success: function (response) {
                    alert('ok');
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
                }
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