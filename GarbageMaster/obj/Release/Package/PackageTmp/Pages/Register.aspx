<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GarbageMaster.Pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../wwwroot/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="../wwwroot/css/RegisterForm.css" rel="stylesheet" />
    <script src="../wwwroot/js/jquery-3.6.3.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/knockout/knockout-3.1.0.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.all.min.js"></script>
    <script src="../wwwroot/js/register.js"></script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>

      <section class="section register min-vh-50 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6 col-md-6 d-flex flex-column align-items-center justify-content-center">

              

              <div class="card mb-6">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4 gogreen2">Be a G-Master Member</h5>
                    <p class="text-center small gogreen2">Enter your personal details to create account</p>
                  </div>
                      <div  class="row g-3" data-bind="with: Master">
                      <div class="col-md-4 hait">
                        <label for="inputFName4" class="form-label">First Name</label>
                        <input data-bind="value:fname" type="text" class="form-control" id="inputFName4" placeholder="Enter your first name">
                         <span id="errorfname" class="errorfname2"></span>
                      </div>
                      <div class="col-md-4 hait">
                        <label for="inputMName4" class="form-label">Middle Name</label>
                        <input data-bind="value:mname" type="text" class="form-control" id="inputMName4" placeholder="Enter your middle name">
                      </div>
                      <div class="col-md-4 hait">
                        <label for="inputLName4" class="form-label">Last Name</label>
                        <input data-bind="value:lname" class="form-control" id="inputLName4" placeholder="Enter your last name">
                        <span id="errorlname" class="errorfname2"></span>
                      </div>
                      <div class="col-md-6 hait">
                        <label for="inputEmail4" class="form-label">Email</label>
                        <input data-bind="value:email" class="form-control" id="inputEmail4" placeholder="Enter your Email Address">
                        <span id="erroremail" class="errorfname2"></span>
                      </div>
                      <div class="col-md-6 hait">
                        <label for="inputUsername4" class="form-label">Username</label>
                        <input data-bind="value:uname" class="form-control" id="inputUsername4" placeholder="Enter your Username">
                        <span id="errorusername" class="errorfname2"></span>
                      </div>
                      <div class="col-md-6 hait">
                        <label for="inputPassword4" class="form-label">Password</label>
                        <input data-bind="value:password" class="form-control" id="inputPassword4" placeholder="Enter your Password">
                        <span id="errorpassword" class="errorfname2"></span>
                      </div>
                      <div class="col-md-6 hait">
                        <label for="inputConfirmPassword4" class="form-label">Confirm Password</label>
                        <input data-bind="value:cpassword" class="form-control" id="inputConfirmPassword4" placeholder="Enter your Confirm Password">
                        <span id="errorcpassword" class="errorfname2"></span>
                      </div>
                      <div class="col-md-5 hait">
                        <label for="inputState" class="form-label">Kathmandu Metro Ward</label>
                        <select data-bind="options: availables,optionsText:'name',optionsValue:'id',optionsCaption:'Select here', value: hello" class="form-select"></select>
                          <span id="errorhello" class="errorfname2"></span>
                      </div>
                      <div class="col-12">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" data-bind="checked: terms" id="gridCheck">
                          <label class="form-check-label" for="gridCheck">
                            I accept all the terms and conditions
                          </label>
                            <span id="errorterms" class="errorfname2"></span>
                        </div>
                      </div>
                      <div class="col-12 stuart1">
                        <button data-bind="event:{click: saveprocess}" class="buttoncolor23">Register</button>
                      </div>
                    <div class="col-12">
                      <p class="small mb-0">Already have an account? <a id="mylink2" href="Login.aspx">Log in</a></p>
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
