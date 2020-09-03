<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newProduct.aspx.cs" Inherits="Bakota.newProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
            Product Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_name" runat="server" required="required" MaxLength="20"></asp:TextBox>
            <br />
            Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_category" runat="server"  required="required" MaxLength="20"></asp:TextBox>
            <br />
            Product Description&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_desc" runat="server" required="required"></asp:TextBox>
            <br />
            Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_price" runat="server" required="required" type="number" min="0" step="0.01"></asp:TextBox>
            <br />
            Color&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_color" runat="server"  required="required" MaxLength="20"></asp:TextBox>
            <br />
            <asp:Button ID="post" runat="server" Text="Post" OnClick="post_Click" />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <asp:Button  UseSubmitBehavior="false" ID="anotherProduct" runat="server" Text="Add Another Product" OnClick="AnotherProduct_Click" />

            <asp:Button UseSubmitBehavior="false" ID="back" runat="server" Text="Go to Home Page" OnClick="back_Click" />

        </asp:Panel>
    </form>
</body>
</html>
