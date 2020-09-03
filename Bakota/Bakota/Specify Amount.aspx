<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Specify Amount.aspx.cs" Inherits="Bakota.Specify_Amount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="order_id" runat="server" Text="Order ID"></asp:Label>
        <asp:TextBox ID="input_order_id" input type="number" required min="0" value="0" step="1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="cach_amount" runat="server" Text="Cash Amount"></asp:Label>
        <asp:TextBox ID="input_cach_amount" input type="number" required min="0" value="0" step=".01" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="credit_amount" runat="server" Text="Credit Amount"></asp:Label>
        <asp:TextBox ID="input_credit_amount" input type="number" required  min="0" value="0" step=".01" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="submit_specify_amount" runat="server" Text="Submit" OnClick="submit_specify_amount_Click" />
    </form>
</body>
</html>
