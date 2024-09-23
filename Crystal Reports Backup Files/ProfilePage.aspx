<%@ Page Title="GymMe - Profile Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="GymMe.Views.ProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w-100 d-flex align-items-start justify-content-around gap-4 h-100">
        <div class="d-flex flex-column justify-content-center align-items-start w-75 h-100 p-5 border rounded-4 gap-2">
            <h2>Update Information</h2>
            <div class="d-flex flex-column align-items-start justify-content-center w-100">
                <asp:Label ID="LblName" runat="server" Text="Username" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TxtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="d-flex flex-column align-items-start justify-content-center w-100">
                <asp:Label ID="LblEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="d-flex flex-column align-items-start justify-content-center w-100">
                <asp:Label ID="LblGender" runat="server" Text="Gender" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="DDLGender" runat="server" CssClass="form-select">
                    <asp:ListItem Selected="True"></asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="d-flex flex-column align-items-start justify-content-center w-100">
                <asp:Label ID="LblDOB" runat="server" Text="Date of Birth" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TxtDOB" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Label ID="LblError" runat="server" Text=""></asp:Label>
            <asp:Button ID="BtnProfile" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="BtnProfile_Click" UseSubmitBehavior="false" />
        </div>
        <div class="d-flex flex-column justify-content-center align-items-start w-75 h-100 p-5 border rounded-4 gap-2">
            <h2>Update Password</h2>
            <div class="d-flex flex-column align-items-start justify-content-center w-100">
                <asp:Label ID="LblOldPassword" runat="server" Text="Old Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TxtOldPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="d-flex flex-column align-items-start justify-content-center w-100">
                <asp:Label ID="LblNewPassword" runat="server" Text="New Password" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TxtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Label ID="LblPasswordError" runat="server" Text=""></asp:Label>
            <asp:Button ID="BtnPassword" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="BtnPassword_Click" UseSubmitBehavior="false" />
        </div>
    </div>
</asp:Content>
