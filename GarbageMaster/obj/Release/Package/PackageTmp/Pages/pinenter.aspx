<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="pinenter.aspx.cs" Inherits="GarbageMaster.Pages.pinenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../wwwroot/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="../wwwroot/css/LoginForm.css" rel="stylesheet" />
    <script src="../wwwroot/js/jquery-3.6.3.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/knockout/knockout-3.1.0.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.all.min.js"></script>
    <script src="../wwwroot/js/pinenter.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
         <section class="section register min-vh-50 py-4">
             <div class="sabkoch">
             <div class="greencoloropacity">
                <div class="firstpart1"></div>
              </div>
        <div class="secondpart1">
        <div class="container makeit600">
          <div class="row justify-content-center">
            <div class=" col-10 d-flex flex-column align-items-center justify-content-center">
              <div class="d-flex justify-content-center py-4 makeitmid">
                  <img src="../wwwroot/images/logo1.png" class="img-fluid myimageedit" alt="photo"/>
              </div>
              <div class="card mb-6">
                <div class="card-body">
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4 gogreen2">Reset Password</h5>
                    <p class="text-center small gogreen2">Please check your inbox and enter 6 digit code provided in the email</p>
                  </div>
                      <div  class="row g-3" data-bind="with: Master">
                          <div class="col-md-12 hait">
                            <input data-bind="value:pin" class="form-control" id="inputUsername4" placeholder="XXXXXX">
                            <span id="errorpin" class="errorfname2"></span>
                          </div>
                          <div class="col-12 makeitmid">
                            <button data-bind="event:{click: saveprocess}" class="buttoncolor23">Submit</button>
                          </div>
                          <div class="col-12">
                            <p class="small mb-0"><a id="mylink2" href="ResetPassword.aspx">Go Back</a></p>
                          </div>
                    </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
            </div>
          </section>   
  </main>
</asp:Content>
