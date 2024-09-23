<%@ Page Title="GymMe - Home Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="GymMe.Views.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .transition { transition: all 0.3s ease-in-out; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-gray-100 min-h-screen">
        <div class="container mx-auto px-4 py-8">
            <div class="bg-white shadow-xl rounded-lg overflow-hidden">
                <div class="p-6 sm:p-10">
                    <h1 class="text-4xl font-bold text-gray-800 mb-6">Welcome to GymMe</h1>
                    <div class="flex flex-col sm:flex-row items-start sm:items-center mb-8 space-y-2 sm:space-y-0 sm:space-x-4">
                        <div class="flex items-center">
                            <span class="text-lg text-gray-600">Welcome,</span>
                            <asp:Label ID="LblName" runat="server" Text="" CssClass="ml-2 font-semibold text-blue-600 text-xl"></asp:Label>
                        </div>
                        <div class="flex items-center">
                            <span class="text-gray-600">Role:</span>
                            <asp:Label ID="LblRole" runat="server" Text="" CssClass="ml-1 font-semibold text-green-600"></asp:Label>
                        </div>
                    </div>
                    <div id="CustomerDataText" runat="server" class="text-2xl font-bold text-gray-700 mb-6">Customer Data</div>
                    <div class="overflow-x-auto bg-gray-50 rounded-lg shadow">
                        <asp:GridView ID="GVUsers" runat="server" AutoGenerateColumns="False" CssClass="min-w-full divide-y divide-gray-200">
                            <HeaderStyle CssClass="bg-gray-200" />
                            <RowStyle CssClass="bg-white hover:bg-gray-50 transition" />
                            <AlternatingRowStyle CssClass="bg-gray-50 hover:bg-gray-100 transition" />
                            <Columns>
                                <asp:BoundField DataField="UserID" HeaderText="ID" SortExpression="UserID" 
                                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900" 
                                    HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                                <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" 
                                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" 
                                    HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                                <asp:BoundField DataField="UserEmail" HeaderText="Email" SortExpression="UserEmail" 
                                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" 
                                    HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                                <asp:BoundField DataField="UserDOB" HeaderText="Date of Birth" SortExpression="UserDOB" DataFormatString="{0:MM/dd/yyyy}" 
                                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" 
                                    HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                                <asp:BoundField DataField="UserGender" HeaderText="Gender" SortExpression="UserGender" 
                                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" 
                                    HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="px-6 py-10 text-center text-gray-500 bg-gray-50 rounded-lg">
                                    <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                        <path vector-effect="non-scaling-stroke" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m-9 1V7a2 2 0 012-2h6l2 2h6a2 2 0 012 2v8a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
                                    </svg>
                                    <h3 class="mt-2 text-sm font-medium text-gray-900">No customer data available</h3>
                                    <p class="mt-1 text-sm text-gray-500">Get started by adding a new customer.</p>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>