<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Choose Credit Card.aspx.cs" Inherits="Bakota.Choose_Credit_Card" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="credit_card_number" runat="server" Text="Credit Card Number"></asp:Label>
        <asp:TextBox ID="input_credit_card_num" required="required" maxlength ="20" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="order_id" runat="server" Text="Order ID"></asp:Label>
        <asp:TextBox ID="input_order_id" input type="number" required min="0" value="0" step="1" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="submit_choice" runat="server" Text="Submit" OnClick="submit_choice_Click" />
    </form>
</body>
</html>
