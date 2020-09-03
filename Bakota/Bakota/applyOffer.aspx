<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="applyOffer.aspx.cs" Inherits="Bakota.applyOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Serial Number"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="serial" runat="server" required="required" type="number"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Offer ID"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="offerid" runat="server" type="number"></asp:TextBox>
            <br />
            <asp:Button ID="apply" runat="server" Text="Apply Offer" OnClick="apply_Click" />
        </div>
        <asp:Panel ID="Panel1" runat="server">
            <asp:Button ID="ApplyAnotherOffer" runat="server" UseSubmitBehavior="false" Text="Apply Another Offer" OnClick="ApplyAnotherOffer_Click" />
            <asp:Button ID="back" runat="server" UseSubmitBehavior="false" Text="Go to Home Page" OnClick="back_Click" />
        </asp:Panel>
    </form>
</body>
</html>
