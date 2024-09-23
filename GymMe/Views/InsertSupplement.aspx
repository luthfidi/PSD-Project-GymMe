<%@ Page Title="GymMe - Insert Supplement" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="InsertSupplement.aspx.cs" Inherits="GymMe.Views.InsertSupplement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .transition { transition: all 0.3s ease-in-out; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-gray-100 min-h-screen py-8">
        <div class="container mx-auto px-4">
            <asp:LinkButton ID="LBBack" runat="server" CssClass="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-blue-700 bg-blue-100 hover:bg-blue-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition mb-6" OnClick="LBBack_Click">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd" />
                </svg>
                Back to Manage Supplement
            </asp:LinkButton>
            <div class="max-w-2xl mx-auto bg-white shadow-xl rounded-xl overflow-hidden">
                <div class="px-8 py-6">
                    <h1 class="text-3xl font-bold mb-8 text-gray-800">Insert New Supplement</h1>
                    <div class="space-y-6">
                        <div>
                            <asp:Label ID="LblName" runat="server" Text="Supplement Name" CssClass="block text-sm font-medium text-gray-700 mb-1"></asp:Label>
                            <asp:TextBox ID="TxtName" runat="server" CssClass="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm transition"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="LblExpiry" runat="server" Text="Expiry Date" CssClass="block text-sm font-medium text-gray-700 mb-1"></asp:Label>
                            <asp:TextBox ID="TxtExpiry" runat="server" TextMode="Date" CssClass="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm transition"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="LblPrice" runat="server" Text="Supplement Price" CssClass="block text-sm font-medium text-gray-700 mb-1"></asp:Label>
                            <div class="mt-1 relative rounded-md shadow-sm">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <span class="text-gray-500 sm:text-sm">$</span>
                                </div>
                                <asp:TextBox ID="TxtPrice" runat="server" TextMode="Number" step="0.01" CssClass="block w-full pl-7 pr-12 sm:text-sm border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500 transition" placeholder="0.00"></asp:TextBox>
                            </div>
                        </div>
                        <div>
                            <asp:Label ID="LblType" runat="server" Text="Supplement Type" CssClass="block text-sm font-medium text-gray-700 mb-1"></asp:Label>
                            <asp:DropDownList ID="DDLType" runat="server" CssClass="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm transition"></asp:DropDownList>
                        </div>
                    </div>
                    <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-500 mt-4 block"></asp:Label>
                    <div class="mt-8">
                        <asp:Button ID="BtnInsert" runat="server" Text="Insert Supplement" CssClass="w-full flex justify-center py-3 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition" OnClick="BtnInsert_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>