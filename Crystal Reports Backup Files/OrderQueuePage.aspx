<%@ Page Title="Order Queue Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="OrderQueuePage.aspx.cs" Inherits="GymMe.Views.OrderQueuePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Order Queue</h1>
    <asp:GridView ID="GVOrders" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" OnRowCommand="GVOrders_RowCommand">
        <Columns>
            <asp:BoundField DataField="TransactionID" HeaderText="ID" SortExpression="TransactionID" />
            <asp:BoundField DataField="TransactionDate" HeaderText="Date" SortExpression="TransactionDate" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="MsUser.UserName" HeaderText="User" SortExpression="MsUser.UserName" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="BtnHandle" runat="server" Text="Handle Transaction" CssClass="btn btn-primary" UseSubmitBehavior="false" CommandName="Handle" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
</asp:Content>
