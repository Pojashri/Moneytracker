<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Tracker.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:300px; margin:auto; margin-top:100px; border:1px solid gray; padding:20px;">
            <h3 style="text-align:center;">Login</h3>
            <asp:Label ID="lblUser" runat="server" Text="Username: "></asp:Label>
            <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Label ID="lblPass" runat="server" Text="Password: "></asp:Label>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
            <br /><br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
            <br /><br />
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
