<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="GarbageMaster.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="../wwwroot/css/home.css" />
    <link href="../wwwroot/bootstrap/animate.min.css" rel="stylesheet" />
    <script src="../wwwroot/js/jquery-3.6.3.js"></script>
    <link href="../wwwroot/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="../wwwroot/bootstrap/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://ajax.aspnetcdn.com/ajax/knockout/knockout-3.1.0.js" type="text/javascript"></script>
    <script src="../wwwroot/js/submit.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.0/dist/sweetalert2.all.min.js"></script>
    <script type="text/javascript" language="javascript">
        function Alertforclick() {
            Swal.fire({
                title: 'Sorry!',
                text: 'You need to login in order to access this page',
                icon: 'error',
                confirmButtonColor: '#ff5a5a',
                confirmButtonText: 'Okay'
            })
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <section id="hero">
            <div id="heroCarousel" data-bs-interval="5000">
                <div class="carousel-item active" style="background-image: url(../wwwroot/images/ck.jpg)">
                    <div class="carousel-container">
                        <div class="container">
                            <h2 class="animate__animated animate__fadeInDown">Welcome to <span>Garbage Master</span></h2>
                            <p class="animate__animated animate__fadeInUp">
                                Garbage Master will be an android based application that will assist our Metropolitan to
manage the waste disposal. With this system, we will implement network to collect the
garbage data from the given areas, use different libraries to provide Geographical locations
representation with color variations to make it easier for both user and department to
identify waste pressure.
                            </p>
                            <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Read More</a>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <section id="featured-services" class="featured-services section-bg">
            <div class="container">

                <div class="row no-gutters">
                    <div class="col-lg-4 col-md-6">
                        <div class="icon-box">
                            <div class="icon">
                                <img src="../wwwroot/images/Health.png" /></div>
                            <h4 class="title"><a href="">Healthy Environment</a></h4>
                            <p class="description">By providing the garbage data to us, We all are contributing to Healthy Society</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="icon-box">
                            <div class="icon">
                                <img src="../wwwroot/images/System.png" /></div>
                            <h4 class="title"><a href="">Managed System</a></h4>
                            <p class="description">With our proper management system, there will no longer be wastes disposed on Roadside.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="icon-box">
                            <div class="icon">
                                <img src="../wwwroot/images/segregation.png" /></div>
                            <h4 class="title"><a href="">Waste Segregation</a></h4>
                            <p class="description">By seperating disposable and indisposable material, you are saving the earth. Recycle is the key to our World's Revival.</p>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <section id="about" class="about">
            <div class="container">

                <div class="section-title">
                    <h2>About Us</h2>
                    <p>
                        Garbage master is an android application that will assist our Metropolitan for
waste disposal. It mainly focused on household waste such as food waste, paper, glass, metals, plastics
etc.
                    </p>
                </div>

                <div class="row">
                    <div class="col-lg-6 order-1 order-lg-2">
                        <img src="../wwwroot/images/sidephoto.jpeg" class="img-fluid" alt="photo">
                    </div>
                    <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
                        <h3>Control the garbage, Beautify the city.</h3>
                        <p class="fst-italic">
                            Waste Management is a trending topic in Nepal. 
                The current System of Garbage Management is not reliable and we can see garbage on the Roadside every day. 
                We cannot blame Government only as we are equally responsible for that. 
                The Job of the Waste Management Facility is to collect Garbage and it's our responsibility that we do not throw Garbage on the roadside unless it is necessary. 
                Here we can neither blame department nor the general public as the problem is the Algorithm, not the end users. 
                        </p>
                        <p>
                            So, Our project provides the proper algorithm for that purpose. 
                We collect garbage quantity data from the general public every day and based on the data analysis derived from that data we can inform the department and they will send the truck to areas based on volume.
                        </p>

                        <p>
                            Registration of the user is the first step in accessing  our application.
For wastage inputs the user needs to login and provide information on waste quantity and type.
All the data is stored in database and analyzed by the system for presentation in map in colored variation. This is done by using algorithms.
The admin checks for the density of the waste in different regions and sends the data to the concerned authority.

                        </p>
                    </div>
                </div>

            </div>
        </section>
        <section id="services" class="services">
            <div class="container">

                <div class="section-title">
                    <h2>Services</h2>
                    <p>Garbage Collector provides wide range of services for general public that result to better version of our society.</p>
                </div>

                <div class="row" runat="server">
                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                        <div class="icon-box">
                            <div class="icon">
                                <img src="../wwwroot/images/Awareness2.png" alt="photo" />
                            </div>
                            <h4><asp:LinkButton ID="LinkButton1" runat="server" OnClick="redirectingtowastepage">Collect Garbage Data</asp:LinkButton></h4>
                            <p>We college garbage data from citizens to provide better garbage management system</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
                        <div class="icon-box">
                            <div class="icon">
                                <img src="../wwwroot/images/speaker.png" alt="photo" />
                            </div>
                            <h4><a href="">Awareness about Waste Segregation</a></h4>
                            <p>We implement regular awareness programs educating citizens about importance of waste segregation</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
                        <div class="icon-box">
                            <div class="icon">
                                <img src="../wwwroot/images/network.png" />
                            </div>
                            <h4><asp:LinkButton ID="LinkButton2" runat="server" OnClick="redirectingtonetworkpage">Network to display Waste Data</asp:LinkButton></h4>
                            <p>We not only collect the data, but provide the collected data too.</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
                        <div class="icon-box">
                            <div class="icon">
                                <img src="../wwwroot/images/map.png" />
                            </div>
                            <h4><asp:LinkButton ID="LinkButton3" runat="server" OnClick="redirectingtomappage">Map representation of Garbage in Regions</asp:LinkButton></h4>
                            <p>Regular data is complex to understand. So, we provide map represenatation to provide better user experience</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
                        <div class="icon-box">
                            <div class="icon">
                                <img src="../wwwroot/images/database.png" />
                            </div>
                            <h4><asp:LinkButton ID="LinkButton4" runat="server" OnClick="redirectingtomappage">Data Collection for analyzing the pattern</asp:LinkButton></h4>
                            <p>We don't intend to collect the data for eternity. After gathering enough data, we will analyze and plan for the given location.</p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
                        <div class="icon-box">
                            <div class="icon">
                                <img src="../wwwroot/images/garbage.png" />
                            </div>
                            <h4><a href="">Notify about Truck Arrival</a></h4>
                            <p>Just as your garbage data is important to us, Garbage Truck Arrival time is important to you. Leave it to us, We will notify you.</p>
                        </div>
                    </div>

                </div>

            </div>
        </section>
        <section id="contact" class="contact">
            <div class="container">

                <div class="section-title">
                    <h2>Contact</h2>
                    <p>Rght now, we do not have any designated office built for this project. we have displayed address of us that is to be used only during emergency. Also, the phone number provided here is personal phone number. So, call us only during emergency. Otherwise, you can leave us message by email or the Message section given below.</p>
                </div>

                <div class="row">

                    <div class="col-lg-5 d-flex align-items-stretch">
                        <div class="info">
                            <div class="address">
                                <i class="bi bi-geo-alt"></i>
                                <h4>Location:</h4>
                                <p>Tarakeshwor-9, Kathmandu Street 219 P.O. 4050</p>
                            </div>
                            <div class="email">
                                <i class="bi bi-envelope"></i>
                                <h4>Email:</h4>
                                <p>garbagemaster1417@gmail.com</p>
                            </div>

                            <div class="phone">
                                <i class="bi bi-phone"></i>
                                <h4>Call:</h4>
                                <p>+977 986-141726</p>
                            </div>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d882.7430877288479!2d85.30811608812205!3d27.748998798918123!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb190e6c2f3a95%3A0x9b1fb69793535e3f!2sGarbage%20Master!5e0!3m2!1sen!2snp!4v1672826665100!5m2!1sen!2snp" style="border: 0; width: 100%; height: 290px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>

                    </div>

                    <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
                        <div role="form" class="php-email-form">
                            <div data-bind="with: Master">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="name">Your Name</label>
                                        <input data-bind="value:name" name="name" class="form-control" id="name" required>
                                    </div>
                                    <div class="form-group col-md-6 mt-3 mt-md-0">
                                        <label for="name">Your Email</label>
                                        <input data-bind="value:email" class="form-control" name="email" id="email">
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <label for="name">Subject</label>
                                    <input data-bind="value:subject" class="form-control" name="subject" id="subject">
                                </div>
                                <div class="form-group mt-3">
                                    <label for="name">Message</label>
                                    <textarea data-bind="value:message" class="form-control" name="message" rows="10"></textarea>
                                </div>
                                <div class="my-3">
                                    <div class="loading">Loading</div>
                                    <div class="error-message"></div>
                                    <div class="sent-message">Your message has been sent. Thank you!</div>
                                </div>
                                <div class="my-3">
                                    <span data-bind="text: res" style="color:#5cb874 "></span>
                                </div>
                                <div class="my-3">
                                    <span data-bind="text: res2" style="color:#ff5a5a "></span>
                                </div>
                                <div class="text-center">
                                    <button style="background-color: #5cb874; color: white; border: 0px; padding: 10px;" data-bind="event:{click: savethis}">Send Message</button>
                                    <button style="background-color: #ff5a5a; margin-left: 50px; color: white; border: 0px; padding: 10px;" data-bind="event:{click: clearall}">Clear All Field</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>
    </div>
</asp:Content>


