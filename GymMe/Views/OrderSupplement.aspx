<%@ Page Title="Order Supplement" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="OrderSupplement.aspx.cs" Inherits="GymMe.Views.OrderSupplement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Tailwind CSS CDN link -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="mb-6 text-3xl font-bold text-center">Order Supplement</h1>
    <div class="overflow-x-auto">
        <asp:GridView ID="GVSupplement" runat="server" CssClass="min-w-full border border-gray-200 shadow-md rounded-lg" OnRowCommand="GVSupplement_RowCommand" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="SupplementID" HeaderText="ID" SortExpression="SupplementID" HeaderStyle-CssClass="px-4 py-3 text-sm font-medium text-gray-500 bg-gray-100" ItemStyle-CssClass="px-4 py-3 text-sm text-gray-500 bg-white border-b" />
                <asp:BoundField DataField="SupplementName" HeaderText="Name" SortExpression="SupplementName" HeaderStyle-CssClass="px-4 py-3 text-sm font-medium text-gray-500 bg-gray-100" ItemStyle-CssClass="px-4 py-3 text-sm text-gray-500 bg-white border-b" />
                <asp:BoundField DataField="SupplementExpiryDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Expiry Date" SortExpression="SupplementExpiryDate" HeaderStyle-CssClass="px-4 py-3 text-sm font-medium text-gray-500 bg-gray-100" ItemStyle-CssClass="px-4 py-3 text-sm text-gray-500 bg-white border-b" />
                <asp:BoundField DataField="SupplementPrice" HeaderText="Price" SortExpression="SupplementPrice" HeaderStyle-CssClass="px-4 py-3 text-sm font-medium text-gray-500 bg-gray-100" ItemStyle-CssClass="px-4 py-3 text-sm text-gray-500 bg-white border-b" />
                <asp:BoundField DataField="MsSupplementType.SupplementTypeName" HeaderText="Type" SortExpression="MsSupplementType.SupplementTypeName" HeaderStyle-CssClass="px-4 py-3 text-sm font-medium text-gray-500 bg-gray-100" ItemStyle-CssClass="px-4 py-3 text-sm text-gray-500 bg-white border-b" />
                <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="px-4 py-3">
                    <ItemTemplate>
                        <div class="flex items-center justify-center space-x-2">
                            <asp:TextBox ID="TxtQuantity" runat="server" TextMode="Number" CssClass="form-input w-16 text-center rounded-lg" placeholder="QTY"></asp:TextBox>
                            <asp:Button ID="BtnOrder" runat="server" Text="Order" CssClass="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-2 rounded-lg" UseSubmitBehavior="false" CommandName="Order" />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-600 mt-2"></asp:Label>
</asp:Content>
