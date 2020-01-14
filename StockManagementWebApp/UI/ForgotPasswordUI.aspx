<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPasswordUI.aspx.cs" Inherits="StockManagementWebApp.UI.ForgotPassword" EnableEventValidation="false" ValidateRequest="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Shortcut icon" href="/images/icon.ico" type="image/x-icon" />

    <title>Forgot Password</title>
    <style>
        label.error {
            color: red;
        }
         * {
             margin: 0;
             padding: 0;
         }

        html, body {
            height: 100%;
        }


        .container {
            width: 100%;
            height: 100%;
            position: absolute;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-image: url("/images/forgotpass.jpg");
        }

        .header {
            width: 500px;
            height: 600px;
            position: absolute;
            margin-right: 430px;
            right: 0;
            top: 40px;
        }

        .head-for {
            font-family: 'comic sans ms', sans-serif;
            font-size: 35px;
            color: #fff;
            padding-left: 104px;
            position: absolute;
            padding-top: 20px;
        }

        ::-webkit-input-placeholder {
            color: #fff;
            font-size: 16px;
            letter-spacing: 5px;
            padding: 10px;
        }

        .email-div {
            padding-left: 110px;
            position: absolute;
            padding-top: 130px;
        }

        .email {
            width: 300px;
            height: 35px;
            padding-left: 2px;
            color: #fff;
            position: absolute;
            border: none;
            background: rgba(0, 0, 0, 0);
            border-bottom: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            top: 125px;
            left: 92px;
        }

        .newpass-div {
            padding-left: 90px;
            position: absolute;
            padding-top: 100px;
        }

        .new-Pass {
            width: 300px;
            padding-left: 2px;
            height: 35px;
            position: absolute;
            color: #fff;
            background: rgba(0, 0, 0, 0);
            border-bottom: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            top: 175px;
            left: 90px;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
        }

        .confirmpass-div {
            padding-left: 90px;
            position: absolute;
            padding-top: 90px;
        }

        .confirm-Pass {
            padding-left: 2px;
            width: 300px;
            height: 35px;
            position: absolute;
            color: #fff;
            border-bottom: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            top: 223px;
            left: 90px;
            background: rgba(0, 0, 0, 0);
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
        }
        .match {
            width: 300px;
            position: absolute;
            bottom: 345px;
            margin-left: 395px;
        }
        .mismatch {
            position: relative;
        }
       
        .secques-div {
            padding-left: 90px;
            position: absolute;
            padding-top: 90px;
        }

        .ques-list {
            width: 305px;
            height: 35px;
            position: absolute;
            padding-left: 7px;
            color: #fff;
            border-bottom: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            top: 275px;
            letter-spacing: 0.2em;
        }

        .ans-div {
            padding-left: 90px;
            position: absolute;
            padding-top: 90px;
        }

        .ans {
            width: 300px;
            height: 35px;
            padding-left: 2px;
            position: absolute;
            color: #fff;
            background: rgba(0, 0, 0, 0);
            border: none;
            border-bottom: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            top: 318px;
        }
        .btn-div {
            width: 100%;
            height: 50px;
            position: relative;
            top: 375px;
        }
        .btn-change {
            position: absolute;
            height: 35px;
            width: 120px;
            right: 106px;
            background: #0078ff;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-family: 'Abel', sans-serif;
            letter-spacing: .2em;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
        }
        .btn-change:hover {
            background: cyan;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="bw-gradient">
            </div>
            <div class="header" id="forgot">
                <b class="head-for">Forgot Password</b>
                <div class="email-div">
                    <asp:TextBox ID="emailTextBox" name="emailTextBox" class="email" runat="server" placeHolder="E-Mail ID" ToolTip="Please enter a email address"></asp:TextBox>
                </div>
                <div class="newpass-div">
                    <asp:TextBox ID="newPasswordTextBox" name="newPasswordTextBox" class="new-Pass" runat="server" placeHolder="New Password" ToolTip="Please enter new password"></asp:TextBox>
                </div>
                <div class="confirmpass-div">
                    <asp:TextBox ID="confirmPasswordTextBox" name="confirmPasswordTextBox" class="confirm-Pass" runat="server" placeHolder="Confirm Password" ToolTip="Please enter confirm password"></asp:TextBox>
                </div>

                <div class="match">
                    <asp:Label ID="mismatchLabel" class="mismatch" runat="server" Text="" ForeColor="Red" Font-Size="16" Font-Names="abel"></asp:Label>
                </div>
                <div class="secques-div">
                    <asp:DropDownList ID="securityQuestionList" name="securityQuestionList" class="ques-list" runat="server" ForeColor="Black" ToolTip="Please select a question">
                        <asp:ListItem>Select a Question</asp:ListItem>
                        <asp:ListItem>What is your nickname?</asp:ListItem>
                        <asp:ListItem>What is your pet name?</asp:ListItem>
                        <asp:ListItem>What is favourite teacher name?</asp:ListItem>
                        <asp:ListItem>What is your best friend name?</asp:ListItem>
                        <asp:ListItem>Where do you live?</asp:ListItem>
                        <asp:ListItem>What is your favourite place?</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="ans-div">
                    <asp:TextBox ID="answerTextBox" name="answerTextBox" class="ans" runat="server" placeHolder="Answer" ToolTip="Please enter a answer"></asp:TextBox>
                </div>
               
                           
                  <div class="btn-div">
                      <asp:Button ID="changeButton" class="btn-change" runat="server" Text="Change" OnClick="changeButton_Click" ToolTip="Change password" />
                </div>
                 
            </div>
        </div>
    </form>
    <%--<script src="../javascript/Jquery_3.1.1.js"></script>
    <script src="../Scripts/jquery.validate.js"></script>
    <script>
        $("#signupForm").validate({
            rules: {
               
                answerTextBox: "required",
               
                newPasswordTextBox: {
                    required: true,
                    minlength: 5
                },
                confirmPasswordTextBox: {
                    required: true,
                    minlength: 5,
                    equalTo: "#newPasswordTextBox"
                },
                emailTextBox: {
                    required: true,
                    email: true
                },
                securityQuestionList:{
                    required:true
                    
            }
               
            },
            messages: {
                answerTextBox: "Please enter an answer",
               
               
                newPasswordTextBox: {
                    required: "Please provide a password",
                    minlength: "Your password must be at least 5 characters long"
                },
                confirmPasswordTextBox: {
                    required: "Please provide a password",
                    minlength: "Your password must be at least 5 characters long",
                    equalTo: "Please enter the same password as above"
                },
                emailTextBox: "Please enter a valid email address",
               
                securityQuestionList: "Please select at a question"
            }
        });

    </script>--%>
</body>
</html>
