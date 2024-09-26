<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="HistoryPage.aspx.cs" Inherits="GymMe.Views.HistoryPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="mb-4 text-2xl font-bold text-gray-700">History Page</h1>
    <div class="overflow-x-auto shadow-md sm:rounded-lg">
        <asp:GridView ID="GVHistory" runat="server" AutoGenerateColumns="False" CssClass="min-w-full divide-y divide-gray-200 bg-white">
            <Columns>
                <asp:BoundField DataField="TransactionID" HeaderText="ID" SortExpression="TransactionID" 
                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900" 
                    HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider" />
                
                <asp:BoundField DataField="MsUser.UserName" HeaderText="User" SortExpression="MsUser.UserName" Visible="false" 
                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" 
                    HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider" />
                
                <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" SortExpression="TransactionDate" DataFormatString="{0:MM/dd/yyyy}" 
                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" 
                    HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider" />
                
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" 
                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" 
                    HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider" />
                
                <asp:TemplateField HeaderText="Action" 
                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                    <ItemTemplate>
                        <asp:Button ID="BtnDetail" runat="server" Text="View Detail" UseSubmitBehavior="false" CssClass="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600" CommandName="Detail" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-500 mt-4 block"></asp:Label>
</asp:Content>

