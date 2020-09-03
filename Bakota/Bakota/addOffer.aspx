<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addOffer.aspx.cs" Inherits="Bakota.addOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="amount_label" runat="server" Text="Offer Amount"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="amount" runat="server" required="required" type="number" min="0" max="100"></asp:TextBox>
            <br />
            <asp:Label ID="exp_label" runat="server" Text="Expiry Date"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="exp" runat="server" type="date" required="required"></asp:TextBox>
            <br />
            <asp:Button ID="add" runat="server" type="submit" Text="Add" OnClick="add_Click" />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <asp:Button ID="AddAnotherOffer" runat="server" UseSubmitBehavior="false" Text="Add Another Offer" OnClick="AddAnotherOffer_Click" />
            <asp:Button ID="back" runat="server" UseSubmitBehavior="false" Text="Go to Home Page" OnClick="back_Click"  />
        </asp:Panel>
    </form>
</body>
</html>
