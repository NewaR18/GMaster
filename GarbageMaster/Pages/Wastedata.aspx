<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Wastedata.aspx.cs" Inherits="GarbageMaster.Pages.Wastedata" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="../wwwroot/bootstrap/animate.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/jquery-3.6.3.js"></script>
    <link href="../wwwroot/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="../wwwroot/bootstrap/bootstrap-icons.css" rel="stylesheet" />
    <link href="../wwwroot/css/Wastedata.css" rel="stylesheet" />
    <script src="../wwwroot/js/knockout-3.1.0.js"></script>
    <script src="../wwwroot/js/CDNs/sweetalert2.all.min.js"></script>
    <script src="../wwwroot/js/wastedata.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">\
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <span>Waste Data</span>
          <h2>Waste Data</h2>
          <p>Thank you for participating in our program. By following us, you too are contributing for this society.</p>
        </div>

        <div class="row" data-bind="with: Master">
          <div class="col-lg-6  mt-4 mt-lg-0">
            <div class="member d-flex align-items-start">
              <div class="pic"><img width="125" height="125" class="img-fluid" src="../wwwroot/images/plastic.png" /></div>
              <div class="member-info">
                <h4>Small Bag</h4>
                <span>Number of filled Plastics</span>
                <p>Small plastic refers to bags that contains very small amount of garbages. We advise you not to count without filling the entire bag. The filled bag allows us to measure the data more efficiently.</p>
                  <div class="col-6 mt-3">
                <input data-bind="value:smallplastic" type="number" class="form-control" id="inputsmallplastic" min="0" placeholder="Quantity in Units">
                  </div>
             </div>
            </div>
          </div>

          <div class="col-lg-6 mt-4 mt-lg-0">
            <div class="member d-flex align-items-start">
              <div class="pic"><img  width="125" height="125"  class="img-fluid" src="../wwwroot/images/bigbag.png"></div>
              <div class="member-info">
                <h4>Big Bag</h4>
                <span>Number of filled big bags</span>
                <p>Big bag refers to bags that contains large amount of garbages. We advise you not to count without filling the entire bag. The filled bag allows us to measure the data more efficiently.</p>
                  <div class="col-6 mt-3">
                <input data-bind="value:bigplastic" type="number" class="form-control " id="inputbigplastic" min="0" placeholder="Quantity in Units">
                  </div>
              </div>
            </div>
          </div>

          <div class="col-lg-6 mt-4">
            <div class="member d-flex align-items-start">
              <div class="pic"><img width="125" height="125" class="img-fluid" src="../wwwroot/images/Dustbin.png" /></div>
              <div class="member-info">
                <h4>Dustbin</h4>
                <span>Number of filled Dustbin</span>
                <p>Dust bin refers to storage that contains large amount of garbages. If the dustbin is very small, please count it in plastic zone. We advise you not to count without filling the entire bin to make it more efficient</p>
                  <div class="col-6 mt-3">
                <input data-bind="value:dustbin" type="number" class="form-control" id="inputdustbin" min="0" placeholder="Quantity in Units">
                  </div>
              </div>
            </div>
          </div>

          <div class="col-lg-6 mt-4">
            <div class="member d-flex align-items-start">
              <div class="pic"><img width="125" height="125" class="img-fluid" src="../wwwroot/images/Sack.png" /></div>
              <div class="member-info">
                <h4>Sack Bag</h4>
                <span>Number of filled sack bags</span>
                <p>Sack bag refers to bags that contains very large amount of garbages. We advise you not to count without filling the entire bag. The filled bag allows us to measure the data more efficiently.</p>
                  <div class="col-6 mt-3">
                <input data-bind="value:sack" type="number" class="form-control" id="inputsack" min="0" placeholder="Quantity in Units">
                  </div>
              </div>
            </div>
          </div>
            <div class="col-12 d-flex justify-content-center mb-5 mt-0">
            <button data-bind="event:{click: saveprocess}" class="buttoncolor23 mt-4 ps-4 pe-4 pt-2 pb-2">Update</button>
            </div>
        </div>

      </div>
    </section>
</asp:Content>