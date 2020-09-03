<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add or Remove from Wishlist.aspx.cs" Inherits="Bakota.Add_or_Remove_from_Wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:cornsilk" >
    <form id="form1" runat="server">
        <div>
            Please Enter the name of Wishlist you wish to Edit:<br />
            <asp:TextBox ID="wishlist_name" Maxlength="20" runat="server" required="required" Width="392px" ></asp:TextBox>
        </div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Please enter the serial number for a product you wish to add or remove"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="serialnumber" required="required" type="number" min="0" step="1" runat="server" Width="550px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="add" runat="server" Text="Add Item" OnClick="add_Click" Width="275px" />
            <asp:Button ID="remove" runat="server" Text="Remove Item" OnClick="remove_Click" Width="275px" />
            </p>
    </form>
</body>
</html>
