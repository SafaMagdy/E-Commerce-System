<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delivery Person Home Page.aspx.cs" Inherits="Bakota.Delivery_Person_Home_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <p>
            <asp:ImageButton ID="Logout" runat="server" AlternateText="Logout" Height="40px" ImageAlign="Left" ImageUrl="~/icons8-logout-rounded-left-101.png" OnClick="Logout_Click" Width="40px" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
        <asp:Button ID="add_mobile" runat="server" Text="Add Mobile" OnClick="add_mobile_Click" />
        </p>
    </form>
</body>
</html>
