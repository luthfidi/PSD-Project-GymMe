<%@ Page Title="Order Supplement" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="OrderSupplement.aspx.cs" Inherits="GymMe.Views.OrderSupplement" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-gray-100 min-h-screen py-8">
        <div class="container mx-auto px-4">
            <h1 class="text-4xl font-bold text-gray-800 mb-8 text-center">Order Supplement</h1>
            <div class="bg-white shadow-xl rounded-lg overflow-hidden">
                <div class="overflow-x-auto">
                    <asp:GridView ID="GVSupplement" runat="server" CssClass="min-w-full divide-y divide-gray-200" OnRowCommand="GVSupplement_RowCommand" AutoGenerateColumns="false">
                        <HeaderStyle CssClass="bg-gray-50" />
                        <RowStyle CssClass="bg-white hover:bg-gray-50 transition" />
                        <AlternatingRowStyle CssClass="bg-gray-50 hover:bg-gray-100 transition" />
                        <Columns>
                            <asp:BoundField DataField="SupplementID" HeaderText="ID" SortExpression="SupplementID" 
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" 
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900" />
                            <asp:BoundField DataField="SupplementName" HeaderText="Name" SortExpression="SupplementName" 
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" 
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" />
                            <asp:BoundField DataField="SupplementExpiryDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Expiry Date" SortExpression="SupplementExpiryDate" 
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" 
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" />
                            <asp:BoundField DataField="SupplementPrice" DataFormatString="{0:C}" HeaderText="Price" SortExpression="SupplementPrice" 
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" 
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" />
                            <asp:BoundField DataField="MsSupplementType.SupplementTypeName" HeaderText="Type" SortExpression="MsSupplementType.SupplementTypeName" 
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" 
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" />
                            <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <HeaderStyle CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                                <ItemTemplate>
                                    <div class="flex items-center justify-end space-x-2">
                                        <asp:TextBox ID="TxtQuantity" runat="server" TextMode="Number" CssClass="w-20 rounded-md border-gray-300 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50 transition" placeholder="Qty" min="1" />
                                        <asp:Button ID="BtnOrder" runat="server" Text="Order" CssClass="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition" UseSubmitBehavior="false" CommandName="Order" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center py-10">
                                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                    <path vector-effect="non-scaling-stroke" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 13h6m-3-3v6m-9 1V7a2 2 0 012-2h6l2 2h6a2 2 0 012 2v8a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
                                </svg>
                                <h3 class="mt-2 text-sm font-medium text-gray-900">No supplements available</h3>
                                <p class="mt-1 text-sm text-gray-500">Get started by adding new supplements to the inventory.</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
            <asp:Label ID="LblError" runat="server" Text="" CssClass="mt-4 block text-center text-red-600"></asp:Label>
        </div>
    </div>
</asp:Content>