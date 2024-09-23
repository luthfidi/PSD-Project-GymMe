<%@ Page Title="GymMe - Profile Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="GymMe.Views.ProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .transition { transition: all 0.3s ease-in-out; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-gray-100 min-h-screen py-12">
        <div class="container mx-auto px-4">
            <h1 class="text-3xl font-bold text-gray-800 mb-8 text-center">Your Profile</h1>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                    <div class="p-8">
                        <h2 class="text-2xl font-semibold mb-6 text-gray-700">Update Information</h2>
                        <div class="space-y-6">
                            <div>
                                <asp:Label ID="LblName" runat="server" Text="Username" CssClass="block text-sm font-medium text-gray-700 mb-1"></asp:Label>
                                <asp:TextBox ID="TxtName" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="block text-sm font-medium text-gray-700 mb-1"></asp:Label>
                                <asp:TextBox ID="TxtEmail" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Label ID="LblGender" runat="server" Text="Gender" CssClass="block text-sm font-medium text-gray-700 mb-1"></asp:Label>
                                <asp:DropDownList ID="DDLGender" runat="server" CssClass="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition">
                                    <asp:ListItem Selected="True">Select Gender</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div>
                                <asp:Label ID="LblDOB" runat="server" Text="Date of Birth" CssClass="block text-sm font-medium text-gray-700 mb-1"></asp:Label>
                                <asp:TextBox ID="TxtDOB" runat="server" TextMode="Date" CssClass="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Label ID="LblError" runat="server" Text="" CssClass="block mt-4 text-sm text-red-600"></asp:Label>
                        <asp:Button ID="BtnProfile" runat="server" Text="Update Profile" CssClass="w-full mt-6 px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition"></asp:Button>
                    </div>
                </div>
                <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                    <div class="p-8">
                        <h2 class="text-2xl font-semibold mb-6 text-gray-700">Update Password</h2>
                        <div class="space-y-6">
                            <div>
                                <asp:Label ID="LblOldPassword" runat="server" Text="Old Password" CssClass="block text-sm font-medium text-gray-700 mb-1"></asp:Label>
                                <asp:TextBox ID="TxtOldPassword" runat="server" TextMode="Password" CssClass="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Label ID="LblNewPassword" runat="server" Text="New Password" CssClass="block text-sm font-medium text-gray-700 mb-1"></asp:Label>
                                <asp:TextBox ID="TxtNewPassword" runat="server" TextMode="Password" CssClass="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Label ID="LblPasswordError" runat="server" Text="" CssClass="block mt-4 text-sm text-red-600"></asp:Label>
                        <asp:Button ID="BtnPassword" runat="server" Text="Update Password" CssClass="w-full mt-6 px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>