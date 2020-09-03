<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add to Cart.aspx.cs" Inherits="Bakota.Add_to_Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:cornsilk;" >
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="sn" runat="server" Text="Please Enter Serial Number that you wish to Add or Remove from your Cart" ForeColor="Navy" Font-Bold="true" ></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="serialnumber" required="required" type="number" min="0" step="1" runat="server" Width="550px"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="add" runat="server" Text="Add Item" OnClick="add_Click" Width="275px" />
            <asp:Button ID="remove" runat="server" Text="Remove Item" OnClick="remove_Click" Width="275px" />
        </p>
    </form>
</body>
</html>
