<%@ Page Title="" Language="C#" MasterPageFile="~/UI/AfterLogIn.Master" AutoEventWireup="true" CodeBehind="CategoryInformationUI.aspx.cs" Inherits="StockManagementWebApp.UI.CatagoryEntry" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
   
     <style>
         * {
            padding: 0;
             margin-left: 0;
             margin-right: 0;
             margin-top: 0;
         }

        html, body {
            height: 100%;
          
            background-repeat: no-repeat;
           
            background-size: cover;
             background: url("/images/catagoryback.jpg");
        }

        .one {
            height: 100%;
            
            bottom: 0;
        }

        .container {
            height: 100%;
           
        }

        .name-div {
            width: 100px;
            height: 40px;
            position: absolute;
            left: 450px;
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

        ::-webkit-input-placeholder {
            color: #fff;
            font-size: 16px;
            letter-spacing: 5px;
            padding: 10px;
        }

        .grid-div {
            margin-top: 260px;
            margin-left: 350px;
            position: absolute;
            width: 650px;
            height: 370px;
            overflow: auto;
        }

        .grid {
            font-family: 'Abel', sans-serif;
            font-size: 18px;
        }

        .id-cls {
            width: 100px;
            height: 50px;
            position: absolute;
        }

        .update {
            height: 40px;
            width: 30px;
            background-repeat: no-repeat;
            background-image: url("/images/update.png");
            background-size: 28px 25px;
            border: 1px solid black;
           
          
            
            border-radius: 3px;
            font-size: 14px;
           
            text-align: center;
        }
        .update:hover {
           border-color: cornflowerblue;
        }
       .label-error {
           width:250px;
           height: 25px;
           top: 200px;
           left: 533px;
           position: absolute;
       }
       .id-cls {
           width: 100px;
           height: 50px;
       }
    </style>
    <html>
        <body>
    <div class="one">
        <div class="container">

            <div class="name-div">
                <asp:Label class="name-label" runat="server" Text="Name : "></asp:Label>

            </div>
            <div class="id-cls">
                <asp:Label ID="idLabel" runat="server" Text=""></asp:Label>

            </div>
            <div class="text-div">
                <asp:TextBox ID="categoryNameTextBox" class="textbox" runat="server" placeHolder="Category Name"  ToolTip="Please enter a category name" OnTextChanged="categoryNameTextBox_TextChanged"></asp:TextBox>

            </div>
            <div class="save-div">
                <asp:Button ID="saveButton" class="save-btn" runat="server" Text="Save" OnClick="saveButton_Click" ToolTip="Save category name" />

            </div>
             <div class="label-error">
                <asp:Label ID="categoryErrorLabel" class="error-label" runat="server" Text="" style="font-family: 'Abel', sans-serif; font-size: 16px;" ForeColor="Red"></asp:Label>
              
            </div>
            <div class="grid-div">
                <asp:GridView ID="categoryGridView" class="grid" runat="server" AutoGenerateColumns="False" CellPadding="3" Width="100%" BorderStyle="None" BackColor="White" BorderColor="#CCCCCC" BorderWidth="0px" HorizontalAlign="Left" ShowHeaderWhenEmpty="True" Height="100%">
                    <AlternatingRowStyle BorderStyle="None" />
                    <Columns>
                        <asp:TemplateField HeaderText="Serial">
                            <ItemTemplate>
                                <asp:Label id="slLabel" runat="server" Text='<%#Container.DataItemIndex + 1 %>'></asp:Label>
                                <asp:HiddenField id="idHiddenField" runat="server" Value='<%#Eval("SL") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Catagory Name">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("CATEGORYName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="In Time">
                            <ItemTemplate>
                                <asp:Label runat="server" Text=' <%#Eval("INTIME") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="updateButton"  runat="server" OnClick="updateButton_OnClick">Update</asp:LinkButton>
                                <%--<asp:LinkButton ID="deleteButton"  runat="server" OnClick="deleteButton_OnClick">Delete</asp:LinkButton>--%>

                                <%--<asp:Button ID="updateButton" class="update" runat="server" OnClick="updateButton_OnClick" Text="" />
                          --%>  </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Font-Names="abel" Font-Size="16pt" Height="18px" HorizontalAlign="Center" VerticalAlign="Middle" Width="480px" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" BorderStyle="None" HorizontalAlign="Center" VerticalAlign="Top" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>

            </div>
        </div>
    </div>
      </body>
        </html>
</asp:Content>
