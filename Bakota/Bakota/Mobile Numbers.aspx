<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mobile Numbers.aspx.cs" Inherits="Bakota.Mobile_Numbers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <p>
            <asp:Label ID="add_number" runat="server" Text="Add Mobile Number"></asp:Label>
            &nbsp;<asp:TextBox ID="input_mob_num"  required="required" maxlength ="20" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="sub_mob_num" runat="server" Text="Submit" OnClick="sub_mob_num_Click" />
    </form>
</body>
</html>
