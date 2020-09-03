<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin Home Page.aspx.cs" Inherits="Bakota.Admin_Home_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>            
            <asp:Panel ID="Panel2" runat="server" Font-Bold="True" Font-Names="Courier New" Font-Size="X-Large" HorizontalAlign="Center" BackColor="Black" ForeColor="Lime" Height="40px">
                
                
                <asp:ImageButton ID="Logout" runat="server" OnClick="Logout_Click" AlternateText="Logout" Height="40px" ImageAlign="Left" ImageUrl="~/icons8-logout-rounded-left-100.png" Width="40px" />
                
                <asp:Button ID="add_mobile" runat="server"  Style="float: right; width: 10%; display: inline;" BackColor="Black" ForeColor="Lime" OnClick="add_mobile_Click" Text="Add Mobile" Width="70" Height="40" />
                ADMIN HOME PAGE



            </asp:Panel>
            <div>
                <asp:Panel ID="pnlLeft" runat="server" Style="float: left; width: 50%; display: inline;" Height="300px" Width="300px" BorderStyle="Ridge" BorderWidth="1px" BackColor="#333333" Font-Bold="True" Font-Names="Courier New" Font-Overline="False" HorizontalAlign="Center" BorderColor="Lime" ForeColor="Lime">
                    Handle Vendors
                    <br />
                    <br />
                    <br />
                    v<br />
                    Vendor you wish to activate
                    <br />
                    <br />
                    <asp:TextBox ID="InputUsername" runat="server"  placeholder="Type in the vendor's ID" Style="margin-left: 0px" Width="288px" BackColor="Black" ForeColor="#00CC00"></asp:TextBox>
                    <asp:Button ID="Activate" runat="server" Text="Activate" OnClick="Activate_Click" BackColor="Black" ForeColor="Lime"  />
                </asp:Panel>

                <asp:Panel ID="pnlRight" runat="server" Style="float: left; display: inline; width: 49.5%" Height="300px" Width="450px" BorderStyle="Ridge" BorderWidth="1px" BackColor="#333333" Font-Bold="True" Font-Names="Courier New" Font-Overline="False" HorizontalAlign="Center" BorderColor="Lime" ForeColor="Lime">
                    Handle Deals<br />
                    &nbsp;<br />
                    <asp:Panel ID="NewDeal" runat="server" Style="float: left; display: inline; width: 33%" BackColor="#686868" Height="200" HorizontalAlign="Center" Width="250px" Font-Names="Courier New" Font-Size="Small" BorderStyle="Dotted" Direction="LeftToRight">
                        Create Todays Deal
                        <br />
                        <br />
                        <asp:TextBox ID="DealAmount" placeholder="Deal Amount" type="number" min="0" max="100" runat="server"  BackColor="Black" Width="160" ForeColor="#00CC00"></asp:TextBox>
                        <br />
                        <br />
                        <asp:TextBox ID="ExpiryDate" type="date"  placeHolder="Expiry Date" runat="server" BackColor="Black" ForeColor="#00CC00" Width="160"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="CreateNewDeal" runat="server" Text="Create" OnClick="CreateNewDeal_Click" BackColor="Black" ForeColor="Lime" />


                    </asp:Panel>
                    <asp:Panel ID="AddDeal" runat="server" Style="float: left; display: inline; width: 32%" BackColor="#686868" Height="200" HorizontalAlign="Center" Width="250px" Font-Names="Courier New" Font-Size="Small" BorderStyle="Dotted" Direction="LeftToRight">
                        Add Deal
                        <br />
                        <br />
                        <asp:TextBox ID="DealID" placeholder="Deal ID"  type="number" runat="server" BackColor="Black" ForeColor="#00CC00"></asp:TextBox>
                        <br />
                        <br />
                        <asp:TextBox ID="ProductSerial" placeHolder="Product Serial_No" type="number"  runat="server" BackColor="Black" ForeColor="#00CC00"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" BackColor="Black" ForeColor="Lime" />
                        <br />

                    </asp:Panel>
                 <asp:Panel ID="RemoveDeal" runat="server" Style="float: left; display: inline; width: 32%" BackColor="#686868" Height="200" HorizontalAlign="Center" Width="250px" Font-Names="Courier New" Font-Size="Small" BorderStyle="Dotted" Direction="LeftToRight">
                     Remove Deal
                     <br />
                     <br />
                     <asp:TextBox ID="DealIDD" type="number" placeholder="Deal ID" runat="server" BackColor="Black" ForeColor="#00CC00"></asp:TextBox>
                     <br />
                     <br />
                     <br />
                     <br />
                     <asp:Button ID="Button2" runat="server" Text="Remove" BackColor="Black" ForeColor="Lime" OnClick="Button2_Click" />
                 </asp:Panel>

                </asp:Panel>
                
            </div>

        </div>
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Ridge" BorderWidth="5px" BackColor="Black" Font-Bold="True" Font-Names="Courier New" Font-Overline="True" HorizontalAlign="Center" ForeColor="Lime">
            Handle Orders<br />

            <asp:TextBox ID="ordertoproc" type="number" placeholder="Type in order's ID" runat="server" BorderColor="Black" ForeColor="#00CC00"></asp:TextBox>
            <asp:Button ID="process" runat="server" Text="Process" OnClick="process_Click" BackColor="Black" ForeColor="Lime" />
            <br />
            <br />
            <br />
            <asp:Button ID="Deals" runat="server" OnClick="Deals_Click" Text="Review Orders" Width="413px" BackColor="Black" ForeColor="Lime" />
        </asp:Panel>

        <asp:Panel ID="Panel3" runat="server" BorderStyle="Double" ScrollBars="Vertical">
            <asp:Label ID="lblTable" runat="server" />
        </asp:Panel>

    </form>
</body>
</html>
