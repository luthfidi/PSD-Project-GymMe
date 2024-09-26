<%@ Page Title="GymMe - Cart Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="GymMe.Views.CartPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold text-gray-800 mb-6">Your Cart</h1>
        <div class="bg-white shadow-md rounded-lg overflow-hidden">
            <asp:GridView ID="GVCart" runat="server" AutoGenerateColumns="False" CssClass="min-w-full divide-y divide-gray-200">
                <Columns>
                    <asp:BoundField DataField="MsSupplement.SupplementName" HeaderText="Supplement Name" SortExpression="MsSupplement.SupplementName" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900" HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                    <asp:BoundField DataField="MsSupplement.MsSupplementType.SupplementTypeName" HeaderText="Type" SortExpression="MsSupplement.MsSupplementType.SupplementTypeName" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                </Columns>
                <EmptyDataTemplate>
                    <div class="px-6 py-4 text-center text-gray-500">Your cart is empty.</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
        <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-500 mt-4 block"></asp:Label>
        <div class="mt-6 flex justify-end space-x-4">
            <asp:Button ID="BtnClear" runat="server" Text="Clear Cart" CssClass="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline transition duration-150 ease-in-out" OnClick="BtnClear_Click" />
            <asp:Button ID="BtnCheckout" runat="server" Text="Checkout" CssClass="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline transition duration-150 ease-in-out" OnClick="BtnCheckout_Click" />
        </div>
    </div>
</asp:Content>