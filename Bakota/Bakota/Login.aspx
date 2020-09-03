<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Bakota.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="login_username" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="input_login_username" required="required" maxlength ="20" runat="server"></asp:TextBox>
        </div>
        <asp:Label ID="login_password" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="input_login_password" required="required" maxlength ="20" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="login_submit" runat="server" Text="Submit" OnClick="login_submit_Click" />
    </form>
</body>
</html>
