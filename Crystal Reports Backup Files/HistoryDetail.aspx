<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="HistoryDetail.aspx.cs" Inherits="GymMe.Views.HistoryDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:LinkButton ID="LBBack" runat="server" CssClass="align-items-start w-100 text-black" OnClick="LBBack_Click">&lt; Back to History Page</asp:LinkButton>
    <h1 class="mb-4">Detail Page</h1>
    <asp:GridView ID="GVDetail" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
        <Columns>
            <asp:BoundField DataField="MsSupplement.SupplementName" HeaderText="Supplement" SortExpression="MsSupplement.SupplementName" />
            <asp:BoundField DataField="MsSupplement.SupplementPrice" HeaderText="Price" SortExpression="MsSupplement.SupplementPrice" />
            <asp:BoundField DataField="MsSupplement.SupplementExpiryDate" HeaderText="Expiry Date" SortExpression="MsSupplement.SupplementExpiryDate" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        </Columns>
    </asp:GridView>
</asp:Content>
