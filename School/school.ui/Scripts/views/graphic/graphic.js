(function () {
    this.showGradesByPeriod = function () {
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Graphic/GetGradeByActivePeriod',
            //data: {
            //    MemberNumber: $('#member-number').val(),
            //    Period: $('#Period').val(),
            //    PatientInfoId: 0,
            //    ChraType: 'PCP'
            //},
            success: function (response) {
                var data = {
                    labels: response.labelInfo,
                    datasets: [
                        {
                            label: response.labelTitle,
                            backgroundColor: "#dd5600",
                            //borderColor: "rgba(255,99,132,1)",
                            borderWidth: 1,
                            //hoverBackgroundColor: "rgba(255,99,132,0.4)",
                            //hoverBorderColor: "rgba(255,99,132,1)",
                            data: response.dataInfo,
                        }
                    ]
                };

                var ctx = document.getElementById("canvas").getContext("2d");

                var myBarChart = new Chart(ctx, {
                    type: 'bar',
                    data: data
                });               
            }
        });
    }


    this.showStudentsByPeriod = function () {
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Graphic/GetStudentByPeriods',
            //data: {
            //    MemberNumber: $('#member-number').val(),
            //    Period: $('#Period').val(),
            //    PatientInfoId: 0,
            //    ChraType: 'PCP'
            //},
            success: function (response) {
                var data = {
                    labels: response.labelInfo,
                    datasets: [
                        {
                            label: response.labelTitle,
                            backgroundColor: "#dd5600",
                            //borderColor: "rgba(255,99,132,1)",
                            borderWidth: 1,
                            //hoverBackgroundColor: "rgba(255,99,132,0.4)",
                            //hoverBorderColor: "rgba(255,99,132,1)",
                            data: response.dataInfo,
                        }
                    ]
                };

                var ctx = document.getElementById("canvasByPeriods").getContext("2d");

                var myLineChart = new Chart(ctx, {
                    type: 'line',
                    data: data
                });
            }
        });
    }


    this.showGradesExpensesByPeriod = function () {
        $.ajax({
            dataType: 'json',
            type: 'POST',
            url: '/Graphic/GetGradeExpenseByActivePeriod',
            //data: {
            //    MemberNumber: $('#member-number').val(),
            //    Period: $('#Period').val(),
            //    PatientInfoId: 0,
            //    ChraType: 'PCP'
            //},
            success: function (response) {
                var data = {
                    labels: response.labelInfo,
                    datasets: [
                        {
                            label: response.labelTitle,
                            backgroundColor: "#dd5600",
                            //borderColor: "rgba(255,99,132,1)",
                            borderWidth: 1,
                            //hoverBackgroundColor: "rgba(255,99,132,0.4)",
                            //hoverBorderColor: "rgba(255,99,132,1)",
                            data: response.dataInfo,
                        }
                    ]
                };

                var ctx = document.getElementById("canvasExpenseByPeriods").getContext("2d");

                var myBarChart = new Chart(ctx, {
                    type: 'bar',
                    data: data
                });
            }
        });
    }

}());