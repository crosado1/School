$(function () {
    var init = function () {
        loadTable();
    }

    var loadTable = function () {
        $('#_historyTransaction > tbody').empty();
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/PayTransaction/GetAllByStudent',
            data: {
                studentId: 7
            },
            success: function (response) {
                if (response.Data.length > 0) {
                    $.each(response.Data, function (key, cell) {
                        $('#_historyTransaction > tbody').append($('<tr></tr>')
                            .append($('<td></td>').text(cell.PeriodYear))
                            .append($('<td></td>').text(cell.TransactionTypeDescription))
                            .append($('<td></td>').text(cell.StudentPayTransactionDescription))
                            .append($('<td></td>').text(getMoneyFormat(cell.PayConfiguration)))
                            .append($('<td></td>').text(getMoneyFormat(cell.TotalAmount)))
                            .append($('<td></td>').text(getMoneyFormat(cell.Restante))))
                    });
                } else {
                    $('#_historyTransaction > tbody').append($('<tr></tr>')
                        .append($('<td></td>')
                        .attr('colspan', '6')
                        .text('No available records.')));
                }
            }
        });
    }

    var getMoneyFormat = function (value) {
        return '$' + value.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    }

    init();

    $('#history-scroll').slimScroll({ height: '200px' });
}());