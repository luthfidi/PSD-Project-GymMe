<%@ Page Title="Order Queue Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="OrderQueuePage.aspx.cs" Inherits="GymMe.Views.OrderQueuePage" %>
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
            <h1 class="text-3xl font-bold text-gray-800 mb-6">Order Queue</h1>
            <div class="bg-white shadow-xl rounded-lg overflow-hidden">
                <div class="overflow-x-auto">
                    <asp:GridView ID="GVOrders" runat="server" AutoGenerateColumns="False" CssClass="min-w-full divide-y divide-gray-200" OnRowCommand="GVOrders_RowCommand">
                        <HeaderStyle CssClass="bg-gray-50" />
                        <RowStyle CssClass="bg-white hover:bg-gray-50 transition" />
                        <AlternatingRowStyle CssClass="bg-gray-50 hover:bg-gray-100 transition" />
                        <Columns>
                            <asp:BoundField DataField="TransactionID" HeaderText="ID" SortExpression="TransactionID"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                            <asp:BoundField DataField="TransactionDate" HeaderText="Date" SortExpression="TransactionDate" DataFormatString="{0:MM/dd/yyyy HH:mm}"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                            <asp:BoundField DataField="MsUser.UserName" HeaderText="User" SortExpression="MsUser.UserName"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                            <asp:TemplateField HeaderText="Status" SortExpression="Status"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm"
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                <ItemTemplate>
                                    <span class='<%# GetStatusClass(Eval("Status").ToString()) %> px-2 inline-flex text-xs leading-5 font-semibold rounded-full'>
                                        <%# Eval("Status") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <ItemTemplate>
                                    <asp:Button ID="BtnHandle" runat="server" Text='<%# GetActionButtonText(Eval("Status").ToString()) %>' 
                                        CssClass='<%# GetActionButtonClass(Eval("Status").ToString()) %> py-2 px-4 rounded-md transition duration-300 ease-in-out'
                                        UseSubmitBehavior="false" CommandName="Handle" CommandArgument='<%# Eval("TransactionID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center py-10">
                                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                    <path vector-effect="non-scaling-stroke" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m-9 1V7a2 2 0 012-2h6l2 2h6a2 2 0 012 2v8a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
                                </svg>
                                <h3 class="mt-2 text-sm font-medium text-gray-900">No orders in queue</h3>
                                <p class="mt-1 text-sm text-gray-500">New orders will appear here when customers place them.</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
            <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-500 mt-4 block"></asp:Label>
        </div>
    </div>
</asp:Content>