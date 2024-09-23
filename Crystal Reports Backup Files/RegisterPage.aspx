<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="GymMe.Views.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="w-100 h-100">
<head runat="server">
    <title>GymMe - Register</title>
    <link href="~/Content/bootstrap.css" rel="stylesheet" />
</head>
<body class="w-100 h-100 d-flex justify-content-center align-items-center">
    <form id="form1" runat="server" class="d-flex flex-column align-items-center justify-content-center border rounded-3 py-5 px-xl-5 gap-2 shadow-sm m-5">
        <h1>Register Page</h1>
        <div class="d-flex gap-2 w-100">
            <div class="d-flex flex-column w-50">
                <div class="d-flex flex-column w-100">
                    <asp:Label ID="LblUsername" runat="server" Text="Username" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="TxtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="d-flex flex-column w-100">
                    <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="d-flex flex-column w-100">
                    <asp:Label ID="LblGender" runat="server" Text="Gender" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="DDLGender" runat="server" CssClass="form-select">
                        <asp:ListItem Selected="True"></asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="d-flex flex-column w-50">
                <div class="d-flex flex-column w-100">
                    <asp:Label ID="LblPassword" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="d-flex flex-column w-100">
                    <asp:Label ID="LblConfirmPassword" runat="server" Text="Confirm Password" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="TxtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="d-flex flex-column w-100">
                    <asp:Label ID="LblDOB" runat="server" Text="Date of Birth" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="TxtDOB" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <asp:Label ID="LblError" runat="server" Text="" CssClass="text-danger"></asp:Label>
        <div class="d-flex flex-column w-100">
            <asp:Button ID="BtnRegister" runat="server" Text="Register" OnClick="BtnRegister_Click" CssClass="btn btn-success" />
        </div>
        <asp:LinkButton ID="LBLogin" runat="server" OnClick="LBLogin_Click">Login Here</asp:LinkButton>
    </form>
</body>
</html>
