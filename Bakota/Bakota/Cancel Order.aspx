<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cancel Order.aspx.cs" Inherits="Bakota.Cancel_Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="order_id" runat="server" Text="Order ID"></asp:Label>
            <asp:TextBox ID="input_order_id" input type="number" required min="0" value="0" step="1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
        </div>
    </form>
</body>
</html>
