<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Charts.aspx.cs" Inherits="GarbageMaster.Pages.Charts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
    <script>
        $(document).ready(function () {
            $.ajax({
                type: "GET",
                url: "/Main/getwastedetails",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    var chartData = {
                        labels: [],
                        datasets: [{
                            label: 'Average Waste',
                            backgroundColor: [],
                            borderColor: "#04736a",
                            borderWidth: 1,
                            data: []
                        }]
                    };

                    for (var i = 0; i < data.length; i++) {
                        chartData.labels.push("Ward " + data[i].Ward_No);
                        chartData.datasets[0].data.push(data[i].Waste);
                        if (data[i].Waste < 8) {
                            chartData.datasets[0].backgroundColor.push("rgba(75,192,192,0.5)"); // Green
                        } else if (data[i].Waste >= 8 && data[i].Waste <= 16) {
                            chartData.datasets[0].backgroundColor.push("rgba(255,206,86,0.5)"); // Yellow
                        } else {
                            chartData.datasets[0].backgroundColor.push("rgba(255,99,132,0.5)"); // Red
                        }
                    }
                    var ctx = document.getElementById("barChart").getContext("2d");
                    var barChart = new Chart(ctx, {
                        type: 'bar',
                        data: chartData,
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            },
                            legend: {
                                display: false
                            },
                            onClick: (event, elements, chart) => {
                                if (elements[0]) {
                                    const i = elements[0]._index;
                                    window.location = "ZWard" + (i + 1) + ".aspx"
                                }
                            }
                        }
                        
                    });
                    var ctx2 = document.getElementById("lineChart").getContext("2d");
                    var lineChart = new Chart(ctx2, {
                        type: 'line',
                        data: chartData,
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            },
                            legend: {
                                display: false
                            },
                            onClick: (event, elements, chart) => {
                                if (elements[0]) {
                                    const i = elements[0]._index;
                                    window.location="ZWard"+(i+1)+".aspx"
                                }
                            }
                        }
                    });
                    var ctx3 = document.getElementById("pieChart").getContext("2d");
                    var pieChart = new Chart(ctx3, {
                        type: 'pie',
                        data: chartData,
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: false
                                    }
                                }]
                            },
                            legend: {
                                display: false
                            },
                            onClick: (event, elements, chart) => {
                                if (elements[0]) {
                                    const i = elements[0]._index;
                                    window.location = "ZWard" + (i + 1) + ".aspx"
                                }
                            }
                        }
                    });
                    var ctx4 = document.getElementById("doughnutChart").getContext("2d");
                    var doughnutChart = new Chart(ctx4, {
                        type: 'doughnut',
                        data: chartData,
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            },
                            legend: {
                                display: false
                            },
                            onClick: (event, elements, chart) => {
                                if (elements[0]) {
                                    const i = elements[0]._index;
                                    window.location = "ZWard" + (i + 1) + ".aspx"
                                }
                            }
                        }
                    });
                },
                error: function (req, status, error) {
                    console.log(status);
                    console.log(req);
                    console.log(error);
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="midde_cont">
        <div class="container-fluid">
            <div class="row column_title">
            <div class="col-md-12">
                <div class="page_title">
                    <h2>Charts</h2>
                </div>
            </div>
            </div>
            <div class="row column1">
            <div class="col-md-6">
                <div class="full counter_section margin_bottom_30">
                           <canvas id="barChart"></canvas>   
                </div>
            </div>
            <div class="col-md-6">
                <div class="full counter_section margin_bottom_30">
                              <canvas id="lineChart"></canvas>
                </div>
            </div>
            <div class="col-md-6">
                <div class="full counter_section margin_bottom_30">
                              <canvas id="pieChart"></canvas>
                </div>
            </div>
            <div class="col-md-6">
                <div class="full counter_section margin_bottom_30">
                              <canvas id="doughnutChart"></canvas>
                </div>
            </div>
            </div>
        </div>
    </div>
</asp:Content>
