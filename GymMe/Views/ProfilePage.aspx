<%@ Page Title="GymMe - Profile Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="GymMe.Views.ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <div class="p-6 bg-white rounded-lg shadow-md">
            <h2 class="text-2xl font-semibold mb-4">Update Information</h2>
            <div class="mb-4">
                <asp:Label ID="LblName" runat="server" Text="Username" CssClass="block text-sm font-medium text-gray-700"></asp:Label>
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-input w-full mt-1"></asp:TextBox>
            </div>
            <div class="mb-4">
                <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="block text-sm font-medium text-gray-700"></asp:Label>
                <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-input w-full mt-1"></asp:TextBox>
            </div>
            <div class="mb-4">
                <asp:Label ID="LblGender" runat="server" Text="Gender" CssClass="block text-sm font-medium text-gray-700"></asp:Label>
                <asp:DropDownList ID="DDLGender" runat="server" CssClass="form-select w-full mt-1">
                    <asp:ListItem Selected="True"></asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="mb-4">
                <asp:Label ID="LblDOB" runat="server" Text="Date of Birth" CssClass="block text-sm font-medium text-gray-700"></asp:Label>
                <asp:TextBox ID="TxtDOB" runat="server" TextMode="Date" CssClass="form-input w-full mt-1"></asp:TextBox>
            </div>
            <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-500"></asp:Label>
            <asp:Button ID="BtnProfile" runat="server" Text="Update" CssClass="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded w-full mt-4"></asp:Button>
        </div>
        <div class="p-6 bg-white rounded-lg shadow-md">
            <h2 class="text-2xl font-semibold mb-4">Update Password</h2>
            <div class="mb-4">
                <asp:Label ID="LblOldPassword" runat="server" Text="Old Password" CssClass="block text-sm font-medium text-gray-700"></asp:Label>
                <asp:TextBox ID="TxtOldPassword" runat="server" TextMode="Password" CssClass="form-input w-full mt-1"></asp:TextBox>
            </div>
            <div class="mb-4">
                <asp:Label ID="LblNewPassword" runat="server" Text="New Password" CssClass="block text-sm font-medium text-gray-700"></asp:Label>
                <asp:TextBox ID="TxtNewPassword" runat="server" TextMode="Password" CssClass="form-input w-full mt-1"></asp:TextBox>
            </div>
            <asp:Label ID="LblPasswordError" runat="server" Text="" CssClass="text-red-500"></asp:Label>
            <asp:Button ID="BtnPassword" runat="server" Text="Update" CssClass="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded w-full mt-4"></asp:Button>
        </div>
    </div>
</asp:Content>