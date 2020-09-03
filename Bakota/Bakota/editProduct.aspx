<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editProduct.aspx.cs" Inherits="Bakota.editProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Serial Number"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_serial" runat="server" required="required" type="number" ></asp:TextBox>
            <br />
            Product Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_name" runat="server" MaxLength="20"></asp:TextBox>
            <br />
            Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_category" runat="server" MaxLength="20"></asp:TextBox>
            <br />
            Product Description&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_desc" runat="server"></asp:TextBox>
            <br />
            Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_price" runat="server" type="number"></asp:TextBox>
            <br />
            Color&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="p_color" runat="server" MaxLength="20"></asp:TextBox>
            <br />
            <asp:Button ID="edit" runat="server" Text="Update" OnClick="edit_Click" />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <asp:Button ID="EditAnotherProduct" runat="server" UseSubmitBehavior="false" Text="Edit Another Product" OnClick="EditAnotherProduct_Click" />
            <asp:Button ID="back" runat="server" UseSubmitBehavior="false" Text="Go to Home Page" OnClick="back_Click" />
        </asp:Panel>
    </form>
</body>
</html>
