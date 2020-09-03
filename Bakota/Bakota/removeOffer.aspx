<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="removeOffer.aspx.cs" Inherits="Bakota.removeOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Offer ID"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="offerid" runat="server" type="number"></asp:TextBox>
            <br />
            <asp:Button ID="remove" runat="server" Text="Remove Expired Offer" OnClick="remove_Click" />
        </div>
        <asp:Panel ID="Panel2" runat="server">
            <asp:Button  UseSubmitBehavior="false" ID="removeAnotherOffer" runat="server" Text="remove Another Offer" OnClick="removeAnotherOffer_Click" />

            <asp:Button UseSubmitBehavior="false" ID="back" runat="server" Text="Go to Home Page" OnClick="back_Click" />

        </asp:Panel>
    </form>
</body>
</html>
