<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vendor Registration.aspx.cs" Inherits="Bakota.Vendor_Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div>
            <asp:Label ID="vend_username" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="input_vend_username" required="required" maxlength ="20" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="vend_first_name" runat="server" Text="First name"></asp:Label>
            <asp:TextBox ID="input_vend_first_name" required="required" maxlength ="20" runat="server"></asp:TextBox>
            <br />
        </div>
            <asp:Label ID="vend_last_name" runat="server" Text="Last name"></asp:Label>
            <asp:TextBox ID="input_vend_last_name" required="required" maxlength ="20" runat="server"></asp:TextBox>
            <p>
        <asp:Label ID="vend_password" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="input_vend_password" required="required" maxlength ="20" runat="server"></asp:TextBox>
        </p>
        <p>
        <asp:Label ID="vend_email" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="input_vend_email" required="required" maxlength ="50" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Company_name" runat="server" Text="Company name"></asp:Label>
            <asp:TextBox ID="input_vend_company_name" required="required" maxlength ="20" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Bank_account_number" runat="server" Text="Bank account number"></asp:Label>
            <asp:TextBox ID="input_vend_bank_acc_number" required="required"  maxlength ="20" runat="server"></asp:TextBox>
            </p>
        <p>
        <asp:Button ID="vend_sumbit" runat="server" Text="Submit" OnClick="vend_sumbit_Click" />
        </p>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
