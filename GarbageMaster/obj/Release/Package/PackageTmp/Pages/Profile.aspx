<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="GarbageMaster.Pages.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../wwwroot/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/jquery-3.6.3.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.all.min.js"></script>
    <script type="text/javascript">
        /*$(function () {
            $("Image1").click(function () {
                console.log("Hello")
            });
        });*/
        function Func() {
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 5000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                icon: 'error',
                title: 'Insert Image below 100KB'
            })
        }
    </script>
    <link href="../wwwroot/css/profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center makeitcirclelike p-3 py-5">
<%--                    <img class="makeitcirclelike mt-5" width="170" height="190" src="../wwwroot/images/profile.jpg">--%>
                <asp:image ID="Image1" CssClass="makeitcirclelike mt-5" width="170" height="190" runat="server" ImageUrl ="Profile.aspx?ImageID=1"/>
                <asp:FileUpload id="upload2" runat="server" class="form-control" Visible=true/>
                <span ID="myuname" runat="server" class="font-weight-bold"></span>
                <span ID="myemail" runat="server" class="text-black-50">edogaru@mail.com.my</span>
                <span> </span>
            </div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="text-right">Profile Settings &nbsp; <span ID="boxforedit" runat="server" class="myownbutton profile-button"><asp:LinkButton ID="editbutton" runat="server" Height="18" class="makelinkwhite" ForeColor="#606060" OnClick="Makeiteditable">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="white" class="bi bi-pen" viewBox="0 0 16 16">
                    <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
                    </svg>
                    <asp:Label runat="server" Text="Edit Profile" CssClass="makelinkwhite" style="margin:0px 0px 10px 5px; float:left;"/>
                </asp:LinkButton></span></div>
                </div>
                <div class="row mt-3">
                    
                    <div class="col-md-4"><asp:Label ID="labelId" class="labels" runat="server">First Name</asp:Label><asp:TextBox ID="FirstName" runat="server" class="form-control" value="" readonly=true></asp:TextBox> </div>
                    <div class="col-md-4"><asp:Label ID="label1" class="labels" runat="server">Middle Name</asp:Label><asp:TextBox ID="MiddleName" runat="server" class="form-control" readonly=true></asp:TextBox></div>
                    <div class="col-md-4"><asp:Label ID="label2" class="labels" runat="server">Last Name</asp:Label><asp:TextBox ID="LastName" runat="server" class="form-control" readonly=true></asp:TextBox></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><asp:Label ID="label3" class="labels" runat="server">Email</asp:Label><asp:TextBox ID="Email" runat="server" class="form-control" readonly=true></asp:TextBox></div>
                    <div class="col-md-12"><asp:Label ID="label4" class="labels" runat="server">Username</asp:Label><asp:TextBox ID="Username" runat="server" class="form-control" readonly=true></asp:TextBox></div>
                    <div class="col-md-12"><asp:Label ID="label6" class="labels" runat="server">Phone Number</asp:Label><asp:TextBox ID="PhoneNo" runat="server" class="form-control" readonly=true></asp:TextBox></div>
                    <div class="col-md-12"><label class="labels">Country</label><input type="text" class="form-control" value="Nepal" readonly></div>
                    <div class="col-md-12"><label class="labels">State</label><input type="text" class="form-control" value="Bagmati" readonly></div>
                    <div class="col-md-12"><label class="labels">District</label><input type="text" class="form-control" value="Kathmandu" readonly></div>
                    <div class="col-md-12"><asp:Label ID="label5" class="labels" runat="server">Ward</asp:Label><asp:TextBox ID="Ward" runat="server" class="form-control" readonly=true></asp:TextBox></div>
                </div>
                <div class="mt-5 text-center"><asp:Button ID="update" class="myownbutton profile-button" runat="server" Text="Update" OnClick="Update"  Visible=false/></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-3 py-5 d-flex">
                <p>Last Garbdate: </p>&nbsp;<asp:Label ID="label7" runat="server">Yet to be reviewed</asp:Label>
            </div>
        </div>
    </div>
</div>
    <div id="dialog" style="display: none"></div>
</asp:Content>
