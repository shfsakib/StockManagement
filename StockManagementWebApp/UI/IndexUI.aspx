<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexUI.aspx.cs" Inherits="StockManagementWebApp.UI.IndexUI" EnableEventValidation="false" ValidateRequest="false"%>


<html>
<head>
    <link rel="Shortcut icon" href="/images/icon.ico" type="image/x-icon" />

    <title>Stock Management</title>
    <link href="/fonts/" rel="stylesheet">
    <script src="javascript/Jquery_3.1.1.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            height: 100%;
        }

        .bw-gradient {
            width: 100%;
            height: 600px;
            position: absolute;
            padding: 0;
            margin: 0;
            top: 0;
            /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#000000+0,000000+100&1+5,0+100 */
            background: -moz-linear-gradient(top, rgba(0,0,0,1) 0%, rgba(0,0,0,1) 5%, rgba(0,0,0,0) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, rgba(0,0,0,1) 0%,rgba(0,0,0,1) 5%,rgba(0,0,0,0) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, rgba(0,0,0,1) 0%,rgba(0,0,0,1) 5%,rgba(0,0,0,0) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#000000', endColorstr='#00000000',GradientType=0 ); /* IE6-9 */
        }


        nav {
            position: fixed;
            top: 0;
            left: 0;
            width: 90%;
            height: 50px;
            padding: 10px 100px;
            transition: .3s;
        }

            nav.black {
                background: rgba(0,0,0,.8);
                width: 90%;
                height: 50px;
                padding: 10px 100px;
            }

            nav .logo {
                padding: 0px 12px;
                height: 30px;
                float: left;
                color: #fff;
                font-family: 'Abel', sans-serif;
                font-size: 30px;
                transition: .3s;
                margin-left: 35px;
                text-decoration: none;
            }

            nav ul {
                list-style: none;
                float: right;
                margin: 0;
                padding: 0;
                display: flex;
            }

                nav ul li {
                    list-style: none;
                }

                    nav ul li a {
                        line-height: 60px;
                        color: #fff;
                        padding: 12px 20px;
                        text-decoration: none;
                        text-transform: uppercase;
                        font-family: 'Abel', sans-serif;
                        font-size: 16px;
                        font-weight: bold;
                        transition: .3s;
                    }

            nav.black ul li a {
                color: #fff;
            }

            nav ul li a:focus {
                outline: none;
            }

            nav ul li a:hover {
                color: aqua;
            }

            nav ul li a.active {
                background: #4268B2;
                color: #fff;
                border-radius: 6px;
                font-size: 12px;
                font-weight: bold;
            }

                nav ul li a.active:hover {
                    background: #0000cd;
                }

        .sect {
            height: 100%;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .sectOne {
            background-image: url("/images/backgroundtran.jpg");
        }
        /*.subSection {
    height: 20%;
    background-color: aqua;
}*/

        .sectTwo {
            background-image: url("/images/backgroundabout.jpg");
        }

        .brand-quotoOne {
            color: #fff;
            font-family: 'Patua One', cursive;
            font-size: 50px;
            padding-left: 90px;
            position: relative;
            top: 210px;
        }

        .brand-quotoTwo {
            color: #c8a952;
            font-family: 'Patua One', cursive;
            font-size: 30px;
            padding-left: 90px;
            position: relative;
            top: 220px;
        }

        .para {
            width: 500px;
            font-family: 'abel', sans-serif;
            padding-left: 90px;
            position: relative;
            font-size: 20px;
            top: 220px;
        }

        .about1 {
            color: #fff;
            font-family: 'Patua One', cursive;
            font-size: 50px;
            padding-left: 120px;
            position: relative;
            top: 120px;
        }

        .about2 {
            color: #00ced1;
            font-family: 'Patua One', cursive;
            font-size: 30px;
            padding-left: 120px;
            position: relative;
            top: 150px;
        }

        .para1 {
            width: 500px;
            font-family: 'abel', sans-serif;
            padding-left: 120px;
            position: relative;
            top: 170px;
            color: #fff;
            font-size: 25px;
        }

        .para2 {
            color: #fff;
            width: 500px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 220px;
            position: relative;
            top: 142px;
        }

        .para3 {
            width: 500px;
            font-family: 'abel', sans-serif;
            padding-left: 120px;
            position: relative;
            top: 140px;
            color: #fff;
            font-size: 25px;
        }

        .para4 {
            color: #fff;
            width: 700px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 220px;
            position: relative;
            top: 111px;
        }

        .para5 {
            width: 500px;
            font-family: 'abel', sans-serif;
            padding-left: 120px;
            position: relative;
            top: 115px;
            color: #fff;
            font-size: 25px;
        }

        .para6 {
            color: #fff;
            width: 700px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 220px;
            position: relative;
            top: 85px;
        }

        .para7 {
            width: 500px;
            font-family: 'abel', sans-serif;
            padding-left: 120px;
            position: relative;
            top: 90px;
            color: #fff;
            font-size: 25px;
        }

        .para8 {
            color: #fff;
            width: 700px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 220px;
            position: relative;
            top: 61px;
        }

        .sectThree {
            height: 100%;
            background-image: url("/images/prod.jpg");
        }

        .sectThreecon {
            width: 100%;
            margin-top: 0px;
        }

        .imagecos {
            width: 255px;
            height: 400px;
            float: left;
            margin-left: 100px;
            border-radius: 10%;
            margin-top: 170px;
        }

        .img-cosmetic {
            width: 250px;
            height: 250px;
            padding: 1px;
            border-radius: 10%;
            border: 1px solid #fff;
        }

        .cosmetics {
            color: #fff;
            width: 200px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 80px;
            position: relative;
            top: 05px;
        }

        .imagestat {
            width: 255px;
            height: 400px;
            float: left;
            margin-left: 40px;
            border-radius: 10%;
            margin-top: 170px;
        }

        .img-stat {
            width: 250px;
            height: 250px;
            padding: 1px;
            border-radius: 10%;
            border: 1px solid #fff;
        }

        .stationary {
            color: #fff;
            width: 200px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 80px;
            position: relative;
            top: 05px;
        }

        .imageelec {
            width: 255px;
            height: 400px;
            float: left;
            margin-left: 40px;
            border-radius: 10%;
            margin-top: 170px;
        }

        .img-elec {
            width: 250px;
            height: 250px;
            padding: 1px;
            border-radius: 10%;
            border: 1px solid #fff;
        }

        .electronics {
            color: #fff;
            width: 200px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 80px;
            position: relative;
            top: 05px;
        }

        .imagekitch {
            width: 255px;
            height: 400px;
            float: left;
            margin-left: 40px;
            border-radius: 10%;
            margin-top: 170px;
        }

        .img-kitch {
            width: 250px;
            height: 250px;
            padding: 1px;
            border-radius: 10%;
            border: 1px solid #fff;
        }

        .kitchen {
            color: #fff;
            width: 200px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 80px;
            position: relative;
            top: 05px;
        }

        .sectfour {
            height: 100%;
            background-image: url("/images/team2.jpg");
        }

        .fourcon {
            width: 100%;
            margin-top: 0px;
        }

        .imageshf {
            width: 350px;
            height: 400px;
            float: left;
            margin-left: 100px;
            border-radius: 10%;
            margin-top: 170px;
        }

        .img-shf {
            width: 250px;
            margin-left: 47px;
            height: 250px;
            padding: 1px;
            border-radius: 10%;
            border: 1px solid #fff;
        }

        .shf {
            color: #fff;
            width: 200px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 58px;
            position: relative;
            top: 05px;
        }

        .coursejob {
            font-family: 'abel', sans-serif;
            color: #fff;
            font-size: 20px;
            padding-left: 120px;
        }

        .varsitySak {
            font-family: 'abel', sans-serif;
            font-size: 20px;
            color: #fff;
            margin-left:25px;
        }

        .imagefah {
            width: 350px;
            height: 400px;
            float: left;
            margin-left: 50px;
            border-radius: 10%;
            margin-top: 170px;
        }

        .img-fah {
            width: 250px;
            height: 250px;
            margin-left: 47px;
            padding: 1px;
            border-radius: 10%;
            border: 1px solid #fff;
        }

        .fah {
            color: #fff;
            width: 200px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 85px;
            position: relative;
            top: 05px;
        }

        .coursefah {
            font-family: 'abel', sans-serif;
            font-size: 20px;
            color: #fff;
            padding-left: 128px;
        }

        .varsityfah {
            font-family: 'abel', sans-serif;
            color: #fff;
            font-size: 20px;
            padding-left: 3px;
        }

        .imagejob {
            width: 350px;
            height: 400px;
            float: left;
            margin-left: 50px;
            border-radius: 10%;
            margin-top: 170px;
        }

        .img-job {
            width: 250px;
            height: 250px;
            margin-left: 47px;
            padding: 1px;
            border-radius: 10%;
            border: 1px solid #fff;
        }

        .job {
            color: #fff;
            width: 200px;
            font-family: 'abel', sans-serif;
            font-size: 22px;
            padding-left: 58px;
            position: relative;
            top: 5px;
        }

        .coursejob {
            font-family: 'abel', sans-serif;
            color: #fff;
            font-size: 20px;
            padding-left: 120px;
        }

        .varsityjob {
            font-family: 'abel', sans-serif;
            color: #fff;
            font-size: 20px;
            margin-left: 30px;
        }

        .sectfive {
            height: 100%;
            background-image: url("/images/contact.jpg");
        }

        .fivecon {
            width: 100%;
        }

        .contactus {
            width: 1000px;
            height: 550px;
            /*background-color: red;*/
            position: relative;
            top: 70px;
            margin-left: 180px;
        }

        .cont {
            font-family: 'Comic sans ms', sans-serif;
            font-size: 35px;
            color: #fff;
            position: relative;
            top: 20px;
            padding-left: 380px;
        }

        .name {
            width: 380px;
            height: 35px;
            background: rgba(0, 0, 0, 0);
            border: none;
            color: #fff;
            font-family: 'abel', sans-serif;
            border-bottom: 1px solid #0078ff;
            font-size: 16px;
            margin-top: 100px;
            margin-left: 290px;
        }

        .email {
            width: 380px;
            height: 35px;
            border: none;
            color: #fff;
            background: rgba(0, 0, 0, 0);
            border-bottom: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            margin-top: 10px;
            margin-left: 290px;
        }

        .subject {
            width: 380px;
            height: 35px;
            border: none;
            background: rgba(0, 0, 0, 0);
            border-bottom: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            color: #fff;
            margin-top: 10px;
            margin-left: 290px;
        }

        .message {
            width: 380px;
            height: 100px;
            border: none;
            background: rgba(0, 0, 0, 0);
            border-bottom: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            color: #fff;
            margin-top: 10px;
            margin-left: 290px;
        }
        .mailLabel {
            position: absolute;
            margin-top:120px;
             font-family: 'abel', sans-serif;
            font-size: 16px;
            left: 290px;
            color: red;
           

        }

        ::-webkit-input-placeholder {
            color: #fff;
            font-size: 16px;
            letter-spacing: 5px;
            padding: 10px;
        }

        .con-btn {
            height: 35px;
            width: 80px;
            margin-top: 30px;
            margin-left: 592px;
            background: #0078ff;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
        }

            .con-btn:hover {
                background: #00ced1;
            }

        .img-stock {
            width: 40px;
            height: 40px;
            margin-right: 25px;
            position: absolute;
        }

        .arrow-up {
            width: 0;
            height: 0;
            position: absolute;
            border-left: 20px solid transparent;
            border-right: 20px solid transparent;
            border-bottom: 20px solid #959CA2;
            margin-left: 1150px;
            top: 60px;
            display: none;
        }

        .login-form {
            position: absolute;
            width: 300px;
            height: auto;
            background: #fff;
            right: 90px;
            top: 70px;
            border-radius: 6px;
            border-bottom: 5px solid blue;
            display: none;
            background: url("/images/login.jpg") 25% 50%;
        }

        .log-form {
            width: 250px;
            margin: 25px auto;
            font-size: 16px;
            font-family: 'Abel', sans-serif;
            color: black;
            letter-spacing: .1em;
        }

        .useremail {
            width: 250px;
            height: 30px;
            border: none;
            background: rgba(0, 0, 0, 0);
            border-bottom: 1px solid #fff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            color: #fff;
            margin-top: 5px;
        }

        .pass {
            width: 250px;
            height: 30px;
            border: none;
            background: rgba(0, 0, 0, 0);
            border-bottom: 1px solid #fff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            color: #fff;
            margin-top: 5px;
        }

        .log {
            height: 40px;
            width: 100%;
            margin-top: 10px;
            font-family: 'abel', sans-serif;
            background: #0000cd;
            color: #fff;
            border: none;
            outline: none;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            letter-spacing: 0.35em;
            cursor: pointer;
            margin-top: 10px;
        }

            .log:hover {
                background: #0078ff;
            }

        .errorlabel {
            margin-top: 10px;
        }

        .forgot {
            margin-top: 50px;
            text-decoration: none;
            margin-left: 60px;
            margin-bottom: 20px;
        }
    </style>




    <link href="style.css" type="text/css" rel="stylesheet">
    <script src="../javascript/jquery-3.2.1.js"></script>
    <script src="http://code.jquery.com/jquery-3.2.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var arrow = $(".arrow-up");
            var form = $(".login-form");
            var status = false;
            $("#loginNavButton").click(function (event) {
                event.preventDefault();
                if (status == false) {
                    arrow.fadeIn(1000);
                    form.fadeIn(1000);
                    status = true;
                } else {
                    arrow.fadeOut(1000);
                    form.fadeOut(1000);
                    status = false;
                }

            })

        })

    </script>
    <script type="text/javascript">
        $(window).on('scroll', function () {
            if ($(window).scrollTop()) {
                $('nav').addClass('black');


            } else {
                $('nav').removeClass('black');
            }
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sect sectOne">
            <%--    <div class="bw-gradient">
            </div>--%>
            <div class="header" id="home">
                <nav>
                    <img class="img-stock" src="/images/stock.png" />
                    <div><a href="/UI/IndexUI.aspx" class="logo">Stock Management</a></div>
                    <ul>
                        <li><a href="#home" target="_new">Home</a></li>
                        <li><a href="#about" target="_new2">About</a></li>
                        <li><a href="#products" target="_new3">Products</a></li>
                        <li><a href="#team" target="_new4">Team</a></li>
                        <li><a href="#contact" target="_new5">Contact Us</a></li>
                        <li><a href="#" target="_new6" id="loginNavButton" class="active">Log In</a></li>

                    </ul>
                    <div class="arrow-up"></div>
                    <div class="login-form">
                        <div class="log-form">
                            <div class="userName">
                                <asp:TextBox ID="emailIdTextBox" class="useremail" runat="server" placeholder="Enter E-Mail" TextMode="Email" ToolTip="Please enter a email address"></asp:TextBox>
                            </div>
                            <div class="password">
                                <asp:TextBox ID="passwordLogTextBox" runat="server" class="pass" placeholder="Enter Password" TextMode="Password" ToolTip="Please enter a password"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Button ID="submitButton" runat="server" class="log" Text="Login" OnClick="submitButton_Click" Width="100%" Height="35px" ToolTip="Click login" />
                              </div>
                            <div class="errorlabel">
                                <asp:Label ID="errorLabelMessage" runat="server" Text="" ForeColor="Red" Visible="True"></asp:Label>
                            </div>


                            <div class="forgot">
                                <asp:LinkButton ID="forgotPasswordLabel" class="forgotpass" Style="color: #fff;" runat="server" href="/UI/ForgotPasswordUI.aspx" target="_blank" ToolTip="Reset password">Forgot Password?</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="h-para">
                <h1 class="brand-quotoOne">Try something new.</h1>
               
                <p class="para"><br/>
                    We collect the most attractive and best product.Stationary,Cosmetics,Elcetronics,Kitchen<br />
                    item and others products we have.
                And we always try<br />
                    to give our best product.
                </p>
            </div>

        </div>
        <div class="subSection" id="about"></div>


        <div class="sect sectTwo">

            <h1 class="about1">About us!</h1>
            <h2 class="about2">We try to give our best services to you.</h2>
            <b class="para1">Name:</b>
            <p class="para2">SHF Super Shop.</p>
            <b class="para3">Location:</b>
            <p class="para4">
                Outlet-1:Central Plaza(1st floor),Gec Circle,Chittagong.<br />
                Outlet-2:Akhtaruzzaman Centre(4th floor),Agrabad,Chittagong.     
            <br />
                Outlet-3:Bohaddarhat Circle,Chandgaon,Chittagong.
            </p>
            <b class="para5">Email:</b>
            <p class="para6">
                Shf@gmail.com. 
            </p>
            </p>
        <b class="para7">Contact:</b>
            <p class="para8">
                01685-685506,01703180319. 
            </p>
        </div>

        <div class="subSection" id="products"></div>
        <div class="sect sectThree">
            <div class="sectThreecon">
                <div class="imagecos">
                    <img class="img-cosmetic" src="/images/cosmetics.jpg" alt="Cosmetics">
                    <b class="cosmetics">Cosmetics</b>
                </div>
                <div class="imagestat">
                    <img class="img-stat" src="/images/stationary.jpg" alt="Cosmetics">
                    <b class="stationary">Stationary</b>
                </div>
                <div class="imageelec">
                    <img class="img-elec" src="/images/electronics.jpg" alt="Cosmetics">
                    <b class="electronics">Electronics</b>
                </div>
                <div class="imagekitch">
                    <img class="img-kitch" src="/images/kitchen.jpg" alt="Cosmetics">
                    <b class="kitchen">Kitchen</b>
                </div>
            </div>
        </div>

        <div class="subSection" id="team"></div>
        <div class="sect sectfour">
            <div class="sect fourcon">
                <div class="imageshf">
                    <img class="img-shf" src="/images/shf.jpg" alt="Cosmetics">
                    <b class="shf">Mohammad Sakib Hossain</b><br />
                    <b class="coursejob">B.Sc. in CSE</b>

                    <br />
                    <b class="varsitySak">Port City International University.</b>
                </div>
                <div class="imagefah">
                    <img class="img-fah" src="/images/fahad.jpg" alt="Cosmetics">
                    <b class="fah">Fahad Bin Chowdhary</b><br />
                    <b class="coursefah">B.Sc. in CSE</b>

                    <br />
                    <b class="varsityfah">International Islamic University Chittagong.</b>
                </div>
                <div class="imagejob">
                    <img class="img-job" src="/images/jobair.jpg" alt="Cosmetics">
                    <b class="job">Mohammad Jobairul Islam</b><br />
                    <b class="coursejob">B.Sc. in CSE</b>

                    <br />
                    <b class="varsityjob">Port City International University.</b>

                </div>

            </div>
        </div>

        <div class="subSection" id="contact"></div>
        <div class="sect sectfive">
            <div class="sect fivecon">
                <div class="contactus">
                    <b class="cont">Contact Us</b><br />
                    <asp:TextBox ID="nameTextBox" class="name" runat="server" placeholder="Name" ToolTip="Please enter your name"></asp:TextBox>
                    <asp:TextBox ID="emailTextBox" class="email" runat="server" placeholder="E-Mail ID" ToolTip="Please enter your email address"></asp:TextBox>
                    <asp:TextBox ID="subjectTextBox" class="subject" runat="server" placeholder="Subject" ToolTip="Please enter a subject"></asp:TextBox>
                    <asp:TextBox ID="messageTextBox" Class="message" runat="server" placeholder="Your message" TextMode="MultiLine" ToolTip="Please enter your message"></asp:TextBox>
                    <asp:Label ID="mailLabel" class="mailLabel" runat="server"></asp:Label>
<asp:Button ID="sendMessageButton" class="con-btn" runat="server" Text="Send" OnClick="sendMessageButton_Click1" ToolTip="Send message" />
                    <br />
                    
                    <asp:Label ID="lbltest" runat="server" Text="Label"></asp:Label>
                </div>


            </div>
        </div>


        <script type="text/javascript">
            $('a[href*="#"]')
                .not('[href="#"]')
                .not('[href="#0"]')
                .click(function (event) {
                    if (
                        location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
                            &&
                            location.hostname == this.hostname
                    ) {
                        var target = $(this.hash);
                        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                        if (target.length) {
                            event.preventDefault();
                            $('html, body').animate({
                                scrollTop: target.offset().top
                            }, 1000, function () {
                                var $target = $(target);
                                $target.focus();
                                if ($target.is(":focus")) {
                                    return false;
                                } else {
                                    $target.attr('tabindex', '-1');
                                    $target.focus();
                                };
                            });
                        }
                    }
                });
        </script>


    </form>
</body>
</html>
