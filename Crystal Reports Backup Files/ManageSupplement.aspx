<%@ Page Title="GymMe - Manage Supplement" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="ManageSupplement.aspx.cs" Inherits="GymMe.Views.ManageSupplement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="mb-4">Manage Supplement Page</h1>
    <asp:GridView ID="GVSupplement" runat="server" AutoGenerateColumns="False" OnRowUpdating="GVSupplement_RowUpdating" OnRowDeleting="GVSupplement_RowDeleting" CssClass="table table-bordered table-striped">
        <Columns>
            <asp:BoundField DataField="SupplementID" HeaderText="ID" SortExpression="SupplementID" />
            <asp:BoundField DataField="SupplementName" HeaderText="Name" SortExpression="SupplementName" />
            <asp:BoundField DataField="SupplementExpiryDate" HeaderText="Expiry Date" SortExpression="SupplementExpiryDate" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="SupplementPrice" HeaderText="Price" SortExpression="SupplementPrice" />
            <asp:BoundField DataField="MsSupplementType.SupplementTypeName" HeaderText="Supplement Type" SortExpression="MsSupplementType.SupplementTypeName" />
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:Button ID="BtnUpdate" runat="server" Text="Update" CssClass="btn btn-warning text-white" UseSubmitBehavior="false" CommandName="Update" />
                    <asp:Button ID="BtnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" UseSubmitBehavior="false" CommandName="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
    <asp:Button ID="BtnInsert" runat="server" Text="Insert New Supplement" OnClick="BtnInsert_Click" CssClass="btn btn-outline-success" />
</asp:Content>