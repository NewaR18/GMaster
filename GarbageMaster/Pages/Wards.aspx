<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Wards.aspx.cs" Inherits="GarbageMaster.Pages.Wards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://unpkg.com/jquery-ui-pack@1.12.2/jquery-ui.css" rel="stylesheet" />
    <link href="https://unpkg.com/jquery-ui-pack@1.12.2/jquery-ui.structure.css" rel="stylesheet" />
    <%--<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/south-street/jquery-ui.css">--%>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/flick/jquery-ui.css">
    <script src="https://unpkg.com/jquery-ui-pack@1.12.2/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pqGrid/3.5.1/pqgrid.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pqGrid/3.5.1/pqgrid.min.css" />
    <script src="../wwwroot/js/DisplayWards.js"></script>
    <style>
        .pq-grid-title-row{
            background-color:#04736a;
            color:white;
            text-align:center;
        }
        #grid_json{
            text-align:center!important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="grid_json" class="mt-5"></div>
    </div>
</asp:Content>
