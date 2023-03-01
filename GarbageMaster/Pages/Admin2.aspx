<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin2.aspx.cs" Inherits="GarbageMaster.Pages.Admin2" %>
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
                    var ctx = document.getElementById("myChart").getContext("2d");
                    var myChart = new Chart(ctx, {
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
                            plugins: {
                                legend: {
                                    display: false,
                                    labels: {
                                        color: 'rgb(255, 99, 132)'
                                    }
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
                              <h2>Dashboard</h2>
                           </div>
                        </div>
                     </div>
                     <div class="row column1">
                        <div class="col-md-6 col-lg-3">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-user yellow_color"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                     <div class="makeitcenter">
                                    <asp:Label ID="lblUsers" class="total_no" runat="server" Text="0"></asp:Label>
                                     </div>
                                    <p class="head_couter">Users</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div class="makeitcenter"> 
                                     <img width="50" height="50" src="../wwwroot/images/icons8-spinach-96.png" />
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                     <div class="makeitcenter">
                                    <asp:Label ID="lblGreen" class="total_no" runat="server" Text="0"></asp:Label>
                                     </div>
                                    <p class="head_couter">Greens</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div class="makeitcenter"> 
                                     <img width="50" height="50" src="../wwwroot/images/icons8-autumn-96.png" />
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <div class="makeitcenter">
                                    <asp:Label ID="lblYellow" class="total_no" runat="server" Text="0"></asp:Label>
                                     </div>
                                    <p class="head_couter">Yellows</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                           <div class="full counter_section margin_bottom_30">
                              <div class="couter_icon">
                                 <div class="makeitcenter"> 
                                     <img width="50" height="50" src="../wwwroot/images/icons8-money-bag-franc-96.png" />
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <div class="makeitcenter">
                                    <asp:Label ID="lblRed" class="total_no" runat="server" Text="0"></asp:Label>
                                     </div>
                                    <p class="head_couter">Reds</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                      <canvas id="myChart"></canvas>
                     
                  </div>
               </div>
    
</asp:Content>

