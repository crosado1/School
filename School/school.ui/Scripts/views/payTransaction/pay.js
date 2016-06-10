(function () {

    var init = function () {
        
    }

    this.showPaymentModal = function(button)
    {
        var button = $(button);
        let searchId = button.data('id');
        // Set hidden value
        $('#pay_periodGradeStudentId').val(searchId);

        $('#pay-student').modal('show');
        viewPaymentInfo(searchId);
        viewPaymentHistory(searchId);
    }

    this.viewPaymentInfo = function (searchId) {
       
        //var button = $(button);
        //let searchId = button.data('id');

        $('#_availableTransaction > tbody').empty();
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PayTransaction/GetAvailablePay',
            data: {
                periodGradeStudentId: searchId
            },
            success: function (response) {
                if (response.Data.length > 0) {
                    $.each(response.Data, function (key, cell) {                        
                        $('#_availableTransaction > tbody').append($('<tr></tr>')
                            .append($('<td></td>').text(cell.StudentPayTransactionModel.StudentPayTransactionDescription))
                            .append($('<td></td>').text(getMoneyFormat(cell.StudentPayTransactionModel.StudentPayConfigurationModel.PayConfiguration)))
                            .append($('<td></td>').text(getMoneyFormat(cell.PayAmount)))
                            .append($('<td></td>').text(getMoneyFormat(cell.Remaining)))
                            .append($('<input/>',{type:'text',
                                id: 'txtPayAmount_' + cell.StudentPayTransactionModel.StudentPayTransactionId,
                                value: cell.Remaining,
                                    'class': 'col-xs-2 form-control'
                                }))
                            .append($('<td></td>').append($('<button>', {
                                text: 'Submit Pay',
                                onclick: 'submitPay(this)',
                                'class': 'btn btn-sm btn-success',
                                'data-id': cell.StudentPayTransactionModel.StudentPayTransactionId,
                                'data-balance': cell.Remaining,
                                'data-periodGradeStudentId': cell.StudentPayTransactionModel.StudentPayConfigurationModel.PeriodGradeStudentModel.PeriodGradeStudentId
                            }).prop('outerHTML'))));
                    });
                } else {
                    $('#_availableTransaction > tbody').append($('<tr></tr>')
                        .append($('<td></td>')
                        .attr('colspan', '7')
                        .text('No available records.')));
                }
            }
        });

        $('#pay-student').modal('show');
    }

    this.viewPaymentHistory = function (searchId) {
        $('#_historyTransaction > tbody').empty();
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PayTransaction/GetPayHistory',
            data: {
                periodGradeStudentId: searchId
            },
            success: function (response) {
                if (response.Data.length > 0) {
                    $.each(response.Data, function (key, cell) {
                        $('#_historyTransaction > tbody').append($('<tr></tr>')
                            .append($('<td></td>').text(cell.StudentPayTransactionModel.StudentPayTransactionDescription))                            
                            .append($('<td></td>').text(getMoneyFormat(cell.PayAmount)))
                            .append($('<td></td>').text(getDateFormat(cell.PayDate).partialDate)));
                    });
                } else {
                    $('#_historyTransaction > tbody').append($('<tr></tr>')
                        .append($('<td></td>')
                        .attr('colspan', '3')
                        .text('No available records.')));
                }
            }
        });
    }

    var getMoneyFormat = function (value) {
        return '$' + value.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    }

    var getDateFormat = function (JsonDate) {
        var dateString = JsonDate.substr(6);
        var currentTime = new Date(parseInt(dateString));

        return {
            fullDate: dateFormat(currentTime, 'mm/dd/yyyy h:MM:ss TT'),
            partialDate: dateFormat(currentTime, 'mm/dd/yyyy')
        };

    };

    this.submitPay = function (button) {
        var button = $(button);
        let id = button.data('id');
        let balance = button.data('balance');
        let payAmount = $('#txtPayAmount_' + id);
        let periodGradeStudentId = $('#pay_periodGradeStudentId').val();
      
        button.attr('disabled', true);

        let isValid = validateSubmitPay(id, balance);

        if (isValid) {
            $.ajax({
                dataType: 'json',
                type: 'POST',
                url: '/PayTransaction/SubmitPayment',
                data: {
                    paymentAmount: payAmount.val(),
                    studentPayTransactionId: id,
                    balance: balance
                },
                success: function (response) {
                    button.attr('disabled', false);
                    viewPaymentInfo(periodGradeStudentId);
                    viewPaymentHistory(periodGradeStudentId);
                }
            });
        }
        else
            button.attr('disabled', false);
    }

    var validateSubmitPay = function (id,balance) {
        let valBalance = $('#txtPayAmount_' + id);

        if (valBalance.val() == '' || valBalance.val() > balance) {
            valBalance.addClass('has-error');
            return false;
        }
        else {
            valBalance.removeClass('has-error');
            return true;
        }
            
    }

    init();

    $('#history-scroll').slimScroll({ height: '200px' });
    $('#availables-scroll').slimScroll({ height: '100px' });
}());