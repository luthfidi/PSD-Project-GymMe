<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="HistoryPage.aspx.cs" Inherits="GymMe.Views.HistoryPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="mb-4">History Page</h1>
    <asp:GridView ID="GVHistory" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" OnRowCommand="GVHistory_RowCommand">
        <Columns>
            <asp:BoundField DataField="TransactionID" HeaderText="ID" SortExpression="TransactionID" />
            <asp:BoundField DataField="MsUser.UserName" HeaderText="User" SortExpression="MsUser.UserName" Visible="false" />
            <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" SortExpression="TransactionDate" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="BtnDetail" runat="server" Text="View Detail" UseSubmitBehavior="false" CssClass="btn btn-primary" CommandName="Detail" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
</asp:Content>
