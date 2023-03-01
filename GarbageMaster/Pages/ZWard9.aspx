﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ZWard9.aspx.cs" Inherits="GarbageMaster.Pages.ZWard9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../wwwroot/css/CDNS/leaflet.css" />
    <script src="../wwwroot/js/CDNs/leaflet.js"></script>
    <link href="../wwwroot/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/GeoJsonByWards/ward9.js"></script>
    <script src="../wwwroot/js/jquery-3.6.3.js"></script>
    <link href="../wwwroot/css/CDNS/semantic.min.css" rel="stylesheet" />
    <link href="../wwwroot/css/CDNS/dataTables.semanticui.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/CDNs/jquery.dataTables.min.js"></script>
    <script src="../wwwroot/js/CDNs/dataTables.semanticui.min.js"></script>
    <script src="../wwwroot/js/CDNs/semantic.min.js"></script>
    <link href="../wwwroot/css/maps.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead").append($(this).find("tr:first"))).DataTable()({
                columnDefs: [
                    { width: 300, targets: 0 }
                ],
                fixedColumns: false
            });
        });
    </script>
    <style>
        .mytruck2{
            color:black;
            border:1px solid;
            border-radius:1px;
            background-color:#04736a;
            color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center myfontstyle2 mt-4">
        <span>Map Representation of Garbage Data</span>
    </div>
    <div class="d-flex justify-content-center">
        <asp:Label ID="lblAverage" runat="server" Text="Ward 9"></asp:Label>
    </div>
    <div class="d-flex justify-content-center mt-4 mb-5">
    <div id="tablethis" style="width:55%;">
    <asp:GridView ID="GridView1" CssClass="table ui celled striped compact" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="UsernameW" HeaderText="Username"></asp:BoundField>
            <asp:BoundField DataField="Waste_Data" HeaderText="Average Waste"></asp:BoundField>
            <asp:BoundField DataField="DateReviewed" HeaderText="Last Reviewed On"></asp:BoundField>
        </Columns>
    </asp:GridView>
        <div class="text-align-end">
            <asp:LinkButton CssClass="mytruck2 p-2" ID="sendtruck" runat="server" Text="Send Truck" OnClick="TruckSent"></asp:LinkButton>
            <asp:LinkButton CssClass="mytruck2 p-2" style="background-color:#ff5a5a" ID="checkout" runat="server" Text="Checkout" OnClick="Checkedout"></asp:LinkButton>
        </div>
    </div>
        </div>
    <div class="d-flex justify-content-center mb-5">
    <div id = "map" style = "width:900px; height:580px;"></div>
    </div>
    <asp:Label ID="Label9" runat="server" Text=""></asp:Label>

    <script>
        var ward9 = parseInt(document.getElementById("ContentPlaceHolder1_Label9").innerHTML);
        document.getElementById("ContentPlaceHolder1_Label9").style.display = "none";

        var map = L.map('map').setView([27.693, 85.35], 14);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            minZoom: 14,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
        function getColor(d) {
            return d < 9 ? '#10974c' :
                d < 17 ? '#dab600' :
                    d > 18 ? '#e53935' :
                        d > 100 ? '#e53935' :
                            '#e53935';
        }
        L.geoJSON(ward9JSON, {
            onEachFeature: function (feature, layer) {
                layer.bindPopup(function (layer) {
                    if (feature.properties.name == "Ward9") {
                        return feature.properties.name + ": " + ward9;
                    } else {
                        return "Outside";
                    }
                });
            },
            style: function (feature) {
                switch (feature.properties.name) {
                    case 'Ward9': return {
                        fillColor: getColor(ward9),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                }
            }
        }).addTo(map);
        var popup = L.popup();
    </script>
</asp:Content>