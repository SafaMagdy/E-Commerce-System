<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Bakota.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="cust_reg" runat="server" OnClick="cust_reg_Click" Text="Customer registration" />
        </div>
        <asp:Button ID="vend_reg" runat="server" Text="Vendor Registration" OnClick="vend_reg_Click" />
        <br />
        <asp:Button ID="login" runat="server" Text="Login" OnClick="login_Click" />
    </form>
</body>
</html>
