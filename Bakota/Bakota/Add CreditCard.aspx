<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add CreditCard.aspx.cs" Inherits="Bakota.Add_CreditCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:cornsilk;" >
   <form id="form1" runat="server">
        <div>
            <asp:Label ID="ccnumber" runat="server" Text="Credit Card Number" BorderStyle="Dotted" ></asp:Label>
            <asp:TextBox ID="creditcardnumber" input type="number" required="required" MaxLength ="20" runat="server" Width="264px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="ccexpiary" runat="server" Text="Expiry Date: Please Choose the Date, Month and Year" Font-Italic="true" ></asp:Label>
            <br />
            <asp:TextBox ID="doe" runat="server" TextMode="Date" required="required" Width="436px"></asp:TextBox>
            <br />
            <asp:Label ID="cccvv" runat="server" foreColor="#6666ff" Text="Card Security Code CVV"></asp:Label>
            <asp:TextBox ID="cc" input type="number" required="required" MaxLength ="4" runat="server" Width="223px"></asp:TextBox>
            <br />
        </div>
        <asp:Button ID="Add_credit_button" runat="server" Text="Add Credit Card Number" OnClick="Add_credit_button_Click" Width="429px" />
        <br />
    </form>
</body>
</html>
