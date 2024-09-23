<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="GymMe.Views.LoginPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="h-full bg-gray-100">
<head runat="server">
    <title>GymMe - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body class="h-full flex items-center justify-center bg-gradient-to-r from-blue-500 to-indigo-600">
    <div class="max-w-md w-full space-y-8 bg-white p-10 rounded-xl shadow-2xl">
        <div>
            <h2 class="mt-6 text-center text-4xl font-extrabold text-gray-900">GymMe Login</h2>
            <p class="mt-2 text-center text-sm text-gray-600">
                Start your fitness journey today
            </p>
        </div>
        <form id="form1" runat="server" class="mt-8 space-y-6">
            <input type="hidden" name="remember" value="true" />
            <div class="rounded-md shadow-sm -space-y-px">
                <div>
                    <label for="TxtUsername" class="sr-only">Username</label>
                    <asp:TextBox ID="TxtUsername" runat="server" CssClass="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Username"></asp:TextBox>
                </div>
                <div>
                    <label for="TxtPassword" class="sr-only">Password</label>
                    <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" CssClass="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm" placeholder="Password"></asp:TextBox>
                </div>
            </div>

            <div class="flex items-center justify-between">
                <div class="flex items-center">
                    <asp:CheckBox ID="ChkRememberMe" runat="server" CssClass="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded" />
                    <label for="ChkRememberMe" class="ml-2 block text-sm text-gray-900">
                        Remember me
                    </label>
                </div>

                <div class="text-sm">
                    <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500">
                        Forgot your password?
                    </a>
                </div>
            </div>

            <div>
                <asp:Button ID="BtnLogin" runat="server" Text="Sign in" OnClick="BtnLogin_Click" CssClass="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" />
            </div>

            <asp:Label ID="LblError" runat="server" Text="" CssClass="text-red-500 text-sm text-center block"></asp:Label>

            <div class="text-sm text-center">
                <span class="text-gray-600">Don't have an account?</span>
                <asp:LinkButton ID="LBRegister" runat="server" OnClick="LBRegister_Click" CssClass="font-medium text-indigo-600 hover:text-indigo-500 ml-1">Register Here</asp:LinkButton>
            </div>
        </form>
    </div>
</body>
</html>