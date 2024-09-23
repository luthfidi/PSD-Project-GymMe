<%@ Page Title="GymMe - Update Supplement" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="UpdateSupplement.aspx.cs" Inherits="GymMe.Views.UpdateSupplement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:LinkButton ID="LBBack" runat="server" CssClass="align-items-start w-100 text-black" OnClick="LBBack_Click">&lt; Back to Manage Supplement</asp:LinkButton>
    <h1>Update Supplement</h1>
    <div class="d-flex flex-column align-items-start justify-content-center w-100">
        <asp:Label ID="LblName" runat="server" Text="Supplement Name" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="TxtName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="d-flex flex-column align-items-start justify-content-center w-100">
        <asp:Label ID="LblExpiry" runat="server" Text="Expiry Date" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="TxtExpiry" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="d-flex flex-column align-items-start justify-content-center w-100">
        <asp:Label ID="LblPrice" runat="server" Text="Supplement Price" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="TxtPrice" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="d-flex flex-column align-items-start justify-content-center w-100">
        <asp:Label ID="LblType" runat="server" Text="Supplement Type" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="DDLType" runat="server" CssClass="form-select"></asp:DropDownList>
    </div>
    <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
    <asp:Button ID="BtnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="BtnUpdate_Click" />
</asp:Content>
