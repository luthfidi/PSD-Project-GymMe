<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="GymMe.Views.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="w-100 h-100">
<head runat="server">
    <title>GymMe - Login Page</title>
    <link href="~/Content/bootstrap.css" rel="stylesheet" />
</head>
<body class="d-flex justify-content-center align-items-center w-100 h-100">
    <form id="form1" runat="server" class="d-flex flex-column align-items-center justify-content-center border rounded-3 py-5 px-5 gap-2 shadow-sm w-25">
        <h1>Login Page</h1>
        <div class="d-flex flex-column w-100">
            <asp:Label ID="LblUsername" runat="server" Text="Username" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TxtUsername" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="d-flex flex-column w-100">
            <asp:Label ID="LblPassword" runat="server" Text="Password" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="d-flex gap-2 align-items-center justify-content-center w-100">
            <asp:CheckBox ID="ChkRememberMe" runat="server"  CssClass="form-check-input" />
            <asp:Label ID="LblRememberMe" runat="server" Text="Remember Me" CssClass="form-check-label"></asp:Label>
        </div>
        <asp:Label ID="LblError" runat="server" Text="" CssClass="text-danger"></asp:Label>
        <div class="w-100 d-flex align-items-center justify-content-center">
            <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" class="btn btn-success" />
        </div>
        <asp:LinkButton ID="LBRegister" runat="server" OnClick="LBRegister_Click">Register Here</asp:LinkButton>
    </form>
</body>
</html>
