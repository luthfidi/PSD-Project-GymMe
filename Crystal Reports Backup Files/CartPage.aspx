<%@ Page Title="GymMe - Cart Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="GymMe.Views.CartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="mb-4">Cart Page</h1>
    <asp:GridView ID="GVCart" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
        <Columns>
            <asp:BoundField DataField="MsSupplement.SupplementName" HeaderText="Supplement Name" SortExpression="MsSupplement.SupplementName" />
            <asp:BoundField DataField="MsSupplement.MsSupplementType.SupplementTypeName" HeaderText="Type" SortExpression="MsSupplement.MsSupplementType.SupplementTypeName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
    <div>
        <asp:Button ID="BtnCheckout" runat="server" Text="Checkout" CssClass="btn btn-primary" OnClick="BtnCheckout_Click" />
        <asp:Button ID="BtnClear" runat="server" Text="Clear Cart" CssClass="btn btn-danger" OnClick="BtnClear_Click" />
    </div>
</asp:Content>
