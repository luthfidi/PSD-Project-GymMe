<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="GymMe.Views.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="w-full h-full">
<head runat="server">
    <title>GymMe - Register</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet"/>
</head>
<body class="w-full h-full flex justify-center items-center bg-gray-100">
    <form id="form1" runat="server" class="flex flex-col items-center justify-center border rounded-lg py-12 px-12 gap-4 shadow-lg m-5 bg-white max-w-md">
        <h1 class="text-4xl font-bold mb-4">Register Page</h1>
        <div class="flex gap-4 w-full">
            <div class="flex flex-col w-1/2">
                <div class="flex flex-col w-full mb-4">
                    <asp:Label ID="LblUsername" runat="server" Text="Username" class="mb-2 font-semibold"></asp:Label>
                    <asp:TextBox ID="TxtUsername" runat="server" class="form-input px-3 py-2 border rounded-md"></asp:TextBox>
                </div>
                <div class="flex flex-col w-full mb-4">
                    <asp:Label ID="LblEmail" runat="server" Text="Email" class="mb-2 font-semibold"></asp:Label>
                    <asp:TextBox ID="TxtEmail" runat="server" class="form-input px-3 py-2 border rounded-md"></asp:TextBox>
                </div>
                <div class="flex flex-col w-full mb-4">
                    <asp:Label ID="LblGender" runat="server" Text="Gender" class="mb-2 font-semibold"></asp:Label>
                    <asp:DropDownList ID="DDLGender" runat="server" class="form-select px-3 py-2 border rounded-md">
                        <asp:ListItem Selected="True"></asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="flex flex-col w-1/2">
                <div class="flex flex-col w-full mb-4">
                    <asp:Label ID="LblPassword" runat="server" Text="Password" class="mb-2 font-semibold"></asp:Label>
                    <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" class="form-input px-3 py-2 border rounded-md"></asp:TextBox>
                </div>
                <div class="flex flex-col w-full mb-4">
                    <asp:Label ID="LblConfirmPassword" runat="server" Text="Confirm Password" class="mb-2 font-semibold"></asp:Label>
                    <asp:TextBox ID="TxtConfirmPassword" runat="server" TextMode="Password" class="form-input px-3 py-2 border rounded-md"></asp:TextBox>
                </div>
                <div class="flex flex-col w-full mb-4">
                    <asp:Label ID="LblDOB" runat="server" Text="Date of Birth" class="mb-2 font-semibold"></asp:Label>
                    <asp:TextBox ID="TxtDOB" runat="server" TextMode="Date" class="form-input px-3 py-2 border rounded-md"></asp:TextBox>
                </div>
            </div>
        </div>
        <asp:Label ID="LblError" runat="server" Text="" class="text-red-600 mb-4"></asp:Label>
        <div class="w-full flex items-center justify-center mb-4">
            <asp:Button ID="BtnRegister" runat="server" Text="Register" OnClick="BtnRegister_Click" class="btn bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-md"></asp:Button>
        </div>
        <asp:LinkButton ID="LBLogin" runat="server" OnClick="LBLogin_Click" class="text-blue-500 hover:underline">Login Here</asp:LinkButton>
    </form>
</body>
</html>