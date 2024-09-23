<%@ Page Title="GymMe - Transaction History" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="HistoryPage.aspx.cs" Inherits="GymMe.Views.HistoryPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold text-gray-800 mb-6">Transaction History</h1>
        <div class="bg-white shadow-md rounded-lg overflow-hidden">
            <asp:GridView ID="GVHistory" runat="server" AutoGenerateColumns="False" CssClass="min-w-full divide-y divide-gray-200">
                <Columns>
                    <asp:BoundField DataField="TransactionID" HeaderText="ID" SortExpression="TransactionID"
                        ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"
                        HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                    <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" SortExpression="TransactionDate" DataFormatString="{0:MM/dd/yyyy}"
                        ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                        HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"
                        ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                        HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                    <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <ItemTemplate>
                            <asp:Button ID="BtnDetail" runat="server" Text="View Detail" UseSubmitBehavior="false" 
                                CssClass="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline transition duration-150 ease-in-out" 
                                CommandName="Detail" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="px-6 py-4 text-center text-gray-500">No transaction history available.</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
        <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-500 mt-4 block"></asp:Label>
    </div>
</asp:Content>