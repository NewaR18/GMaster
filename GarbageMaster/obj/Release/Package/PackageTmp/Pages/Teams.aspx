<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Teams.aspx.cs" Inherits="GarbageMaster.Pages.Teams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../wwwroot/css/home.css" />
    <link href="../wwwroot/bootstrap/animate.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/jquery-3.6.3.js"></script>
    <link href="../wwwroot/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="../wwwroot/bootstrap/bootstrap-icons.css" rel="stylesheet" />
    <link href="../wwwroot/css/teams.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <script src="https://ajax.aspnetcdn.com/ajax/knockout/knockout-3.1.0.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active" style="background-image: url(../wwwroot/images/bck2.png)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">Management Team</h2>
              <p class="animate__animated animate__fadeInUp">Kudos to all the team members and supervisor Mrs. Rolisha Sthapit for development of this project</p>
              <a href="#team" class="btn-get-started animate__animated animate__fadeInUp scrollto">View Members</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
    <section id="team" class="team section-bg">
      <div class="container">
        <div class="section-title">
          <p>Check our Team</p>
        </div>
        <div class="row">
          <div class="col-xl-4 col-lg-4 col-md-4">
            <div class="member" data-aos="zoom-in" data-aos-delay="100">
              <img src="../wwwroot/images/pic1.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Sudip Shrestha</h4>
                  <span>Backend Developer</span>
                </div>
                <div class="social">
                  <a href="https://twitter.com/sudipsh24828223"><i class="bi bi-twitter"></i></a>
                  <a href="https://www.facebook.com/profile.php?id=100009218602207"><i class="bi bi-facebook"></i></a>
                  <a href="https://www.instagram.com/sudip_.shrestha/"><i class="bi bi-instagram"></i></a>
                  <a href="https://www.linkedin.com/in/sudip-shrestha-48a63621b/"><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-xl-4 col-lg-4 col-md-6" data-wow-delay="0.1s">
            <div class="member" data-aos="zoom-in" data-aos-delay="200">
              <img src="../wwwroot/images/pra.png" style="width:100%" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Pratik Khadka</h4>
                  <span>Flutter Developer</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href="https://www.facebook.com/EziOPratik"><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-xl-4 col-lg-4 col-md-6" data-wow-delay="0.2s">
            <div class="member" data-aos="zoom-in" data-aos-delay="300">
              <img src="../wwwroot/images/kumal.png"  class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Anil Kumal</h4>
                  <span>Flutter Developer</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href="https://www.facebook.com/kumal12.anil"><i class="bi bi-facebook"></i></a>
                  <a href="https://www.instagram.com/kumal_siri/"><i class="bi bi-instagram"></i></a>
                  <a href="https://www.linkedin.com/in/anil-kumal-675a52183/"><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
          <p class="mypdesc">As our project is cross platform, we have divided our work based on our expertise. For web application, web design part is handled by Mr. Pratik Khadka. Map integration using different libraries is fulfilled by Mr. Anil Kumal and the development of web application is completed by Mr. Sudip Shrestha</p>
          <p class="mypdesc">As for the development of Android Application, All the frontend, JSON Manipulation, UI/UX design and Map Integration part is completed by Mr. Anil Kumal and Mr. Pratik Khadka. Whereas the session, business logic and database logic layer is completed by Mr. Sudip Shrestha</p>
      </div>
    </section>
</asp:Content>
