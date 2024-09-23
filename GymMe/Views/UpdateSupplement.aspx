<%@ Page Title="GymMe - Update Supplement" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="UpdateSupplement.aspx.cs" Inherits="GymMe.Views.UpdateSupplement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex justify-center mb-6">
        <asp:LinkButton ID="LBBack" runat="server" CssClass="text-blue" OnClick="LBBack_Click">&lt; Back to Manage Supplement</asp:LinkButton>
    </div>
    <h1 class="text-2xl mt-4 mb-6 text-center">Update Supplement</h1>
    <div class="flex justify-center">
        <div class="max-w-md bg-white p-6 rounded-lg shadow-lg">
            <div class="mb-4">
                <asp:Label ID="LblName" runat="server" Text="Supplement Name" CssClass="mb-2 font-semibold"></asp:Label>
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-input px-3 py-2 border rounded-md w-full"></asp:TextBox>
            </div>
            <div class="mb-4">
                <asp:Label ID="LblExpiry" runat="server" Text="Expiry Date" CssClass="mb-2 font-semibold"></asp:Label>
                <asp:TextBox ID="TxtExpiry" runat="server" TextMode="Date" CssClass="form-input px-3 py-2 border rounded-md w-full"></asp:TextBox>
            </div>
            <div class="mb-4">
                <asp:Label ID="LblPrice" runat="server" Text="Supplement Price" CssClass="mb-2 font-semibold"></asp:Label>
                <asp:TextBox ID="TxtPrice" runat="server" TextMode="Number" CssClass="form-input px-3 py-2 border rounded-md w-full"></asp:TextBox>
            </div>
            <div class="mb-4">
                <asp:Label ID="LblType" runat="server" Text="Supplement Type" CssClass="mb-2 font-semibold"></asp:Label>
                <asp:DropDownList ID="DDLType" runat="server" CssClass="form-select px-3 py-2 border rounded-md w-full"></asp:DropDownList>
            </div>
            <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-600 mb-4"></asp:Label>
            <div class="flex justify-center">
                <asp:Button ID="BtnUpdate" runat="server" Text="Update" CssClass="btn bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md" OnClick="BtnUpdate_Click" />
            </div>
        </div>
    </div>
</asp:Content>
