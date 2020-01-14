<%@ Page Title="" Language="C#" MasterPageFile="~/UI/AfterLogIn.Master" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="StockManagementWebApp.UI.StockInUI" EnableEventValidation="false" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
 
         <style>
        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            height: 100%;
           
             background-repeat: no-repeat;
             background-size: 100% 100%;
           
            background-image: url("/images/StockIn.jpg");
        }

        .one {
            height: 100%;
        }

        .container {
            height: 100%;
        }
        .company-div {
            width: 300px;
            height: 30px;
            position: absolute;
          
            top: 135px;
            left: 410px;
        }
        .company-lbl {
            font-family: 'Abel', sans-serif;
            font-size: 20px;
            position: absolute;
            color: #fff;
                 top: 0px;
                 left: 0px;
             }
        .companyDrop-div {
            width: 300px;
            height: 30px;
            position: absolute;
         
            top: 132px;
            left: 600px;
        }
        .company-drop {
             width: 312px;
            height: 35px;
            border: none;
            position: relative;
            color: #000;
            padding-left: 5px;
            border: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
                 top: 0px;
                 left: 0px;
             }
      
        .item-div {
            width: 300px;
            height: 30px;
            position: absolute;
          
            top: 180px;
            left:410px;
        }
        .item-lbl {
            font-family: 'Abel', sans-serif;
            font-size: 20px;
            position: absolute;
            color: #fff;
        }
        .itemDrop-div{
            width: 300px;
            height: 30px;
            position: absolute;
           
            top: 175px;
            left: 600px;
        }
        .item-drop {
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
        .reorder-div {
            width: 300px;
            height: 30px;
            position: absolute;
           
            top: 225px;
            left:410px;
        }
        .reorder-lbl {
            font-family: 'Abel', sans-serif;
            font-size: 20px;
            position: absolute;
            color: #fff;
        }
        .reorderTxt-div{
            width: 120px;
            height: 30px;
            position: absolute;
         
            top: 220px;
            left: 600px;
        }
        /*.reorder-txt {
             width: 300px;
            height: 35px;
            border: none;
            position: relative;
            color: #000;
            
            padding-left: 10px;
            border: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
            
        }*/
         .available-div {
            width: 300px;
            height: 30px;
            position: absolute;
            top: 270px;
            left:410px;
        }
         .available-lbl {
             font-family: 'Abel', sans-serif;
            font-size: 20px;
            position: absolute;
            color: #fff;
         }
        .availableTxt-div{
            width: 300px;
            height: 30px;
            position: absolute;
            top: 265px;
            left: 600px;
        }
        /*.available-txt {
             width: 300px;
            height: 35px;
            border: none;
            position: relative;
            color: #000;
            padding-left: 10px;
            background: rgba(0, 0, 0, 0);
            border: 1px solid #0078ff;
            font-family: 'abel', sans-serif;
            font-size: 16px;
        }*/
        .stockIn-div {
            width: 300px;
            height: 30px;
            position: absolute;
            top:315px;
            left:410px;
        }
        .stockIn-lbl {
            font-family: 'Abel', sans-serif;
            font-size: 20px;
            position: absolute;
            color: #fff;
        }
        .stockInQuan-div{
            width: 300px;
            height: 30px;
            position: absolute;
            top: 310px;
            left: 600px;
        }
        .stockInQuan-txt {
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
        ::-webkit-input-placeholder {
            color: #fff;
            font-size: 16px;
            letter-spacing: 5px;
            padding: 10px;
        }
        .saveBtn-div {
            width: 120px;
            height: 30px;
            position: absolute;
            top: 360px;
            left: 792px;
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
          .error-div {
               width: 420px;
            height: 50px;
            position: absolute;
            top: 400px;
            left:600px;
          }
          .error-label {
              font-family: 'Abel', sans-serif;
            font-size: 18px;
            color: red;
          }
          .stock-label {
              margin-top: 30px;
              position: absolute;
          }
    </style>
    
    <html>
    <body>
        <div class="one">
            <div class="container">
                <div class="company-div">
                    <asp:Label ID="companyLabel" class="company-lbl" runat="server" Text="Company :"></asp:Label>
                </div>
                <div class="companyDrop-div">
                    <asp:DropDownList ID="companyDropDownList" class="company-drop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged" ToolTip="Please select a company"></asp:DropDownList>
                </div>
                <div class="item-div">
                    <asp:Label ID="itemLabel" class="item-lbl" runat="server" Text="Item :"></asp:Label>
                    
                </div>
                <div class="itemDrop-div">
                    <asp:DropDownList ID="itemDropDownList" class="item-drop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged" ToolTip="Please select a item"></asp:DropDownList>
                    
                </div>
                <div class="reorder-div">
                    <asp:Label ID="reorderLabel" class="reorder-lbl" runat="server" Text="Reorder Level :"></asp:Label>
                    
                </div>
                <div class="reorderTxt-div">
                    <asp:TextBox ID="reorderTextBox" class="reorder-txt"   runat="server" Enabled="False" Height="35px" Width="310px" Text="   Reorder Level" Font-Names="Abel" ForeColor="Black" Font-Size="18px" ToolTip="Reorder level"></asp:TextBox>
                </div>
                <div class="available-div">
                    <asp:Label ID="availableQuantityLabel" class="available-lbl" runat="server" Text="Available Quantity :"></asp:Label>
                    
                </div>
                <div class="availableTxt-div">
                    <asp:TextBox ID="availableQuantityTextBox" class="available-txt"  runat="server" Enabled="False" Height="35px" Width="310px" Text="   Available Quantity" ForeColor="Black" Font-Size="18px" Font-Names="Abel" ToolTip="Available quantity"></asp:TextBox>
                    
                </div>
                <div class="stockIn-div">
                    <asp:Label ID="stockInQuantityLabel" class="stockIn-lbl" runat="server" Text="Stock In Quantity :"></asp:Label>
                    
                </div>
                <div class="stockInQuan-div">
                    <asp:TextBox ID="stockInQuantityTextBox" class="stockInQuan-txt" placeHolder="Stock In Quantity" runat="server" TextMode="Number" ToolTip="Please enter stock in quantity"></asp:TextBox>
                    
                </div>
                <div class="saveBtn-div">
                    <asp:Button ID="saveButton" class="save-btn" runat="server" Text="Save" OnClick="saveButton_Click" ToolTip="Save stock" />
                </div>
                <div class="error-div">
                    <asp:Label ID="errorLabel" class="error-label" runat="server" Text=""></asp:Label>
                   <asp:Label ID="stockLabel" class="stock-label" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </body>
   </html>
  

</asp:Content>
