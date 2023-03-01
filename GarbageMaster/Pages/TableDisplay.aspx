<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TableDisplay.aspx.cs" Inherits="GarbageMaster.Pages.TableDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../wwwroot/css/home.css" />
    <link href="../wwwroot/bootstrap/animate.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/jquery-3.6.3.js"></script>
    <link href="../wwwroot/css/CDNS/semantic.min.css" rel="stylesheet" />
    <link href="../wwwroot/css/CDNS/dataTables.semanticui.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/CDNs/jquery.dataTables.min.js"></script>
    <script src="../wwwroot/js/CDNs/dataTables.semanticui.min.js"></script>
    <script src="../wwwroot/js/CDNs/semantic.min.js"></script>
    <link href="../wwwroot/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="../wwwroot/bootstrap/bootstrap-icons.css" rel="stylesheet" />
    <link href="../wwwroot/css/TableDisplay.css" rel="stylesheet" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="section-title mt-5">
          <p>Waste data</p>
    </div>
    <div class="asawhole">
    <div class="section-title mt-2">
          <h4 style="color:#888888; font-size:22px">Ward Details</h4>
    </div>
    <div class="d-flex justify-content-center">
    
    <div class="d-flex justify-content-between mb-2 w-75">
        <div class="d-flex justify-content-center myfwidth">
            <div class="me-2 myfwidth2">
                <asp:Label ID="lblLocation" runat="server" Text="Location "></asp:Label>  
            </div>
            <p class="me-2 myfwidth4">:</p>
            <div class="me-2 myfwidth3">
                <asp:Label ID="txtLocation" runat="server"></asp:Label>  
            </div>
        </div>
        <div class="d-flex justify-content-center myfwidth">
            <div class="me-2 myfwidth2">
                <asp:Label ID="lblWard" runat="server" Text="Ward "></asp:Label>  
            </div>
            <p class="me-2 myfwidth4">:</p>
            <div class="me-2 myfwidth2">
                <asp:Label ID="txtWard" runat="server" Text="Demo"></asp:Label> 
            </div>
        </div>
    </div>
        </div>
        <div class="d-flex justify-content-center">
    <div class="d-flex justify-content-between mb-2 w-75">
        <div class="d-flex justify-content-center myfwidth">
            <div class="me-2 myfwidth2">
                <asp:Label ID="lblEmail" runat="server" Text="Email Address "></asp:Label>  
            </div>
            <p class="me-2 myfwidth4">:</p>
            <div class="me-2 myfwidth3">
                <asp:Label ID="txtEmail" runat="server" Text="Demo"></asp:Label>  
            </div>
        </div>
        <div class="d-flex justify-content-center myfwidth">
            <div class="me-2 myfwidth2">
                <asp:Label ID="lblPhone" runat="server" Text="Phone No. "></asp:Label>  
            </div>
            <p class="me-2 myfwidth4">:</p>
            <div class="me-2 myfwidth2">
            <asp:Label ID="txtPhone" runat="server" Text="Demo"></asp:Label>  
            </div>
        </div>
    </div>
    </div>
        <div class="d-flex justify-content-center">
    <div class="d-flex justify-content-between mb-5 w-75">
        <div class="d-flex justify-content-center myfwidth">
            <div class="me-2 myfwidth2">
                <asp:Label ID="lblChief" runat="server" Text="Ward Chief "></asp:Label>  
            </div>
            <p class="me-2 myfwidth4">:</p>
            <div class="me-2 myfwidth3">
                <asp:Label ID="txtChief" runat="server" Text="Demo"></asp:Label>  
            </div>
        </div>
        <div class="d-flex justify-content-center myfwidth">
            <div class="me-2 myfwidth2">
                <asp:Label ID="lblChiefPhone" runat="server" Text="Chief Phone "></asp:Label>  
            </div>
            <p class="me-2 myfwidth4">:</p>
            <div class="me-2 myfwidth2">
            <asp:Label ID="txtChiefPhone" runat="server" Text="Demo"></asp:Label>  
            </div>
        </div>
    </div>
    </div>
        <div Id="dvouter" class="tomaketextouterdiv" Visible="true" runat="server">
        <div class="tomaketextinteresting">
            Your waste data is not yet recorded, you can Click <asp:LinkButton ID="lnkWaste" style="color:#012970;" class="myownlink234" runat="server" OnClick="lnkWaste_Click">here</asp:LinkButton> to update the data
        </div>
        </div>
    <div class="d-flex justify-content-center mb-5">
    <div id="tablethis" style="width:65%;">
    <asp:GridView ID="GridView1" CssClass="table ui celled striped compact" runat="server" AutoGenerateColumns="False" HeaderStyle-BackColor="Red" HeaderStyle-ForeColor="White">
        <Columns>
            <asp:BoundField DataField="UsernameWH" HeaderText="Username" SortExpression="UsernameWH"></asp:BoundField>
            <asp:BoundField DataField="Waste_Data_History" HeaderText="Waste Data(in Plastic)" SortExpression="Waste_Data_History"></asp:BoundField>
            <asp:BoundField DataField="WardNoWH" HeaderText="Ward Number" SortExpression="WardNoWH"></asp:BoundField>
            <asp:BoundField DataField="DateReviewedWH" HeaderText="Last Date Reviewed" SortExpression="WardNoWH"></asp:BoundField>
        </Columns>
    </asp:GridView>
    </div>
     </div>
    </div>

</asp:Content>
