<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create Wishlist.aspx.cs" Inherits="Bakota.Create_Wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="wishlist_name" runat="server" Text="Please enter your Wishlist Name"></asp:Label>
        <br />
        <asp:TextBox ID="input_wishlist_name" required="required" maxlength ="20" runat="server" Width="250px" ToolTip="GO CREATIVE!!!"></asp:TextBox>
        <br />
        <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click"  Width="250px" BackColor="#CCFFFF" Font-Names="Bauhaus 93" />
    </form>
</body>
</html>
