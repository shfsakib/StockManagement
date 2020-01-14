<%@ Page Title="" Language="C#" MasterPageFile="~/UI/AfterLogIn.Master" AutoEventWireup="true" CodeBehind="ItemSetupUI.aspx.cs" Inherits="StockManagementWebApp.UI.ItemSetupUI" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
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
            background-image: url("/images/itemUI.jpg");
        }

        .one {
            height: 100%;
            margin-bottom: 0;
        }

        .container {
            height: 100%;
        }

        .catagory-div {
            width: 200px;
            height: 30px;
            position: absolute;
            margin-left: 410px;
            margin-top: 125px;
        }

        .catagory-lbl {
            font-family: 'Abel', sans-serif;
            font-size: 20px;
            position: absolute;
            color: #fff;
            top: 0px;
            left: 0px;
        }

        .catagorytxt-div {
            width: 200px;
            height: 30px;
            position: absolute;
            margin-left: 550px;
            top: 125px;
        }

        .catagory-txt {
            width: 312px;
            height: 35px;
            border: none;
            position: absolute;
            color: #000;
            padding-left: 5px;
            border: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            top: 0px;
            left: 0px;
        }

        .company-div {
            width: 180px;
            height: 30px;
            position: absolute;
            margin-left: 410px;
            top: 180px;
        }

        .company-lbl {
            font-family: 'Abel', sans-serif;
            font-size: 20px;
            position: absolute;
            color: #fff;
            top: 0px;
            left: 0px;
        }

        .companytxt-div {
            width: 200px;
            height: 30px;
            position: relative;
            margin-left: 550px;
            top: 175px;
        }

        .company-txt {
            width: 312px;
            height: 35px;
            border: none;
            position: relative;
            color: #000;
            padding-left: 5px;
            border: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
        }

        .item-div {
            width: 200px;
            height: 30px;
            position: relative;
            margin-left: 410px;
            top: 200px;
        }

        .item-lbl {
            font-family: 'Abel', sans-serif;
            font-size: 20px;
            position: absolute;
            color: #fff;
        }

        .itemtxt-div {
            width: 200px;
            height: 30px;
            position: absolute;
            margin-left: 550px;
            top: 225px;
        }

        .item-txt {
            width: 300px;
            height: 35px;
            border: none;
            position: relative;
            color: #fff;
            padding-left: 10px;
            background: rgba(0, 0, 0, 0);
            border: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
        }

        .reorder-div {
            width: 200px;
            height: 30px;
            position: absolute;
            margin-left: 410px;
            top: 280px;
        }

        .reorder-lbl {
            font-family: 'Abel', sans-serif;
            font-size: 20px;
            position: absolute;
            color: #fff;
        }

        .reordertxt-div {
            width: 200px;
            height: 30px;
            position: absolute;
            margin-left: 550px;
            top: 275px;
        }

        .reorder-txt {
            width: 300px;
            height: 35px;
            border: none;
            position: relative;
            color: #fff;
            padding-left: 10px;
            background: rgba(0, 0, 0, 0);
            border: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
        }

        .save-div {
            width: 200px;
            height: 30px;
            position: absolute;
            margin-left: 738px;
            top: 320px;
        }

        .save-btn {
            position: relative;
            height: 35px;
            width: 120px;
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

        ::-webkit-input-placeholder {
            color: #fff;
            font-size: 16px;
            letter-spacing: 5px;
            padding: 10px;
        }

        .label-div {
            width: 450px;
            height: 35px;
            position: absolute;
            margin-left: 550px;
            margin-top: 310px;
        }

        .label-error {
            font-family: 'Abel', sans-serif;
            font-size: 18px;
            color: red;
        }

        .reordererror-div {
            width: 450px;
            height: 35px;
            position: absolute;
            margin-left: 550px;
            margin-top: 330px;
        }

        .order-error {
            font-family: 'Abel', sans-serif;
            font-size: 18px;
            color: red;
            margin-top: 20px;
        }
    </style>
    <html>
    <body>
        <div class="one">

            <div class="container">
                <div class="catagory-div">
                    <asp:Label ID="Label2" class="catagory-lbl" runat="server" Text="Category :"></asp:Label>

                </div>
                <div class="catagorytxt-div">
                    <asp:DropDownList ID="categoryDropDownList" class="catagory-txt" runat="server" DataTextField="-Select a Catagory-" ToolTip="Please select a category" OnSelectedIndexChanged="categoryDropDownList_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="company-div">
                    <asp:Label ID="Label3" class="company-lbl" runat="server" Text="Company :"></asp:Label>

                </div>
                <div class="companytxt-div">
                    <asp:DropDownList ID="companyDropDownList" class="company-txt" runat="server" ToolTip="Please select a company"></asp:DropDownList>
                </div>
                <div class="item-div">
                    <asp:Label ID="Label4" class="item-lbl" runat="server" Text="Item Name :"></asp:Label>

                </div>
                <div class="itemtxt-div">
                    <asp:TextBox ID="itemNameTextBox" class="item-txt" placeHolder="Item Name" runat="server" ToolTip="Please enter a item name"></asp:TextBox>

                </div>
                <div class="reorder-div">
                    <asp:Label ID="Label1" class="reorder-lbl" runat="server" Text="Reorder Level :"></asp:Label>

                </div>
                <div class="reordertxt-div">
                    <asp:TextBox ID="reorderTextBox" class="reorder-txt" placeHolder="Reorder Level" runat="server" TextMode="Number" ToolTip="Reorder level"></asp:TextBox>
                </div>
                <div class="save-div">
                    <asp:Button ID="saveButton" class="save-btn" runat="server" Text="Save" OnClick="saveButton_OnClick" ToolTip="Save item" />
                </div>
                <div class="label-div">
                    <asp:Label ID="errorLabel" class="label-error" runat="server" Text=""></asp:Label>
                </div>
                <div class="reordererror-div">
                    <asp:Label ID="reorderErrorLabel" class="order-error" runat="server" Text=""></asp:Label>

                </div>
            </div>
        </div>
    </body>
    </html>

</asp:Content>
