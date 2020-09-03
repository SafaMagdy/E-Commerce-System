<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer Registration.aspx.cs" Inherits="Bakota.Customer_Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="cust_username" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="input_cust_username" required="required" maxlength ="20" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="cust_first_name" runat="server" Text="First name"></asp:Label>
        <asp:TextBox ID="input_cust_first_name" required="required" maxlength ="20" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="cust_last_name" runat="server" Text="Last name"></asp:Label>
            <asp:TextBox ID="input_cust_last_name"  required="required" maxlength ="20" runat="server"></asp:TextBox>
            <p>
        <asp:Label ID="cust_password" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="input_cust_password" required="required" maxlength ="20" runat="server"></asp:TextBox>
            </p>
        <p>
        <asp:Label ID="cust_email" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="input_cust_email" required="required"  maxlength ="50" runat="server"></asp:TextBox>
            </p>
    <p>
        <asp:Button ID="cust_sumbit" runat="server" Text="Submit" OnClick="cust_sumbit_Click" />
        </p>
            </div>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    </form>
    </body>
</html>
