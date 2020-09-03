<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vendor Home Page.aspx.cs" Inherits="Bakota.Vendor_Home_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:ImageButton ID="Logout" runat="server" OnClick="Logout_Click" AlternateText="Logout" Height="40px" ImageAlign="Left" ImageUrl="~/icons8-logout-rounded-left-101.png" Width="40px" />
            <br />
            <br />
            <br />
        <asp:Button ID="add_mobile" runat="server" Text="Add Mobile" OnClick="add_mobile_Click" />
            <br />
            <br />
            <asp:Button ID="postProduct" runat="server" Text="Post a New Product" OnClick="postProduct_Click" Width="261px" />
       
            <br />
            <br />
            <asp:Button ID="viewProducts" runat="server" Text="View my Products" Width="262px" OnClick="viewProducts_Click" />
            <br />
            <br />
            <asp:Button ID="editProduct" runat="server" Text="Edit a Product"  Width="262px" OnClick="editProduct_Click" />
            <br />
            <br />
            <asp:Button ID="addOffer" runat="server" Text="Add a New Offer" Width="262px" OnClick="addOffer_Click" />
            <br />
            <br />
            <asp:Button ID="applyOffer" runat="server" Text="Apply Offer on a Product" Width="262px" OnClick="applyOffer_Click"  />
            <br />
            <br />
            <asp:Button ID="removeOffer" runat="server" Text="Remove Expired Offer" Width="262px" OnClick="removeOffer_Click" />
            <br />
            <br />
       
        </div>
    </form>
</body>
</html>
