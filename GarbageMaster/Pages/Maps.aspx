<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Maps.aspx.cs" Inherits="GarbageMaster.Pages.Maps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../wwwroot/css/CDNS/leaflet.css" />
    <script src="../wwwroot/js/CDNs/leaflet.js"></script>
    <link href="../wwwroot/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/Wardmap.js"></script>
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
        .leaflet-popup-content-wrapper {
            background-color:#04736a;
            opacity:0.7;
            color:white;
        }

        .leaflet-popup-content-wrapper .leaflet-popup-content {
        }

        .leaflet-popup-tip-container {
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center myfontstyle2 mt-4">
        <p>Map Representation of Garbage Data</p>
    </div>
    <div class="d-flex justify-content-center">
        <asp:Label ID="lblAverage" runat="server" Text="Average"></asp:Label>
    </div>
    <div class="d-flex justify-content-center mt-4 mb-5">
    <div id="tablethis" style="width:35%;">
    <asp:GridView ID="GridView1" CssClass="table ui celled striped compact" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Ward_No" HeaderText="Ward"></asp:BoundField>
            <asp:BoundField DataField="Waste" HeaderText="Average Waste"></asp:BoundField>
        </Columns>
    </asp:GridView>
    </div>
        </div>
    <div class="d-flex justify-content-center mb-5">
    <div id = "map" style = "width:900px; height:580px;"></div>
    </div>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label13" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label14" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label16" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label17" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label18" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label19" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label20" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label21" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label22" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label23" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label24" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label25" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label26" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label27" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label28" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label29" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label30" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label31" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label32" runat="server" Text=""></asp:Label>

    <script>

        var ward1 = parseInt(document.getElementById("ContentPlaceHolder1_Label1").innerHTML);
        var ward2 = parseInt(document.getElementById("ContentPlaceHolder1_Label2").innerHTML);
        var ward3 = parseInt(document.getElementById("ContentPlaceHolder1_Label3").innerHTML);
        var ward4 = parseInt(document.getElementById("ContentPlaceHolder1_Label4").innerHTML);
        var ward5 = parseInt(document.getElementById("ContentPlaceHolder1_Label5").innerHTML);
        var ward6 = parseInt(document.getElementById("ContentPlaceHolder1_Label6").innerHTML);
        var ward7 = parseInt(document.getElementById("ContentPlaceHolder1_Label7").innerHTML);
        var ward8 = parseInt(document.getElementById("ContentPlaceHolder1_Label8").innerHTML);
        var ward9 = parseInt(document.getElementById("ContentPlaceHolder1_Label9").innerHTML);
        var ward10 = parseInt(document.getElementById("ContentPlaceHolder1_Label10").innerHTML);
        var ward11 = parseInt(document.getElementById("ContentPlaceHolder1_Label11").innerHTML);
        var ward12 = parseInt(document.getElementById("ContentPlaceHolder1_Label12").innerHTML);
        var ward13 = parseInt(document.getElementById("ContentPlaceHolder1_Label13").innerHTML);
        var ward14 = parseInt(document.getElementById("ContentPlaceHolder1_Label14").innerHTML);
        var ward15 = parseInt(document.getElementById("ContentPlaceHolder1_Label15").innerHTML);
        var ward16 = parseInt(document.getElementById("ContentPlaceHolder1_Label16").innerHTML);
        var ward17 = parseInt(document.getElementById("ContentPlaceHolder1_Label17").innerHTML);
        var ward18 = parseInt(document.getElementById("ContentPlaceHolder1_Label18").innerHTML);
        var ward19 = parseInt(document.getElementById("ContentPlaceHolder1_Label19").innerHTML);
        var ward20 = parseInt(document.getElementById("ContentPlaceHolder1_Label20").innerHTML);
        var ward21 = parseInt(document.getElementById("ContentPlaceHolder1_Label21").innerHTML);
        var ward22 = parseInt(document.getElementById("ContentPlaceHolder1_Label22").innerHTML);
        var ward23 = parseInt(document.getElementById("ContentPlaceHolder1_Label23").innerHTML);
        var ward24 = parseInt(document.getElementById("ContentPlaceHolder1_Label24").innerHTML);
        var ward25 = parseInt(document.getElementById("ContentPlaceHolder1_Label25").innerHTML);
        var ward26 = parseInt(document.getElementById("ContentPlaceHolder1_Label26").innerHTML);
        var ward27 = parseInt(document.getElementById("ContentPlaceHolder1_Label27").innerHTML);
        var ward28 = parseInt(document.getElementById("ContentPlaceHolder1_Label28").innerHTML);
        var ward29 = parseInt(document.getElementById("ContentPlaceHolder1_Label29").innerHTML);
        var ward30 = parseInt(document.getElementById("ContentPlaceHolder1_Label30").innerHTML);
        var ward31 = parseInt(document.getElementById("ContentPlaceHolder1_Label31").innerHTML);
        var ward32 = parseInt(document.getElementById("ContentPlaceHolder1_Label32").innerHTML);

        document.getElementById("ContentPlaceHolder1_Label1").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label2").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label3").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label4").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label5").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label6").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label7").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label8").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label9").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label10").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label11").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label12").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label13").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label14").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label15").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label16").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label17").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label18").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label19").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label20").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label21").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label22").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label23").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label24").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label25").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label26").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label27").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label28").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label29").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label30").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label31").style.display = "none";
        document.getElementById("ContentPlaceHolder1_Label32").style.display = "none";

        var map = L.map('map').setView([27.71, 85.329], 13);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            minZoom: 13,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
       function getColor(d) {
           return d < 9 ? '#10974c' :
                  d < 17 ? '#dab600' :
                  d > 18 ? '#e53935' :
                       d > 100 ? '#e53935' :
                        '#e53935';
        }
         /*
        function style(Ward1) {
            return {
                fillColor: getColor(10),
                weight: 2,
                opacity: 1,
                color: 'white',
                dashArray: '3',
                fillOpacity: 0.7
            };
        }*/
        L.geoJSON(wardmapJSON, {
            onEachFeature: function (feature, layer) {
                layer.bindPopup(function (layer) {
                    if (feature.properties.name == "Ward1") {
                        return feature.properties.name + ": " + ward1;
                    } else if (feature.properties.name == "Ward2") {
                        return feature.properties.name + ": " + ward2;
                    } else if (feature.properties.name == "Ward3") {
                        return feature.properties.name + ": " + ward3;
                    } else if (feature.properties.name == "Ward4") {
                        return feature.properties.name + ": " + ward4;
                    } else if (feature.properties.name == "Ward5") {
                        return feature.properties.name + ": " + ward5;
                    } else if (feature.properties.name == "Ward6") {
                        return feature.properties.name + ": " + ward6;
                    } else if (feature.properties.name == "Ward7") {
                        return feature.properties.name + ": " + ward7;
                    } else if (feature.properties.name == "Ward8") {
                        return feature.properties.name + ": " + ward8;
                    } else if (feature.properties.name == "Ward9") {
                        return feature.properties.name + ": " + ward9;
                    } else if (feature.properties.name == "Ward10") {
                        return feature.properties.name + ": " + ward10;
                    } else if (feature.properties.name == "Ward11") {
                        return feature.properties.name + ": " + ward11;
                    } else if (feature.properties.name == "Ward12") {
                        return feature.properties.name + ": " + ward12;
                    } else if (feature.properties.name == "Ward13") {
                        return feature.properties.name + ": " + ward13;
                    } else if (feature.properties.name == "Ward14") {
                        return feature.properties.name + ": " + ward14;
                    } else if (feature.properties.name == "Ward15") {
                        return feature.properties.name + ": " + ward15;
                    } else if (feature.properties.name == "Ward16") {
                        return feature.properties.name + ": " + ward16;
                    } else if (feature.properties.name == "Ward17") {
                        return feature.properties.name + ": " + ward17;
                    } else if (feature.properties.name == "Ward18") {
                        return feature.properties.name + ": " + ward18;
                    } else if (feature.properties.name == "Ward19") {
                        return feature.properties.name + ": " + ward19;
                    } else if (feature.properties.name == "Ward20") {
                        return feature.properties.name + ": " + ward20;
                    } else if (feature.properties.name == "Ward21") {
                        return feature.properties.name + ": " + ward21;
                    } else if (feature.properties.name == "Ward22") {
                        return feature.properties.name + ": " + ward22;
                    } else if (feature.properties.name == "Ward23") {
                        return feature.properties.name + ": " + ward23;
                    } else if (feature.properties.name == "Ward24") {
                        return feature.properties.name + ": " + ward24;
                    } else if (feature.properties.name == "Ward25") {
                        return feature.properties.name + ": " + ward25;
                    } else if (feature.properties.name == "Ward26") {
                        return feature.properties.name + ": " + ward26;
                    } else if (feature.properties.name == "Ward27") {
                        return feature.properties.name + ": " + ward27;
                    } else if (feature.properties.name == "Ward28") {
                        return feature.properties.name + ": " + ward28;
                    } else if (feature.properties.name == "Ward29") {
                        return feature.properties.name + ": " + ward29;
                    } else if (feature.properties.name == "Ward30") {
                        return feature.properties.name + ": " + ward30;
                    } else if (feature.properties.name == "Ward31") {
                        return feature.properties.name + ": " + ward31;
                    } else if (feature.properties.name == "Ward32") {
                        return feature.properties.name + ": " + ward32;
                    } else {
                        return "Outside";
                    }
                });
            },
            style: function (feature) {
                switch (feature.properties.name) {
                    case 'Ward1': return {
                        fillColor: getColor(ward1),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward2': return {
                        fillColor: getColor(ward2),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward3': return {
                        fillColor: getColor(ward3),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward4': return {
                        fillColor: getColor(ward4),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward5': return {
                        fillColor: getColor(ward5),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward6': return {
                        fillColor: getColor(ward6),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward7': return {
                        fillColor: getColor(ward7),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward8': return {
                        fillColor: getColor(ward8),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward9': return {
                        fillColor: getColor(ward9),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward10': return {
                        fillColor: getColor(ward10),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward11': return {
                        fillColor: getColor(ward11),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward12': return {
                        fillColor: getColor(ward12),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward13': return {
                        fillColor: getColor(ward13),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward14': return {
                        fillColor: getColor(ward14),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward15': return {
                        fillColor: getColor(ward15),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward16': return {
                        fillColor: getColor(ward16),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward17': return {
                        fillColor: getColor(ward17),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward18': return {
                        fillColor: getColor(ward18),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward19': return {
                        fillColor: getColor(ward19),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward20': return {
                        fillColor: getColor(ward20),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward21': return {
                        fillColor: getColor(ward21),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward22': return {
                        fillColor: getColor(ward22),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward23': return {
                        fillColor: getColor(ward23),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward24': return {
                        fillColor: getColor(ward24),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward25': return {
                        fillColor: getColor(ward25),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward26': return {
                        fillColor: getColor(ward26),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward27': return {
                        fillColor: getColor(ward27),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward28': return {
                        fillColor: getColor(ward28),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward29': return {
                        fillColor: getColor(ward29),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward30': return {
                        fillColor: getColor(ward30),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward31': return {
                        fillColor: getColor(ward31),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                    case 'Ward32': return {
                        fillColor: getColor(ward32),
                        weight: 2,
                        opacity: 1,
                        color: 'white',
                        dashArray: '3',
                        fillOpacity: 0.7
                    };
                }
            }
        }).addTo(map);
        /*L.geoJSON(wardmapJSON, { style: style }).addTo(map)*/
       /* L.geoJSON(wardmapJSON).addTo(map);*/
        var popup = L.popup();

        function onMapClick(e) {
            popup
                .setLatLng(e.latlng)
                .setContent("You clicked the map at " + e.features.properties.name)
                .openOn(map);
        }

        map.on('click', onMapClick);
        /*var corner1 = L.latLng(27.74926, 85.272961)
        var corner2 = L.latLng(27.660891, 85.388489)*/
    </script>
    
</asp:Content>
