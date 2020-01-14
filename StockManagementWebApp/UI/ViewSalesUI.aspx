<%@ Page Title="" Language="C#" MasterPageFile="~/UI/AfterLogIn.Master" AutoEventWireup="true" CodeBehind="ViewSalesUI.aspx.cs" Inherits="StockManagementWebApp.UI.ViewSalesUI" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <!DOCTYPE html>
    <html>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
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
                background-image: url("/images/ItemSummary.jpeg");
            }

            /*form {
                position: relative;
                padding: 160px 150px;
            }*/



            .sectFour {
                height: 100%;
                position: relative;
                top: 70px;
            }



            .tbl-div {
                top: 60px;
                width: 100%;
                height: 750px;
            }

            .font-1 {
                padding-left: 350px;
                padding-top: 50px;
            }

            .auto-style3 {
                height: 40px;
            }

            .auto-style4 {
                height: 44px;
            }

            .pdf-btn {
                margin-left: 0px;
               
                height: 35px;
                width: 150px;
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
                top: 0px;
                left: 0px;
            }

                .pdf-btn:hover {
                    background: chartreuse;
                }

            .save-btn {
                margin-left: 40px;
             
                height: 35px;
                width: 120px;
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

                .save-btn:hover {
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

            .fromDate-txt {
                width: 300px;
                height: 35px;
                border: none;
               
                color: #fff;
                padding-left: 10px;
                background: rgba(0, 0, 0, 0);
                border: 1px solid #0078ff;
                font-family: 'abel', sans-serif;
                font-size: 16px;
                top: 0px;
                left: 1px;
            }

            .toDate-txt {
                width: 300px;
                height: 35px;
                border: none;
             
                color: #fff;
                padding-left: 10px;
                background: rgba(0, 0, 0, 0);
                border: 1px solid #0078ff;
                font-family: 'abel', sans-serif;
                font-size: 16px;
            }

            .auto-style5 {
                height: 37px;
            }

            .auto-style6 {
                height: 46px;
            }
            .auto-style7 {
                height: 40px;
                width: 212px;
            }
            .auto-style8 {
                height: 44px;
                width: 212px;
            }
            .auto-style9 {
                height: 37px;
                width: 212px;
            }
            .auto-style10 {
                height: 46px;
                width: 212px;
            }
            .auto-style11 {
                width: 212px;
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
                            <td class="auto-style7">
                                <asp:Label ID="Label1" runat="server" Style="margin-left: 100px; font-family: 'Abel'; font-size: 20px; color: #fff;" Text="From Date :"></asp:Label>
                                &nbsp;&nbsp;
                            </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="dateTimeFromTextBox" class="fromDate-txt" runat="server" TextMode="Date" ToolTip="Please enter a date"></asp:TextBox>

                            </td>
                            <td class="auto-style3"></td>
                            <td class="auto-style3"></td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                <asp:Label ID="Label2" runat="server" Style="margin-left: 100px; font-family: 'Abel'; font-size: 20px; color: #fff;" Text="To Date :"></asp:Label>

                            </td>
                            <td class="auto-style4">
                                <asp:TextBox ID="dateTimeToTextBox" name="dateTimeToTextBox" class="toDate-txt" runat="server" TextMode="Date" ToolTip="Please enter a date"></asp:TextBox>
                            </td>
                            <td class="auto-style4"></td>
                            <td class="auto-style4"></td>

                        </tr>
                        <tr>
                            <td class="auto-style9">
                                <asp:Label ID="Label3" runat="server" Style="margin-left: 100px; font-family: 'Abel'; font-size: 20px; color: #fff;" Text="Type :"></asp:Label>

                            </td>
                            <td class="auto-style5">
                                <asp:DropDownList ID="typeDropdownList" Style="width: 310px; height: 35px; border: none; color: #000; padding-left: 5px; border: 1px solid #0078ff; font-family: 'abel', sans-serif; font-size: 16px; top: 0px; left: 2px;" runat="server" OnSelectedIndexChanged="typeDropdownList_SelectedIndexChanged" ToolTip="Please select a type">
                                    <asp:ListItem>Select a Type</asp:ListItem>
                                    <asp:ListItem>Sale</asp:ListItem>
                                    <asp:ListItem>Damage</asp:ListItem>
                                    <asp:ListItem>Loss</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style5"></td>
                            <td class="auto-style5"></td>

                        </tr>
                        <tr>
                            <td class="auto-style10"></td>
                            <td class="auto-style6">
                                <asp:Button ID="exportAsPdf" class="pdf-btn" runat="server" Text="Export as PDF" OnClick="exportAsPdf_Click" ToolTip="Export gridview to PDF" />
                                <asp:Button ID="searchButton" class="save-btn" runat="server" Text="Search" OnClick="searchButton_Click" ToolTip="Search" />

                            </td>
                            <td class="auto-style6"></td>
                            <td class="auto-style6"></td>

                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style6">
                                <asp:Label ID="messageLabel" runat="server" ForeColor="Red" Style="font-family: 'comic Sans MS'; font-size: 12pt"></asp:Label>

                            </td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>

                        </tr>
                        <tr>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div class="grid-div">
                                    <asp:GridView ID="viewSalesBetweenTwoDatesGrid" class="grid" runat="server" AutoGenerateColumns="False" CellPadding="3" Width="100%" BorderStyle="None" BackColor="White" BorderColor="#CCCCCC" BorderWidth="0px" HorizontalAlign="Left" ShowHeaderWhenEmpty="True" Height="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%#Container.DataItemIndex + 1 %>'></asp:Label>
                                                    <asp:HiddenField ID="slHiddenField" runat="server" Value='<%#Container.DataItemIndex + 1 %>' />

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Company">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text=' <%#Eval("CompanyName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%#Eval("Item") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text=' <%#Eval("Quantity") %>'></asp:Label>
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
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style11"></td>
                            <td></td>
                            <td></td>
                            <td></td>

                        </tr>
                        <tr>
                            <td class="auto-style11"></td>
                            <td></td>
                            <td></td>
                            <td></td>

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

    </body>

    </html>
</asp:Content>
