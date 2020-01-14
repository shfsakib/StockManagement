<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCompanyUI.aspx.cs" Inherits="StockManagementWebApp.UI.UpdateCompanyUI" EnableEventValidation="false" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Shortcut icon" href="/images/icon.ico" type="image/x-icon" />
    
    <title>Stock Management</title>
    <style>
         * {
            margin: 0;
            padding: 0;
        }
         html,body {
             height: 100%;
              background: no-repeat;
            background-image: url("/images/companyback.jpg");
         }
        .one {
           
            height:  100%;
            margin-bottom: 0;
        }

        .container {
           
            height: 100%;
           
        }

        .tools {
            width: 1100px;
            height: 550px;
            position: absolute;
            margin-left: 120px;
            top: 90px;
            left: 0px;
        }

        .name-label {
            font-family: 'Abel', sans-serif;
            font-size: 20px;
            position: absolute;
            color: #fff;
            margin-left: 470px;
            margin-top: 100px;
            top: 0px;
            left: 0px;
        }

        .textbox {
            width: 280px;
            height: 32px;
            border: none;
            color: #fff;
            border: none;
            position: absolute;
            padding-left: 5px;
            background: rgba(0, 0, 0, 0);
            border: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            margin-top: 95px;
            margin-left: 540px;
        }

        ::-webkit-input-placeholder {
            color: #fff;
            font-size: 16px;
            letter-spacing: 5px;
            padding: 10px;
        }

        .grid {
            background-color: gray;
        }

        .save-btn {
            position: absolute;
            height: 35px;
            width: 120px;
            top: 140px;
            left: 710px;
            background: #0078ff;
            color: #fff;
            border: none;
            border: 1px solid black;
            border-radius: 6px;
            font-family: 'Abel', sans-serif;
            letter-spacing: .2em;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
        }
        .save-btn:hover {
            background: cyan;
            
        }
        .back-btn {
             position: absolute;
            height: 35px;
            width: 100px;
            top: 140px;
            left: 600px;
            background: green;
            color: #fff;
            border: none;
            border: 1px solid black;
            border-radius: 6px;
            font-family: 'Abel', sans-serif;
            letter-spacing: .2em;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
        }
       .back-btn:hover {
           background: greenyellow;
       }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="one">

            <div class="container">
                <div class="tools">
                    <asp:HiddenField ID="idHiddenField" runat="server" />
                </div><asp:Label class="name-label" runat="server" Text="Name : "></asp:Label>
                <asp:TextBox ID="companyNameTextBox" class="textbox" runat="server" placeHolder="Company Name" ToolTip="Please enter company name"></asp:TextBox>
                <asp:Button ID="updateButton" class="save-btn" runat="server" Text="Update" OnClick="updateButton_OnClick" ToolTip="Update company name" />
           
                <asp:Button ID="backButton" class="back-btn" runat="server" Text="Back" OnClick="backButton_OnClick" ToolTip="Back to comapny page" />
                    
             
            </div>
        </div>
    </form>
</body>
</html>
