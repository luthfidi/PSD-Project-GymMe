<%@ Page Title="GymMe - Transaction Detail" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="HistoryDetail.aspx.cs" Inherits="GymMe.Views.HistoryDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mx-auto px-4 py-8">
        <asp:LinkButton ID="LBBack" runat="server" CssClass="text-blue-500 hover:text-blue-600 mb-4 inline-block" OnClick="LBBack_Click">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline-block mr-1" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd" />
            </svg>
            Back to History
        </asp:LinkButton>
        <h1 class="text-3xl font-bold text-gray-800 mb-6">Transaction Detail</h1>
        <div class="bg-white shadow-md rounded-lg overflow-hidden">
            <asp:GridView ID="GVDetail" runat="server" AutoGenerateColumns="False" CssClass="min-w-full divide-y divide-gray-200">
                <Columns>
                    <asp:BoundField DataField="MsSupplement.SupplementName" HeaderText="Supplement" SortExpression="MsSupplement.SupplementName" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900" HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                    <asp:BoundField DataField="MsSupplement.SupplementPrice" HeaderText="Price" SortExpression="MsSupplement.SupplementPrice" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="MsSupplement.SupplementExpiryDate" HeaderText="Expiry Date" SortExpression="MsSupplement.SupplementExpiryDate" DataFormatString="{0:MM/dd/yyyy}" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                </Columns>
                <EmptyDataTemplate>
                    <div class="px-6 py-4 text-center text-gray-500">No details available for this transaction.</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>