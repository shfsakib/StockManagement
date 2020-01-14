<%@ Page Title="" Language="C#" MasterPageFile="~/UI/AfterLogIn.Master" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementWebApp.UI.StockOutUI" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="contentHolder">


    <!DOCTYPE html>
    <html>

    <head>
        <link href="../Contents/Internal/NavStyle.css" rel="stylesheet" />
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
                background-image: url("/images/stockOut.jpg");
            }

            /*form {
                position: relative;
                padding: 160px 150px;
            }*/



            .sectFour {
                height: 100%;
                position: absolute;
                width: 100%;
                top: 60px;
                
            }
            .navdiv {
                top: 0;
            }


            .tbl-div {
                top: 60px;
                width: 100%;
                height: 1000px;
            }

            .font-1 {
                padding-left: 250px;
                padding-top: 50px;
            }

            .auto-style3 {
                height: 45px;
            }

            ::-webkit-input-placeholder {
                color: lime;
                font-size: 16px;
                letter-spacing: 5px;
                padding: 10px;
            }

            .auto-style4 {
                height: 44px;
            }

            .auto-style7 {
                height: 43px;
            }

            .auto-style8 {
                height: 46px;
            }

            .add-btn {
                margin-left: 170px;
                
                height: 35px;
                width: 140px;
                background: #0078ff;
                color: #fff;
                border: none;
                border: 1px solid black;
                border-radius: 6px;
                font-family: 'Abel';
                letter-spacing: .2em;
                font-size: 16px;
                font-weight: bold;
                text-align: center;
            }

                .add-btn:hover {
                    background: cyan;
                }

            .sell-btn {
                margin-left: 190px;
                height: 35px;
                width: 120px;
                background: green;
                color: #fff;
                border: none;
                border: 1px solid black;
                border-radius: 6px;
                font-family: 'Abel';
                letter-spacing: .2em;
                font-size: 16px;
                font-weight: bold;
                text-align: center;
            }

                .sell-btn:hover {
                    background: cyan;
                }

            .damage-btn {
                margin-left: 1px;
                
                height: 35px;
                width: 120px;
                background: red;
                color: #fff;
                border: none;
                border: 1px solid black;
                border-radius: 6px;
                font-family: 'Abel';
                letter-spacing: .2em;
                font-size: 16px;
                font-weight: bold;
                text-align: center;
            }

                .damage-btn:hover {
                    background: cyan;
                }

            .lost-btn {
                
                height: 35px;
                width: 120px;
                background: blue;
                color: #fff;
                border: none;
                border: 1px solid black;
                border-radius: 6px;
                font-family: 'Abel';
                letter-spacing: .2em;
                font-size: 16px;
                font-weight: bold;
                text-align: center;
            }

                .lost-btn:hover {
                    background: cyan;
                }

            .grid-div {
                width: 100%;
                height: 410px;
                overflow: auto;
            }

            .grid {
                width: 100%;
                height: 100%;
            }

            .error-label {
                font-family: 'Abel', sans-serif;
                font-size: 18px;
                color: red;
            }

            .auto-style10 {
                height: 45px;
                width: 115px;
            }

            .auto-style11 {
                height: 44px;
                width: 115px;
            }

            .auto-style12 {
                height: 43px;
                width: 115px;
            }

            .auto-style13 {
                height: 46px;
                width: 115px;
            }

            .auto-style14 {
            }

            .auto-style15 {
                width: 115px;
            }
            .auto-style16 {
                width: 115px;
                height: 42px;
            }
            .auto-style17 {
                height: 42px;
            }
        </style>


    </head>

    <body>
        <div class="sectFour">

            <form>
                <div class="navdiv" id="home">
                <nav>
                    <img class="img-stock" src="/images/stock.png" />
                    <div class="logo">Stock Management</div>
                    <ul>
                        <li><a href="/UI/CategoryInformationUI.aspx">Catagory</a></li>
                        <li><a href="/UI/CompanyInformationUI.aspx">Company</a></li>
                        <li><a href="/UI/ItemSetupUI.aspx">Items</a></li>
                        <li><a href="/UI/StockInUI.aspx">Stock In</a></li>
                        <li><a href="StockOutUI.aspx">Stock Out</a></li>
                        <li><a href="/UI/SearchAndViewItemSummaryUI.aspx">Item Summary</a></li>
                        <li><a href="/UI/ViewSalesUI.aspx">Sales Info</a></li>
                        
                        <li>
                            <asp:Button ID="signOutButton" class="active" runat="server" OnClick="signOutButton_OnClick" Text="Log Out" ToolTip="Sign out" />
                        </li>

                    </ul>

                </nav>
            </div>
                <div class="tbl-div">
                    <table class="font-1">
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Label ID="Label1" Style="font-family: 'Abel'; color: white; font-size: 20px;" runat="server" Text="Company Name :"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="companyDropDownList" Style="width: 310px; height: 35px; border: none;  color: #000; padding-left: 5px; border: 1px solid #0078ff; font-family: 'abel', sans-serif; font-size: 16px; top: 0px; left: -2px;" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CompanyDropDownList_SelectedIndexChanged" ToolTip="Please select a company" />

                            </td>
                            <td class="auto-style3">
                                <asp:Label ID="slLabel" class="error-label" runat="server" Text="Label" Visible="False"></asp:Label>

                            </td>
                            <td class="auto-style3"></td>
                        </tr>
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" Style="font-family: 'Abel'; color: white; font-size: 20px; margin-top: 20px;" runat="server" Text="Item :"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="auto-style4">
                                <asp:DropDownList ID="itemDropDownList" Style="width: 310px; height: 35px; border: none;  color: #000; padding-left: 5px; border: 1px solid #0078ff; font-family: 'abel', sans-serif; font-size: 16px; top: 0px; left: -2px;"
                                    runat="server" AutoPostBack="True" OnSelectedIndexChanged="ItemDropDownList_SelectedIndexChanged" ToolTip="Please select a item">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style4"></td>

                        </tr>
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style4">
                                <asp:Label ID="Label3" Style="font-family: 'Abel'; color: white; font-size: 20px; margin-top: 20px;" runat="server" Text="Reorder Level :"></asp:Label>
                                &nbsp;&nbsp;</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="reorderLevelTextBox" runat="server" Style="border: 1px solid #0078ff;" Enabled="False" Width="307px" Height="35px" placeHolder="Reorder Level" ToolTip="Reorder level"></asp:TextBox>
                            </td>
                            <td class="auto-style4"></td>
                            <td class="auto-style4"></td>

                        </tr>
                        <tr>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style7">
                                <asp:Label ID="Label4" Style="font-family: 'Abel'; color: white; font-size: 20px; margin-top: 20px;" runat="server" Text="Available Quantity :"></asp:Label>
                                &nbsp;&nbsp;</td>
                            <td class="auto-style7">
            
                                <asp:TextBox ID="availabelQuantityTextBox" runat="server" Style=" border: 1px solid #0078ff;" Enabled="False" Width="307px" Height="35px" placeHolder="Available Quantity" ToolTip="Available quantity"></asp:TextBox>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style13">&nbsp;</td>
                            <td class="auto-style8">
                                <asp:Label ID="Label5" Style="font-family: 'Abel'; color: white; font-size: 20px; margin-top: 20px;" runat="server" Text="Stock Out Quantity :"></asp:Label>
                                &nbsp;&nbsp;</td>
                            <td class="auto-style8">
            
                                <asp:TextBox ID="stockOutQuantityTextBox" runat="server" Style=" background: rgba(0, 0, 0, 0);width: 297px; height: 35px; border: none; color: #fff; padding-left: 10px; border: 1px solid #0078ff; font-family: 'abel', sans-serif; font-size: 16px; top: 0px; left: 0px;"
                                    placeHolder="Stock Out Quantity" TextMode="Number" ToolTip="Stock out quantity"></asp:TextBox>
                            </td>
                            <td class="auto-style8"></td>
                            <td class="auto-style8"></td>

                        </tr>
                        <tr>
                            <td class="auto-style15">&nbsp;</td>
                            <td></td>
                            <td>
                                <asp:Button ID="addButton" class="add-btn" runat="server" Text="Add to cart" OnClick="addButton_Click" ToolTip="Add to gridview" />
                            </td>
                            <td></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td class="auto-style15">&nbsp;</td>
                            <td></td>
                            <td>
                                <asp:Label ID="errorLabel" class="error-label" runat="server"></asp:Label>
                            </td>
                            <td></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td class="auto-style16"></td>
                            <td class="auto-style17"></td>
                            <td class="auto-style17">
                                <asp:Button ID="sellButton" class="sell-btn" runat="server" Text="Sell" OnClick="sellButton_Click" ToolTip="Sell all items from grid" />

                            </td>
                            <td class="auto-style17">
                                <asp:Button ID="damageButton" class="damage-btn" runat="server" Text="Damage" OnClick="damageButton_Click" ToolTip="Damage all items from grid" />

                                <asp:Button ID="lostButton" class="lost-btn" runat="server" Text="Lost" OnClick="lostButton_OnClick" ToolTip="Lost all items from grid" />

                            </td>
                            <td class="auto-style17"></td>

                        </tr>
                        <tr>
                            <td class="auto-style15">&nbsp;</td>
                            <td>
                                <asp:Label ID="Label6" Style="font-family: 'Abel'; color: white; font-size: 20px; margin-left: 90px;" runat="server" Text="Search : "></asp:Label>
                                </td>
                            <td>
                                <asp:TextBox ID="searchTextBox" runat="server" Style="width: 295px; height: 30px; border: none;  color: #fff;background: rgba(0,0,0,0); padding-left: 10px; border: 1px solid #0078ff; font-family: 'abel', sans-serif; font-size: 16px; top: 0px; left: 0px; "
                                    placeHolder="Search here!" AutoPostBack="True" OnTextChanged="searchTextBox_TextChanged" ToolTip="Search here"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>&nbsp;</td>

                        </tr>
                        <tr>
                            <td colspan="5" class="auto-style14">
                                <div class="grid-div">
                                    <asp:GridView ID="stockOutQuantityGridView" name="stockOutQuantityGridView" class="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" Width="100%" HorizontalAlign="Left" ShowHeaderWhenEmpty="True" Height="100%" Font-Names="Abel" Font-Size="20px" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="stockOutQuantityGridView_RowCancelingEdit" OnRowEditing="stockOutQuantityGridView_RowEditing" OnRowUpdating="stockOutQuantityGridView_RowUpdating">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl">
                                                <ItemTemplate>
                                                    <asp:Label ID="slLabel" runat="server" Text='<%#Container.DataItemIndex + 1 %>'></asp:Label>
                                                    <asp:HiddenField ID="idHiddenField" runat="server" Value='<%#Container.DataItemIndex%>' />


                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Company">
                                                <ItemTemplate>
                                                    <asp:Label ID="companyLabel" runat="server" Text='<%#Bind("Company") %>'></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CompanySl" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="companySlLabel" runat="server" Text='<%#Bind("CompanySl") %>'></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item">
                                                <ItemTemplate>
                                                    <asp:Label ID="itemNameLabel" runat="server" Text='<%#Bind("ItemName") %>'></asp:Label>
                                                   
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ItemSl" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="itemSlLabel" runat="server" Text='<%#Bind("ItemSl") %>'></asp:Label>
                                                   
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:Label ID="quantityLabel" runat="server" Text=' <%#Bind("Quantity") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="quantityGridTextBox" runat="server" style="width: 80px; height: 30px; font-size: 20px; font-family: 'Abel', sans-serif; margin-left: 10px;" Text=' <%#Bind("Quantity") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="In Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="inTimeLabel" runat="server" Text=' <%#Bind("InTime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="deleteLinkButton" runat="server" target="_blank" CommandName="deleteButton" OnClick="deleteLinkButton_OnClick">Delete</asp:LinkButton>
                                                    </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="False" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Names="abel" Font-Size="16pt" Height="18px" HorizontalAlign="Center" VerticalAlign="Middle" Width="480px" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BorderStyle="None" HorizontalAlign="Center" VerticalAlign="Top" BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                    <%-- <asp:GridView ID="stockOutGridView" runat="server"  OnRowDeleting="stockOutGridView_OnRowDeleting" OnSelectedIndexChanged="stockOutGridView_OnSelectedIndexChanged" AutoGenerateDeleteButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" AutoGenerateSelectButton="True">
                                        
                                        <AlternatingRowStyle BackColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Names="abel" Font-Size="16pt" Height="18px" HorizontalAlign="Center" VerticalAlign="Middle" Width="480px" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BorderStyle="None" HorizontalAlign="Center" VerticalAlign="Top" BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />

                                    </asp:GridView>--%>
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style15">&nbsp;</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="auto-style15">&nbsp;</td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </form>
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
      <%--  <script src="../javascript/Jquery_3.1.1.js"></script>
        <script src="../javascript/jQuery.dataTable.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#stockOutQuantityGridView').DataTable();
            });
        </script>--%>
    </body>

    </html>
</asp:Content>




