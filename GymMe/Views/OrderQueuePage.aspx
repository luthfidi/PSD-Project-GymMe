<%@ Page Title="Order Queue Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="OrderQueuePage.aspx.cs" Inherits="GymMe.Views.OrderQueuePage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-2xl font-bold mb-4">Order Queue</h1>
    <div class="overflow-x-auto shadow-md sm:rounded-lg">
        <asp:GridView ID="GVOrders" runat="server" AutoGenerateColumns="False" CssClass="min-w-full divide-y divide-gray-200 bg-white" OnRowCommand="GVOrders_RowCommand">
            <Columns>
                <asp:BoundField DataField="TransactionID" HeaderText="ID" SortExpression="TransactionID" 
                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900" 
                    HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider" />
                
                <asp:BoundField DataField="TransactionDate" HeaderText="Date" SortExpression="TransactionDate" DataFormatString="{0:MM/dd/yyyy}" 
                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" 
                    HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider" />
                
                <asp:BoundField DataField="MsUser.UserName" HeaderText="User" SortExpression="MsUser.UserName" 
                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" 
                    HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider" />
                
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" 
                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-sm text-gray-500" 
                    HeaderStyle-CssClass="px-6 py-3 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider" />
                
                <asp:TemplateField HeaderText="Action" 
                    ItemStyle-CssClass="px-6 py-4 whitespace-nowrap text-right text-sm font-medium bg-white">
                    <ItemTemplate>
                        <asp:Button ID="BtnHandle" runat="server" Text="Handle Transaction" CssClass="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600" UseSubmitBehavior="false" CommandName="Handle" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-500 mt-4 block"></asp:Label>
</asp:Content>