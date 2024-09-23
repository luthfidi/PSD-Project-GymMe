using GymMe.Controllers;
using GymMe.Models;
using GymMe.Modules;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GymMe.Views
{
	public partial class RegisterPage : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			LblError.ForeColor = System.Drawing.Color.Red;

			if (Session["user"] != null || Request.Cookies["user_cookie"] != null)
			{
				Response.Redirect("~/Views/HomePage.aspx");
				return;
			}
		}

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
			string username = TxtUsername.Text;
			string userEmail = TxtEmail.Text;
			string userDob = TxtDOB.Text;
			string userGender = DDLGender.SelectedValue;
			string userPassword = TxtPassword.Text;
			string confPassword = TxtConfirmPassword.Text;

			Response<MsUser> response = UserController.RegisterUser(username, userEmail, userDob, userGender, userPassword, confPassword);

			if (!response.Success)
			{
				LblError.Text = response.Message;
				return;
			}

			Response.Redirect("~/Views/LoginPage.aspx");
        }

		protected void LBLogin_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/Views/LoginPage.aspx");
		}
	}
}