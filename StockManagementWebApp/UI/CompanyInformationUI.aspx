<%@ Page Title="" Language="C#" MasterPageFile="~/UI/AfterLogIn.Master" AutoEventWireup="true" CodeBehind="CompanyInformationUI.aspx.cs" Inherits="StockManagementWebApp.UI.CompanyInformation" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            height: 100%;
             background: no-repeat;
             background-size: 100% 100%;
            background-image: url("/images/companyback.jpg");
        }

        .one {
            
            height: 100%;
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
            margin-left: 330px;
            margin-top: 30px;
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
            margin-top: 27px;
            margin-left: 410px;
            top: 0px;
            left: 0px;
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
            width: 100px;
            top: 70px;
            left: 598px;
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

        .grid-div {
            margin-top: 130px;
            margin-left: 230px;
            position: absolute;
            width: 650px;
            height: 410px;
            overflow: auto;
        }

        .grid {
            position: relative;
            font-family: 'Abel', sans-serif;
            font-size: 18px;
        }

        .id-cls {
            width: 100px;
            height: 50px;
            position: absolute;
        }

        .update {
            height: 30px;
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

        .error-label {
            position: absolute;
            margin-top: 100px;
            margin-left: 410px;
        }
    </style>
    <html>
        <body>
    <div class="one">

        <div class="container">
            <div class="tools">
                <div class="id-cls">
                    <asp:Label ID="idLabel" runat="server" Text=""></asp:Label>

                </div>
                <asp:Label class="name-label" runat="server" Text="Name : "></asp:Label>
                <asp:HiddenField ID="idHiddenField" runat="server" Value='<%#Eval("SL") %>' />

                <asp:TextBox ID="companyNameTextBox" class="textbox" runat="server" placeHolder="Company Name" ToolTip="Please enter a company name" OnTextChanged="companyNameTextBox_TextChanged"></asp:TextBox>
                <asp:Label ID="companyErrorLabel" class="error-label" runat="server" Text="" ForeColor="Red" Style="font-family: 'Abel', sans-serif; font-size: 16px;"></asp:Label>
                <asp:Button ID="saveButton" class="save-btn" runat="server" Text="Save" OnClick="saveButton_Click" ToolTip="Save company name" />
                <div class="grid-div">
                    <asp:GridView ID="companyGridView" class="grid" runat="server" AutoGenerateColumns="False" CellPadding="3" Width="100%" BorderStyle="None" BackColor="White" BorderColor="#CCCCCC" BorderWidth="0px" HorizontalAlign="Left" ShowHeaderWhenEmpty="True" Height="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Serial">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Container.DataItemIndex + 1 %>'></asp:Label>
                                    <asp:HiddenField ID="idHiddenField" runat="server" Value='<%#Eval("SL") %>' />

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Company Name">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("COMPANYName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="In Time">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text=' <%#Eval("INTIME") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="updateLinkButton" runat="server" OnClick="updateLinkButton_OnClick">Update</asp:LinkButton>
                                <%--<asp:LinkButton ID="deleteButton"  runat="server" OnClick="deleteButton_OnClick">Delete</asp:LinkButton>--%>

                                </ItemTemplate>
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
    </div>
            </body>
        </html>
</asp:Content>
