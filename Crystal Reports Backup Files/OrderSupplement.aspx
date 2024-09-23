<%@ Page Title="Order Supplement" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="OrderSupplement.aspx.cs" Inherits="GymMe.Views.OrderSupplement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="mb-4">Order Supplement</h1>
    <asp:GridView ID="GVSupplement" runat="server" CssClass="table table-bordered table-striped" OnRowCommand="GVSupplement_RowCommand" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="SupplementID" HeaderText="ID" SortExpression="SupplementID" />
            <asp:BoundField DataField="SupplementName" HeaderText="Name" SortExpression="SupplementName" />
            <asp:BoundField DataField="SupplementExpiryDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Expiry Date" SortExpression="SupplementExpiryDate" />
            <asp:BoundField DataField="SupplementPrice" HeaderText="Price" SortExpression="SupplementPrice" />
            <asp:BoundField DataField="MsSupplementType.SupplementTypeName" HeaderText="Type" SortExpression="MsSupplementType.SupplementTypeName" />
            <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="d-flex align-items-center justify-content-center gap-2">
                <ItemTemplate>
                    <asp:TextBox ID="TxtQuantity" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="BtnOrder" runat="server" Text="Order" CssClass="btn btn-success" UseSubmitBehavior="false" CommandName="Order" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
</asp:Content>
