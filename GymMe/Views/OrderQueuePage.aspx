<%@ Page Title="Order Queue Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="OrderQueuePage.aspx.cs" Inherits="GymMe.Views.OrderQueuePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-gray-100 min-h-screen py-8">
        <div class="container mx-auto px-4">
            <h1 class="text-3xl font-bold text-gray-800 mb-6">Order Queue</h1>
            <div class="bg-white shadow-lg rounded-lg overflow-hidden">
                <div class="overflow-x-auto">
                    <asp:GridView ID="GVOrders" runat="server" AutoGenerateColumns="False" CssClass="min-w-full divide-y divide-gray-200" OnRowCommand="GVOrders_RowCommand">
                        <HeaderStyle CssClass="bg-gray-50" />
                        <RowStyle CssClass="bg-white" />
                        <AlternatingRowStyle CssClass="bg-gray-50" />
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
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                <ItemTemplate>
                                    <span class='<%# GetStatusClass(Eval("Status").ToString()) %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <ItemTemplate>
                                    <asp:Button ID="BtnHandle" runat="server" Text='<%# GetActionButtonText(Eval("Status").ToString()) %>' 
                                        CssClass='<%# GetActionButtonClass(Eval("Status").ToString()) %>'
                                        UseSubmitBehavior="false" CommandName="Handle" CommandArgument='<%# Eval("TransactionID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-500 mt-4 block"></asp:Label>
        </div>
    </div>
</asp:Content>