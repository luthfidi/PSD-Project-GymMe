<%@ Page Title="GymMe - Home Page" Language="C#" MasterPageFile="~/Layouts/Navbar.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="GymMe.Views.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Home Page</h1>
    <div class="d-inline-flex fs-5">
        Welcome,&nbsp;
        <asp:Label ID="LblName" runat="server" Text="" CssClass="fw-bold"></asp:Label>
        . Role:&nbsp;
        <asp:Label ID="LblRole" runat="server" Text="" CssClass="text-decoration-underline"></asp:Label>
    </div>
    <asp:GridView ID="GVUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="ID"  SortExpression="UserID" />
            <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
            <asp:BoundField DataField="UserPassword" HeaderText="Password" SortExpression="UserPassword" />
            <asp:BoundField DataField="UserEmail" HeaderText="Email" SortExpression="UserEmail" />
            <asp:BoundField DataField="UserDOB" HeaderText="Date of Birth" SortExpression="UserDOB" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="UserGender" HeaderText="Gender" SortExpression="UserGender" />
        </Columns>
    </asp:GridView>
</asp:Content>