<%@ Page Title="GymMe - Manage Supplement" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="ManageSupplement.aspx.cs" Inherits="GymMe.Views.ManageSupplement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-gray-100 min-h-screen py-8">
        <div class="container mx-auto px-4">
            <h1 class="mb-6 text-3xl font-bold text-gray-800">Manage Supplements</h1>
            <div class="bg-white shadow-lg rounded-lg overflow-hidden">
                <div class="overflow-x-auto">
                    <asp:GridView ID="GVSupplement" runat="server" AutoGenerateColumns="False" OnRowUpdating="GVSupplement_RowUpdating" OnRowDeleting="GVSupplement_RowDeleting" CssClass="min-w-full divide-y divide-gray-200">
                        <HeaderStyle CssClass="bg-gray-50" />
                        <RowStyle CssClass="bg-white" />
                        <AlternatingRowStyle CssClass="bg-gray-50" />
                        <Columns>
                            <asp:BoundField DataField="SupplementID" HeaderText="ID" SortExpression="SupplementID"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                            <asp:BoundField DataField="SupplementName" HeaderText="Name" SortExpression="SupplementName"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                            <asp:BoundField DataField="SupplementExpiryDate" HeaderText="Expiry Date" SortExpression="SupplementExpiryDate" DataFormatString="{0:MM/dd/yyyy}"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                            <asp:BoundField DataField="SupplementPrice" HeaderText="Price" SortExpression="SupplementPrice" DataFormatString="{0:C2}"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                            <asp:BoundField DataField="MsSupplementType.SupplementTypeName" HeaderText="Type" SortExpression="MsSupplementType.SupplementTypeName"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                                HeaderStyle-CssClass="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" />
                            <asp:TemplateField HeaderText="Actions"
                                ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <ItemTemplate>
                                    <asp:Button ID="BtnUpdate" runat="server" Text="Update" CssClass="bg-blue-500 hover:bg-blue-600 text-white py-1 px-3 rounded mr-2 transition duration-300 ease-in-out" UseSubmitBehavior="false" CommandName="Update" />
                                    <asp:Button ID="BtnDelete" runat="server" Text="Delete" CssClass="bg-red-500 hover:bg-red-600 text-white py-1 px-3 rounded transition duration-300 ease-in-out" UseSubmitBehavior="false" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this supplement?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-500 mt-4 block"></asp:Label>
            <asp:Button ID="BtnInsert" runat="server" Text="Add New Supplement" OnClick="BtnInsert_Click" CssClass="mt-6 bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded transition duration-300 ease-in-out" />
        </div>
    </div>
</asp:Content>