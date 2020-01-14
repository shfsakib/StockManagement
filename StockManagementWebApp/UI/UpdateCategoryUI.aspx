<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCategoryUI.aspx.cs" Inherits="StockManagementWebApp.UI.UpdateCatagoryUI" EnableEventValidation="false" ValidateRequest="false" %>

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

        html, body {
            height: 100%;
            background-size: 100% 100%;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background: url("/images/catagoryback.jpg");
        }

        .one {
            height: 100%;
        }

        .container {
            height: 100%;
        }

        .name-div {
            width: 100px;
            height: 40px;
            position: absolute;
            left: 470px;
            top: 140px;
        }

        .name-label {
            font-family: 'Abel', sans-serif;
            font-size: 20px;
            color: #fff;
        }

        .text-div {
            position: absolute;
            top: 125px;
            left: 240px;
            width: 310px;
            margin-top: 10px;
            margin-left: 290px;
        }

        .textbox {
            width: 300px;
            height: 35px;
            border: none;
            color: #fff;
            padding-left: 5px;
            background: rgba(0, 0, 0, 0);
            border: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
        }

        .save-div {
            height: 40px;
            width: 90px;
            position: absolute;
            top: 155px;
            left: 165px;
            margin-top: 30px;
            margin-left: 592px;
        }

        .save-btn {
            height: 35px;
            width: 80px;
            background: #0078ff;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
        }

            .save-btn:hover {
                background: cyan;
            }

        .back-div {
            height: 40px;
            width: 90px;
            position: absolute;
            top: 155px;
            left: 115px;
            margin-top: 30px;
            margin-left: 552px;
        }

        .back-btn {
            height: 35px;
            width: 80px;
            background: green;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            position: absolute;
        }

            .back-btn:hover {
                background: greenyellow;
            }

        ::-webkit-input-placeholder {
            color: #fff;
            font-size: 16px;
            letter-spacing: 5px;
            padding: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="one">
            <div class="container">
                <div class="name-div">
                    <asp:Label class="name-label" runat="server" Text="Name : "></asp:Label>
                    <asp:HiddenField ID="idHiddentField" runat="server" />
                </div>

                <div class="text-div">
                    <asp:TextBox ID="catagoryNameTextBox" class="textbox" runat="server" placeHolder="Catagory Name" ToolTip="Please enter new category name"></asp:TextBox>

                </div>
                <div class="save-div">
                    <asp:Button ID="updateButton" class="save-btn" runat="server" Text="Update" OnClick="updateButton_OnClick" ToolTip="Update category name" />

                </div>
                <div class="back-div">
                    <asp:Button ID="backButton" class="back-btn" runat="server" Text="Back" OnClick="backButton_OnClick" ToolTip="Back to category page" />

                </div>
            </div>
        </div>
    </form>
</body>
</html>
