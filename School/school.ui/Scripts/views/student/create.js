(function () {
    var init = function () {
        //alert('init');
        //$('#Grade').live('change', function () {
        //    alert('change');
        //    let id = $(this).val();
        //    alert(id);
        //});


        
    }

    this.showStudentCreateModal = function () {
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Student/ShowStudentCreate',
            success: function (response) {
                $('#newStudentHtml').html(response.Html);
                $('#new-student').modal('show');                
            }
        });
    }

    //this.gradeOnChange = function (value) {
    //    alert(value);        
    //}

    this.loadGroup = function (periodGradeId) {        
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Grade/GetGroups',
            data:
                {
                    periodGradeId: periodGradeId
                },
            success: function (response) {
                $('#GradeGroups').empty();
                $('#GradeGroups').append($("<option></option>")
                                .attr("value", 0)
                                .text('Please select the Group'));
                $('#GradeGroups').prop('disabled', false);
                //$('#GradeGroups').prop('disabled', false);

               
                if (response.Data.lenght > 0) {
                    $.each(response.Data, function (key, row) {
                        let groupDesc = row.GroupDescription;
                        let periodGradeGroupId = row.PeriodGradeGroupId;

                        $('#GradeGroups')
                         .append($("<option></option>")
                                    .attr("value", periodGradeGroupId)
                                    .text(groupDesc));
                    });
                }
                else {
                    $('#GradeGroups').prop('disabled', 'disabled');
                }
               
               
            }
        });
    }

    init();

   
}())