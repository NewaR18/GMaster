﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ZWard5.aspx.cs" Inherits="GarbageMaster.Pages.ZWard5" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../wwwroot/css/CDNS/leaflet.css" />
    <script src="../wwwroot/js/CDNs/leaflet.js"></script>
    <link href="../wwwroot/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/GeoJsonByWards/ward5.js"></script>
    <script src="../wwwroot/js/jquery-3.6.3.js"></script>
    <link href="../wwwroot/css/CDNS/semantic.min.css" rel="stylesheet" />
    <link href="../wwwroot/css/CDNS/dataTables.semanticui.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/CDNs/jquery.dataTables.min.js"></script>
    <script src="../wwwroot/js/CDNs/dataTables.semanticui.min.js"></script>
    <script src="../wwwroot/js/CDNs/semantic.min.js"></script>
    <link href="../wwwroot/css/maps.css" rel="stylesheet" /><script src="../wwwroot/js/CDNs/sweetalert2.all.min.js"></script><script src="../wwwroot/js/Alerts.js"></script>

    <style>
        .mytruck2{
            color:black;
            border:1px solid;
            border-radius:1px;
            background-color:#04736a;
            color:white;width: 100px;text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center myfontstyle2 mt-4">
        <span>Map Representation of Garbage Data</span>
    </div>
    <div class="d-flex justify-content-center">
        <asp:Label ID="lblAverage" runat="server" Text="Ward 5"></asp:Label>
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
        <div class="text-align-end d-flex justify-content-between m-2">
            <asp:LinkButton  ID="sendtruck" runat="server" OnClick="TruckSent"><div class="mytruck2 p-2">Send Truck</div></asp:LinkButton>
            <asp:LinkButton ID="checkout" runat="server" OnClick="Checkedout"><div class="mytruck2 p-2" style="background-color:#ff5a5a">Checkout</div></asp:LinkButton>
        </div>
    </div>
        </div>
    <div class="d-flex justify-content-center mb-5">
    <div id = "map" style = "width:900px; height:580px;"></div>
    </div>
    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>

    <script>
        var ward5 = parseInt(document.getElementById("ContentPlaceHolder1_Label5").innerHTML);
        document.getElementById("ContentPlaceHolder1_Label5").style.display = "none";

        var map = L.map('map').setView([27.716, 85.337], 15.5);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            minZoom: 15.5,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
        function getColor(d) {
            return d < 9 ? '#10974c' :
                d < 17 ? '#dab600' :
                    d > 18 ? '#e53935' :
                        d > 100 ? '#e53935' :
                            '#e53935';
        }
        L.geoJSON(ward5JSON, {
            onEachFeature: function (feature, layer) {
                layer.bindPopup(function (layer) {
                    if (feature.properties.name == "Ward5") {
                        return feature.properties.name + ": " + ward5;
                    } else {
                        return "Outside";
                    }
                });
            },
            style: function (feature) {
                switch (feature.properties.name) {
                    case 'Ward5': return {
                        fillColor: getColor(ward5),
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
