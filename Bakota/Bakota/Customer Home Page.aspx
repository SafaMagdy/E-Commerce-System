<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer Home Page.aspx.cs" Inherits="Bakota.Customer_Home_Page" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:ImageButton ID="Logout" runat="server" OnClick="Logout_Click" AlternateText="Logout" Height="40px" ImageAlign="Left" ImageUrl="~/icons8-logout-rounded-left-101.png" Width="40px" />
        <br />

        <br />
        <br />

        <asp:Label ID="lblTable" runat="server" />
        <br />
        <br />
        <asp:Button ID="add_mobile" runat="server" Text="Add Mobile" OnClick="add_mobile_Click" />
        <br />
        <br />
        <asp:Button ID="Add_credit_card" runat="server" Text="Add Credit Card" OnClick="Add_credit_card_Click" />
        <br />
        <br />
        <asp:Button ID="choose_credit_card" runat="server" Text="Choose Credit Card" OnClick="choose_credit_card_Click" />
        <br />
        <br />
        <asp:Button ID="show_Products" runat="server" Text="Show Products" OnClick="Page_Load1" />
        <br />
        <br />
        <asp:Button ID="create_wishlist" runat="server" Text="Create Wishlist" OnClick="create_wishlist_Click" />
        <br />
        <br />
        <asp:Button ID="add_or_remove_from_wishlist" runat="server" Text="Add Or Remove From Wishlist" OnClick="add_or_remove_from_wishlist_Click" />
        <br />
        <br />
        <asp:Button ID="add_to_cart" runat="server" Text="Add Or Remove From Cart" OnClick="add_to_cart_Click" />
        <br />
        <br />
        <asp:Button ID="make_order" runat="server" Text="Make Order" OnClick="Page_Load2" />
        <br />
        <br />
        <asp:Button ID="specify_amount" runat="server" Text="Specify Payment " OnClick="specify_amount_Click" />
        <p>
        <asp:Button ID="Cancel_order" runat="server" Text="Cancel Order" OnClick="Cancel_order_Click" />
        </p>
        <p>
        <asp:Label ID="Label1" runat="server" />
        </p>
    </form>
</body>
</html>
